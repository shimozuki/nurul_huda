import 'package:get/get.dart';
import 'package:nurulhudautan/binding/ayat.dart';
import 'package:nurulhudautan/binding/main.dart';
import 'package:nurulhudautan/binding/shalat.dart';
import 'package:nurulhudautan/binding/splash.dart';
import 'package:nurulhudautan/view/page_main.dart';
import 'package:nurulhudautan/view/page_splash.dart';
import 'package:nurulhudautan/view/quran/page_ayat.dart';
import 'package:nurulhudautan/view/setting/page_setting.dart';
import 'package:nurulhudautan/view/shalat/page_shalat.dart';

class BaseRoute {
  static List<GetPage> pages() => [
        _getPage(
          name: PageTo.splash,
          page: SplashScreen(),
          binding: BindingSplash(),
        ),
        _getPage(
          name: PageTo.main,
          page: PageMain(),
          binding: BindingMain(),
        ),
        _getPage(
          name: PageTo.ayat,
          page: PageAyat(),
          binding: BindingAyat(),
        ),
        _getPage(
          name: PageTo.shalat,
          page: PageShalat(),
          binding: BindingShalat(),
        ),
        _getPage(
          name: PageTo.setting,
          page: PageSetting(),
        ),
      ];

  static GetPage _getPage({
    required var name,
    required var page,
    Bindings? binding,
  }) =>
      GetPage(
        name: name,
        page: () => page,
        binding: binding ?? null,
        transition: Transition.rightToLeft,
        transitionDuration: Duration(milliseconds: 400),
      );
}

class PageTo {
  static const splash = "/";
  static const main = "/main";
  static const ayat = "/ayat";
  static const shalat = "/shalat";
  static const setting = "/setting";
}
