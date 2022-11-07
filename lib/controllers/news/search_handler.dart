import 'package:dartz/dartz.dart';

import '../../constants/constant_values.dart';
import '../../constants/widgets/sbsnackbar.dart';
import '../../injector.dart';
import '../../models/news_response.dart';
import '../../repositories/news_repository.dart';
import '../../services/failure_helper.dart';
import 'news_controller.dart';
import 'package:assgn_news_squareboat/utilities/utility_values.dart';

extension SearchHandler on NewsController {
  
  bool checkValidityOfQuery(String searchQuery) {
    if(searchQuery.length < 3) return false;
    return true;
  }

  initialiseSearch() {
    filteredNewsArticlesList = [];
  }

  searchForQuery(String searchQuery) {
    if(checkValidityOfQuery(searchQuery)) {
      fetchEverythingWithQueryConstraint(searchQuery: searchQuery);
    }else {
      initialiseSearch();
    }
  }

  Future<void> fetchEverythingWithQueryConstraint({required String searchQuery, List<DateTime>? dateRange, String? sortBy, String? category, List<String>? sources, String? domains}) async {
    networkState.value = NetworkState.inprogress;
    Either<Failure, NewsResponse> response = await getIt.get<NewsRepository>().getEverythingFor(confidentialApiKey, country: selectedLocation, query: searchQuery, sources: sources?.commaSeperated(), sortBy: sortBy);
    response.fold(
      (l) {
        filteredNewsArticlesList = [];
        networkState.value = NetworkState.failed;
        SBSnackbars.errorSnackbar(SBDisplayLabels.error, l.message);
      },
      (r) {
        filteredNewsArticlesList = r.articles ?? [];
        networkState.value = NetworkState.succeeded;
      }
    );
  }

  bool checkValidityOf(String searchQuery) {
    if(searchQuery.length < 3) return false;
    return true;
  }

  applySearchWith({required String searchQuery}) {
    if(checkValidityOf(searchQuery)) {
      fetchAllNewsArticlesWithConstraints(searchQuery: searchQuery);
    }else {
      // error
    }
  }

}