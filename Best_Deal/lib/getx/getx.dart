import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

class Getx extends GetxController {
  RxInt count = 0.obs;

  countr() {
    count.value++;
  }
}
