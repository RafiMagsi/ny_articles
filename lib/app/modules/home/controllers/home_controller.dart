import 'package:get/get.dart';
import 'package:ny_articles/app/configs/api_end_points.dart';
import 'package:ny_articles/app/models/article_model.dart';

class HomeController extends GetxController {
  Rx<ArticleModel> popularArticles = ArticleModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  getArticleUrl({required String section, required String period}) {
    return '${APIEndPoints.baseUrl}mostpopular/v2/mostviewed/$section/$period.json?api-key=${APIEndPoints.key}';
  }
}
