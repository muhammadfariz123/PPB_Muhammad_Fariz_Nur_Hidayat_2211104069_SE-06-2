import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;
  void incrementCounter() {
    counter++;
  }

  void decrementCounter() {
    counter--;
  }
}
