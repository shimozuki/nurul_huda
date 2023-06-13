import 'package:get/get.dart';
import 'package:nurulhudautan/controller/ayat.dart';

class BindingAyat extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ControllerAyat());
  }
}
