import 'package:get/get.dart';
import 'package:ny_articles/app/configs/api_end_points.dart';
import 'package:ny_articles/app/models/article_model.dart';
import 'package:ny_articles/app/services/api_client.dart';

class HomeController extends GetxController {
  Rx<ArticleModel> popularArticles = ArticleModel().obs;

  @override
  void onInit() {
    getArticles("1");
    super.onInit();
  }

  getArticleUrl({required String section, required String period}) {
    return '${APIEndPoints.baseUrl}mostpopular/v2/mostviewed/$section/$period.json?api-key=${APIEndPoints.key}';
  }

  getArticles(String period) async {
    var response = await APIClient().get(getArticleUrl(section: APIEndPoints.allSection, period: period)).catchError((error) {
      throw error;
    });
    if (response == null) return;
    popularArticles.value = ArticleModel.fromJson(response);
    return popularArticles.value;
  }
}
