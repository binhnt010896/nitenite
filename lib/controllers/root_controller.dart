import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RootController extends GetxController with GetTickerProviderStateMixin {
  var tabIndex = 0.obs;
  final PageController tabController = PageController();

  getCurrentTab() => tabIndex.value;
  selectTab(int index) {
    if (index != tabIndex.value) {
      tabIndex(index);
      tabController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInBack);
    }
  }
}