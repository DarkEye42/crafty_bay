import 'package:crafty_bay/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:crafty_bay/core/state_holders/connection_state.dart';
import 'package:crafty_bay/core/themes/theme_switcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializePrerequisite();
  bool? isDarkModeEnabled = await loadTheme();
  runApp(
    CraftyBay(
      isDarkModeEnabled: isDarkModeEnabled,
    ),
  );
}

void initializePrerequisite() {
  Get.put(NetworkState());
  Get.find<NetworkState>().initialize();
  Get.put(ThemeSwitcher());
}

Future<bool?> loadTheme() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  return localStorage.getBool("isDarkModeEnabled");
}
