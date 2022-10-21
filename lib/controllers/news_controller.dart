import 'package:assgn_news_squareboat/models/news_response.dart';
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

  var newsArticlesList = <Article>[].obs;

  var showProgressIndicator = true.obs;
  showProgressBar() => showProgressIndicator.value = true;
  hideProgressBar() => showProgressIndicator.value = false;

  Future<void> fetchAllNewsArticlesWithConstraints({String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? location, String? category, String? sources, String? domains}) async {
    showProgressBar();
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getTopHeadlines();
    response.fold(
      (l) => print(l),
      (r) {
        newsArticlesList.value = r.articles ?? [];
      }
    );
    hideProgressBar();
  }
  
  populateSourcesList() {
    _sourcesOptionsTally.putIfAbsent("VentureBeat", () => false);
    _sourcesOptionsTally.putIfAbsent("Hackaday", () => false);
    _sourcesOptionsTally.putIfAbsent("Entrepreneur", () => false);
    _sourcesOptionsTally.putIfAbsent("ReadWrite", () => false);
    _sourcesOptionsTally.putIfAbsent("Moz.com", () => false);
    _sourcesOptionsTally.putIfAbsent("Search Engine Journal", () => false);
  }

  populateLocationsList() {
    _locationsOptionsTally.putIfAbsent("India", () => false);
    _locationsOptionsTally.putIfAbsent("Australia", () => false);
    _locationsOptionsTally.putIfAbsent("USA", () => false);
    _locationsOptionsTally.putIfAbsent("Israel", () => false);
    _locationsOptionsTally.putIfAbsent("Germany", () => false);
    _locationsOptionsTally.putIfAbsent("Mexico", () => false);
    _locationsOptionsTally.putIfAbsent("Italy", () => false);
  }

}