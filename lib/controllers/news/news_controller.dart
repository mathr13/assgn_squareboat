import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/controllers/news/location_handler.dart';
import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:assgn_news_squareboat/models/source_response.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

import 'package:assgn_news_squareboat/utilities/utility_values.dart';
import '../../constants/widgets/sbsnackbar.dart';
import '../../injector.dart';
import '../../models/article.dart';
import '../../services/failure_helper.dart';

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

  populateNews() async {
    populateSortList();
    initialiseFilters();
    String country = await populateLocationsList();
    fetchAllNewsArticlesWithConstraints(location: country);
  }

  Future<void> fetchAllNewsArticlesWithConstraints({String? location, String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    showProgressBar();
    await checkInternetConnection();
    if(!connectionStatus) {
      hideProgressBar();
      SBSnackbars.errorSnackbar(SBDisplayLabels.error, SBDisplayLabels.nointernetconnection);
      return;
    }
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines(confidentialApiKey, country: location, sources: sources?.commaSeperated(), sortBy: sortBy);
    _haveRequestedOnce = true;
    response.fold(
      (l) {
        newsArticlesList.value = [];
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
      },
      (r) {
        newsArticlesList.value = r.articles ?? [];
        if (location != null) populateSourcesList(location);
      }
    );
    hideProgressBar();
  }
  
  populateSourcesList(String location) async {
    _isSourceSelectionActive = false;
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

  Future<String> populateLocationsList() async {
    _locationsOptionsTally.putIfAbsent(await getDeviceLocation(), () => true);
    ["IN", "AU", "CA", "CO", "US"].forEach((countryCode) => _locationsOptionsTally.putIfAbsent(countryCode, () => false));
    selectedLocation.value = _locationsOptionsTally.keys.first;
    return selectedLocation.value;
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