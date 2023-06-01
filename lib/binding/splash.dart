import 'package:get/get.dart';
import 'package:appmuslim/controller/splash.dart';

class BindingSplash extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerSplash());
  }
}
