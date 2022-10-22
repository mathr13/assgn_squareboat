import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:assgn_news_squareboat/models/source_response.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../constants/widgets/sbsnackbar.dart';
import '../injector.dart';
import '../models/article.dart';
import '../services/failure_helper.dart';

class NewsController extends GetxController {

  final Map<String, bool> _sourcesOptionsTally = {};
  Map<String, bool> get sourcesTally => _sourcesOptionsTally;
  bool isSourceSelectionActive = false;

  final Map<String, bool> _locationsOptionsTally = {};
  Map<String, bool> get locationsTally => _locationsOptionsTally;

  final Map<String, bool> _sortOptionsTally = {};
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

  Future<void> fetchAllNewsArticlesWithConstraints(String location, {String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    showProgressBar();
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines(location, sources: sources, sortBy: sortBy);
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
    Either<Failure, SourcesResponse> response = await getIt.get<NewsRepository>().getAllSourcesForRegion(location);
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
    _locationsOptionsTally.putIfAbsent("au", () => false);
    _locationsOptionsTally.putIfAbsent("ca", () => false);
    _locationsOptionsTally.putIfAbsent("co", () => false);
    _locationsOptionsTally.putIfAbsent("in", () => true);
    _locationsOptionsTally.putIfAbsent("us", () => false);
    selectedLocation.value = _locationsOptionsTally.keys.first;
  }

  populateSortList() {
    _sortOptionsTally.putIfAbsent("relevancy", () => true);
    _sortOptionsTally.putIfAbsent("popularity", () => false);
    _sortOptionsTally.putIfAbsent("publishedAt", () => false);
    selectedSortingAttribute.value = _sortOptionsTally.keys.first;
  }

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
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getEverythingFor(selectedLocation.value, query: searchQuery, sources: sources, sortBy: sortBy);
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