import 'package:get/get.dart';
import 'package:news_app/core/network_service.dart';
import 'package:news_app/models/news_data_model.dart';

class NewsController extends GetxController {
  bool isLoading = false;
  bool isLoadingFiltered = false;
  NewsModelClass? newsData;
  NewsModelClass? accToFilter;
  @override
  void onInit() {
    loadNewsData('india');
    filteredNews('tesla');
    super.onInit();
  }

  Future loadNewsData(String category) async {
    isLoading = true;
    newsData = await NetworkService.getAllTodayArticles(category);
    isLoading = false;
    update();
  }

  Future filteredNews(String category) async {
    isLoadingFiltered = true;
    accToFilter = await NetworkService.getAllTodayArticles(category);
    isLoadingFiltered = false;
    update();
  }
}
