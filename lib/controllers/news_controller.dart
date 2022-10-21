import 'package:get/get.dart';

class NewsController extends GetxController {

  final Map<String, bool> _sourcesOptionsTally = {};
  Map<String, bool> get sourcesTally => _sourcesOptionsTally;

  final Map<String, bool> _locationsOptionsTally = {};
  Map<String, bool> get locationsTally => _locationsOptionsTally;

  var showProgressIndicator = true.obs;
  showProgressBar() => showProgressIndicator.value = true;
  hideProgressBar() => showProgressIndicator.value = false;

  Future<void> fetchAllNewsArticlesWithConstraints({String? searchQuery, List<DateTime>? dateRange, String? sortBy, String? location, String? category, String? sources, String? domains}) async {
    showProgressBar();
    populateSourcesList();
    populateLocationsList();
    await Future.delayed(const Duration(seconds: 3));
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