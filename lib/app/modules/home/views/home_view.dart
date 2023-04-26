import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ny_articles/app/configs/strings.dart';
import 'package:ny_articles/app/widgets/row_app_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RowAppBar(title: AppStrings.appName),
      body: Container(),
    );
  }
}
