import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:google_fonts/google_fonts.dart';
import '../models/setting_response.dart';
import '/utils/colors_utils.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';
import 'translation_service.dart';
import 'dart:convert' as convert;

class SettingsService extends GetxService {
final setting = SettingResponse().obs;

  Future<SettingsService> init() async {
    Get.log('Start SettingsService');

   var value = await _getJsonFile('assets/setting/setting.json');
    setting.value = SettingResponse.fromJson(value);

    return this;
  }

  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: _parseColor(secondaryLightColor),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        scaffoldBackgroundColor: _parseColor(scaffoldLightColor),
        dividerColor: _parseColor(accentLightColor, opacity: 0.1),
        focusColor: _parseColor(accentLightColor),
        hintColor: _parseColor(scaffoldDarkColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: _parseColor(secondaryDarkColor))),
        colorScheme: ColorScheme.light(
            primary: _parseColor(primaryLightColor),
            secondary: _parseColor(primaryLightColor)),
        unselectedWidgetColor: _parseColor(unSelectdTabColor),
        textTheme: GoogleFonts.getTextTheme(
            _getLocale().toString().startsWith('ar') ? 'Cairo' : 'Inter',
            TextTheme(
                headline6: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.15,
                    color: _parseColor(textFieldLightColor),
                    height: 1.3),
                headline5: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(textFieldLightColor),
                    height: 1.3),
                headline4: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                    color: _parseColor(textFieldLightColor),
                    height: 1.3),
                headline3: TextStyle(
                    fontSize: 47,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(textFieldLightColor),
                    height: 1.3),
                headline2: TextStyle(
                    fontSize: 58,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.5,
                    color: _parseColor(textFieldLightColor),
                    height: 1.4),
                headline1: TextStyle(
                    fontSize: 93,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -1.5,
                    color: _parseColor(textFieldLightColor),
                    height: 1.4),
                subtitle2: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                    color: _parseColor(textFieldLightColor),
                    height: 1.2),
                subtitle1: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15,
                    color: _parseColor(textFieldLightColor),
                    height: 1.2),
                bodyText2: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.25,
                    color: _parseColor(textFieldLightColor),
                    height: 1.2),
                bodyText1: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: _parseColor(textFieldLightColor),
                    height: 1.2),
                caption: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.4,
                    color: _parseColor(accentLightColor),
                    height: 1.2),
              button:  const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:  whiteColor,
                  letterSpacing: 1.25,
                height: 1.2
              ),
              overline: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5
              ),
            )));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF252525),
        secondaryHeaderColor: _parseColor(secondaryDarkColor),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor:  _parseColor(scaffoldDarkColor),
        brightness: Brightness.dark,
        //accentColor: _parseColor(primaryDarkColor),
        dividerColor: _parseColor(accentDarkColor, opacity: 0.1),
        focusColor: _parseColor(accentDarkColor),
        hintColor: _parseColor(scaffoldLightColor),
        toggleableActiveColor: _parseColor(primaryDarkColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: _parseColor(primaryLightColor))),
        colorScheme: ColorScheme.dark(
            primary: _parseColor(primaryDarkColor),
            secondary: _parseColor(primaryDarkColor)),
        unselectedWidgetColor: _parseColor(unSelectdTabColor),
        textTheme: GoogleFonts.getTextTheme(
            _getLocale().toString().startsWith('ar') ? 'Cairo' : 'Poppins',
            TextTheme(
              headline6: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.3),
              headline5: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.3),
              headline4: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.3),
              headline3: TextStyle(
                  fontSize: 47,
                  fontWeight: FontWeight.w400,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.3),
              headline2: TextStyle(
                  fontSize: 58,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.5,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.4),
              headline1: TextStyle(
                  fontSize: 93,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -1.5,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.4),
              subtitle2: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.2),
              subtitle1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.15,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.2),
              bodyText2: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.2),
              bodyText1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.2),
              caption: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  color: _parseColor(textFieldDarkColor),
                  height: 1.2),
              button:  const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:  whiteColor,
                  letterSpacing: 1.25,
                  height: 1.2
              ),
              overline: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5
              ),
            )));
  }

  Locale _getLocale() {

    String? _locale = PreferenceUtils.getString(prefLanguage);
    if (_locale == null || _locale.isEmpty) {
      _locale = setting.value.mobileLanguage;
    }

    return Get.find<TranslationService>().fromStringToLocale(_locale!);
  }

  ThemeMode getThemeMode() {

    String? _themeMode = PreferenceUtils.getString(prefThemeMode);

    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == 'dark') {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark
                .copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
                .copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }

 static _parseColor(String? hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode!.replaceAll('#', '0xFF')))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  Future<dynamic> _getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}
