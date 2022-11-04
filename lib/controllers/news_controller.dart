import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:assgn_news_squareboat/models/source_response.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import '../constants/widgets/sbsnackbar.dart';
import '../injector.dart';
import '../models/article.dart';
import '../services/failure_helper.dart';

class NewsController extends GetxController {
  
  bool _isSourceSelectionActive = false;
  bool get isSourceSelectionActive => _isSourceSelectionActive;

  final Map<String, bool> _sourcesOptionsTally = {};
  final Map<String, bool> _locationsOptionsTally = {};
  final Map<String, bool> _sortOptionsTally = {};

  Map<String, bool> get sourcesTally => _sourcesOptionsTally;
  Map<String, bool> get locationsTally => _locationsOptionsTally;
  Map<String, bool> get sortTally => _sortOptionsTally;
  
  var newsArticlesList = <Article>[].obs;
  var filteredNewsArticlesList = <Article>[].obs;

  var showProgressIndicator = true.obs;
  showProgressBar() => showProgressIndicator.value = true;
  hideProgressBar() => showProgressIndicator.value = false;

  var selectedSortingAttribute = "".obs;
  var selectedLocation = "".obs;
  
  bool _haveRequestedOnce = false;
  bool get haveRequestedOnce => _haveRequestedOnce;
  
  bool _isConnectedToInternet = true;
  bool get connectionStatus => _isConnectedToInternet;

  late final String confidentialApiKey;

  loadApiKey() async {
    confidentialApiKey = await rootBundle.loadString(SBAssets.apiKey2);
  }

  Future<void> fetchAllNewsArticlesWithConstraints(String location, {String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    showProgressBar();
    await checkInternetConnection();
    if(!connectionStatus) {
      hideProgressBar();
      SBSnackbars.errorSnackbar(SBDisplayLabels.error, SBDisplayLabels.nointernetconnection);
      return;
    }
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines(confidentialApiKey, location, sources: sources, sortBy: sortBy);
    _haveRequestedOnce = true;
    response.fold(
      (l) {
        newsArticlesList.value = [];
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
      },
      (r) {
        newsArticlesList.value = r.articles ?? [];
        populateSourcesList(location);
      }
    );
    hideProgressBar();
  }
  
  populateSourcesList(String location) async {
    Either<Failure, SourcesResponse> response = await getIt.get<NewsRepository>().getAllSourcesForRegion(confidentialApiKey, location);
    response.fold(
      (l) {
        _sourcesOptionsTally.clear();
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
      },
      (r) {
        _sourcesOptionsTally.clear();
        r.sources?.forEach((source) => _sourcesOptionsTally.putIfAbsent(source.name ?? "", () => false));
      }
    );
  }

  populateLocationsList() {
    ["in", "au", "ca", "co", "us"].forEach((countryCode) => _locationsOptionsTally.putIfAbsent(countryCode, () => false));
    selectedLocation.value = _locationsOptionsTally.keys.first;
    _locationsOptionsTally[_locationsOptionsTally.keys.first] = true;
  }

  populateSortList() {
    ["relevancy", "popularity", "publishedAt"].forEach((sortOption) => _sortOptionsTally.putIfAbsent(sortOption, () => false));
    _sortOptionsTally[_sortOptionsTally.keys.first] = true;
    selectedSortingAttribute.value = _sortOptionsTally.keys.first;
  }

  Future<bool> checkInternetConnection() async {
    _isConnectedToInternet = await SimpleConnectionChecker.isConnectedToInternet();
    return _isConnectedToInternet;
  }

  initialiseFilters() => _isSourceSelectionActive = false;

  setSourceSelectionTo(bool isActive) => _isSourceSelectionActive = isActive;

}

extension SearchNews on NewsController {
  
  bool checkValidityOfQuery(String searchQuery) {
    if(searchQuery.length < 3) return false;
    return true;
  }

  initialiseSearch() {
    filteredNewsArticlesList.value = [];
  }

  searchForQuery(String searchQuery) {
    if(checkValidityOfQuery(searchQuery)) {
      fetchEverythingWithQueryConstraint(searchQuery: searchQuery);
    }else {
      initialiseSearch();
    }
  }

  Future<void> fetchEverythingWithQueryConstraint({required String searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    showProgressBar();
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getEverythingFor(confidentialApiKey, selectedLocation.value, query: searchQuery, sources: sources, sortBy: sortBy);
    response.fold(
      (l) {
        filteredNewsArticlesList.value = [];
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
      },
      (r) {
        filteredNewsArticlesList.value = r.articles ?? [];
      }
    );
    hideProgressBar();
  }

}