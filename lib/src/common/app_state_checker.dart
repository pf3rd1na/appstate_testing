import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_sport_news/src/common/url_saver.dart';

import 'firebase_connect.dart';

DeviceInfoPlugin _devinfo = DeviceInfoPlugin();

enum AppState {
  initial,
  noInternet,
  dummy,
  main,
}

class AppStateChecker {
  static AppState _appstate = AppState.initial;
  static String url = '';

  static Future<AppState> getState() async {
    final hasInternet = await _checkInternetConnectivity();

    if (!hasInternet) {
      _appstate = AppState.noInternet;
      return _appstate;
    }

    final isSimulator = await _isSimulator();
    var link = await PrefsManager.getUrl();

    if (link == null || link.isEmpty) {
      link = await FirebaseConnect.loadLink();

      if (link == null) {
        _appstate = AppState.noInternet;
      } else if (isSimulator || link.isEmpty) {
        _appstate = AppState.dummy;
      } else {
        url = link;
        _appstate = AppState.main;
        PrefsManager.saveUrl(url);
      }
    } else {
      url = link;
      _appstate = AppState.main;
    }
    return _appstate;
  }

  static Future<bool> _checkInternetConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> _isSimulator() async {
    final em = await _devinfo.androidInfo;
    final phoneModel = em.model;
    final buildProduct = em.product;
    final buildHardware = em.hardware;
    var result = (em.fingerprint.startsWith("generic") ||
        phoneModel.contains("google_sdk") ||
        phoneModel.contains("droid4x") ||
        phoneModel.contains("Emulator") ||
        phoneModel.contains("Android SDK built for x86") ||
        em.manufacturer.contains("Genymotion") ||
        buildHardware == "goldfish" ||
        buildHardware == "vbox86" ||
        buildProduct == "sdk" ||
        buildProduct == "google_sdk" ||
        buildProduct == "sdk_x86" ||
        buildProduct == "vbox86p" ||
        em.brand.contains('google') ||
        em.board.toLowerCase().contains("nox") ||
        em.bootloader.toLowerCase().contains("nox") ||
        buildHardware.toLowerCase().contains("nox") ||
        !em.isPhysicalDevice ||
        buildProduct.toLowerCase().contains("nox"));
    if (result) return true;
    result = result ||
        (em.brand.startsWith("generic") && em.device.startsWith("generic"));
    if (result) return true;
    result = result || ("google_sdk" == buildProduct);
    return result;
  }
}
