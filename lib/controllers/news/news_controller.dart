import 'package:assgn_news_squareboat/constants/constant_values.dart';
import 'package:assgn_news_squareboat/controllers/news/location_handler.dart';
import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:assgn_news_squareboat/models/source_response.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
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
  
  List<Article> newsArticlesList = [];
  List<Article> filteredNewsArticlesList = [];

  String selectedSortingAttribute = "";
  String selectedLocation = "";
  List<String> selectedFilters = [];
  var networkState = NetworkState.ideal.obs;
  int currentPageIndex = 1;
  int maxPageIndex = 1;
  final int pageCapacity = 20;

  late final String confidentialApiKey;

  loadApiKey() async {
    confidentialApiKey = SBAssets.apiKey2;
  }

  populateNews() async {
    populateSortList();
    initialiseFilters();
    String country = await populateLocationsList();
    fetchAllNewsArticlesWithConstraints(location: country);
  }

  Future<void> fetchAllNewsArticlesWithConstraints({String? location, String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    if(!isLocationValidated) {
      networkState.value = NetworkState.nolocation;
      SBSnackbars.errorSnackbar(SBDisplayLabels.error, SBDisplayLabels.errorfetchinglocation);
      return;
    }
    networkState.value = NetworkState.inprogress;
    await checkInternetConnection(NetworkState.inprogress);
    if(networkState.value == NetworkState.noconnection) {
      SBSnackbars.errorSnackbar(SBDisplayLabels.error, SBDisplayLabels.nointernetconnection);
      return;
    }
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines(confidentialApiKey, country: location, sources: sources?.commaSeperated(), sortBy: selectedSortingAttribute, pageSize: pageCapacity, page: currentPageIndex);
    response.fold(
      (l) {
        newsArticlesList = [];
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
        networkState.value = NetworkState.failed;
      },
      (r) {
        newsArticlesList = r.articles ?? [];
        maxPageIndex = getTotalPaginationCountFor(r.totalResults ?? newsArticlesList.length);
        if (location != null) populateSourcesList(location);
        networkState.value = NetworkState.succeeded;
      }
    );
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
    networkState.value = NetworkState.inprogress;
    try {
    _locationsOptionsTally.putIfAbsent(await getDeviceLocation(), () => true);
    ["IN", "AU", "CA", "CO", "US"].forEach((countryCode) => _locationsOptionsTally.putIfAbsent(countryCode, () => false));
    selectedLocation = _locationsOptionsTally.keys.first;
    networkState.value = NetworkState.succeeded;
    } catch (error) {
      networkState.value = NetworkState.nolocation;
    }
    return selectedLocation;
  }

  populateSortList() {
    ["relevancy", "popularity", "publishedAt"].forEach((sortOption) => _sortOptionsTally.putIfAbsent(sortOption, () => false));
    _sortOptionsTally[_sortOptionsTally.keys.first] = true;
    selectedSortingAttribute = _sortOptionsTally.keys.first;
  }

  checkInternetConnection(NetworkState state) async {
    bool status = await SimpleConnectionChecker.isConnectedToInternet();
    networkState.value = status ? state : NetworkState.noconnection;
  }

  int getTotalPaginationCountFor(int totalResults) {
    int count = (totalResults/pageCapacity).floor();
    if(totalResults%pageCapacity > 0) count++;
    return count;
  }

  initialiseFilters() => _isSourceSelectionActive = false;

  setSourceSelectionTo(bool isActive) => _isSourceSelectionActive = isActive;

  bool get isLocationValidated => selectedLocation != "";

  resetPagination() => currentPageIndex = 1;

  resetSources() => selectedFilters = [];

  setCurrentPageIndexTo(int index) => currentPageIndex = index;
}