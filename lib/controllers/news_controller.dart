import 'package:assgn_news_squareboat/models/news_response.dart';
import 'package:assgn_news_squareboat/models/source_response.dart';
import 'package:assgn_news_squareboat/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../injector.dart';
import '../models/article.dart';
import '../services/failure_helper.dart';

class NewsController extends GetxController {

  final Map<String, bool> _sourcesOptionsTally = {};
  Map<String, bool> get sourcesTally => _sourcesOptionsTally;

  final Map<String, bool> _locationsOptionsTally = {};
  Map<String, bool> get locationsTally => _locationsOptionsTally;

  final Map<String, bool> _sortOptionsTally = {};
  Map<String, bool> get sortTally => _sortOptionsTally;
  var newsArticlesList = <Article>[].obs;

  var showProgressIndicator = true.obs;
  showProgressBar() => showProgressIndicator.value = true;
  hideProgressBar() => showProgressIndicator.value = false;

  var selectedSortingAttribute = "".obs;
  var selectedLocation = "".obs;

  Future<void> fetchAllNewsArticlesWithConstraints(String location, {String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    showProgressBar();
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines(location, sources: sources, sortBy: sortBy);
    response.fold(
      (l) {
        print(l.message);
        newsArticlesList.value = [];
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
        print(l.message);
        _sourcesOptionsTally.clear();
      },
      (r) {
        _sourcesOptionsTally.clear();
        r.sources?.forEach((source) => _sourcesOptionsTally.putIfAbsent(source.name ?? "", () => false));
      }
    );
  }

  populateLocationsList() {
    _locationsOptionsTally.putIfAbsent("ar", () => false);
    _locationsOptionsTally.putIfAbsent("au", () => false);
    _locationsOptionsTally.putIfAbsent("br", () => false);
    _locationsOptionsTally.putIfAbsent("ca", () => false);
    _locationsOptionsTally.putIfAbsent("cn", () => false);
    _locationsOptionsTally.putIfAbsent("co", () => false);
    _locationsOptionsTally.putIfAbsent("de", () => false);
    _locationsOptionsTally.putIfAbsent("fr", () => false);
    _locationsOptionsTally.putIfAbsent("gb", () => false);
    _locationsOptionsTally.putIfAbsent("hk", () => false);
    _locationsOptionsTally.putIfAbsent("in", () => true);
    _locationsOptionsTally.putIfAbsent("id", () => false);
    _locationsOptionsTally.putIfAbsent("us", () => false);
    selectedLocation.value = "in";
  }

  populateSortList() {
    _sortOptionsTally.putIfAbsent("relevancy", () => true);
    _sortOptionsTally.putIfAbsent("popularity", () => false);
    _sortOptionsTally.putIfAbsent("publishedAt", () => false);
    selectedSortingAttribute.value = "relevancy";
  }

}