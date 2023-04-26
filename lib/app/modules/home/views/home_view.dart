import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ny_articles/app/configs/strings.dart';
import 'package:ny_articles/app/widgets/articles/article_list_view.dart';
import 'package:ny_articles/app/widgets/templates/page_template.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      pageTitle: AppStrings.appName,
      body: ArticleListView(articles: controller.popularArticles.value),
    );
  }
}
