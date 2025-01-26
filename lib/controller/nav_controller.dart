import 'package:get/get.dart';

class NavController extends GetxController {
  // Reactive index to track selected tab
  var selectedIndex = 0.obs;

  // Method to update selected index
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
