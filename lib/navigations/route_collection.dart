import 'package:flutter/foundation.dart';
import 'package:get/get.dart' show GetPage;
import '../views/setting/language_page.dart';
import '../views/setting/theme_mode_page.dart';
import '../views/views.dart';
import '../bindings/bindings.dart';
import '../navigations/route_name.dart';
import '../views/views.dart';

class RouteCollection {
  static final routeCollection = [
    GetPage(
        name: RouteName.rootRoute,
        page: () => SplashPage(),
        binding: SplashBinding()),


    GetPage(
        name: RouteName.loginRoute,
        page: () =>const LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: RouteName.homeRoute,
        page: () => HomePage(),
        binding: HomeBinding()),




    GetPage(
        name: RouteName.themeModeRoute,
        page: () => const ThemeModePage(),
        binding: SettingsBinding()),
    GetPage(
        name: RouteName.languageRoute,
        page: () => const LanguagePage(),
        binding: SettingsBinding()),



  ];
}
