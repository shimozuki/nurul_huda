import 'package:get/get.dart';
import 'package:appmuslim/controller/ayat.dart';

class BindingAyat extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerAyat());
  }
}
