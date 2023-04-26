import 'package:get/get.dart';
import 'package:ny_articles/app/configs/api_end_points.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  getUrl({required String section, required String period}) {
    return '${APIEndPoints.baseUrl}mostpopular/v2/mostviewed/$section/$period.json?api-key=${APIEndPoints.key}';
  }
}
