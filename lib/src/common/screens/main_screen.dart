import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/common/app_state_checker.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/screens/contries_screen.dart';

import 'no_internet_screen.dart';
import 'web_view_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<AppState>(
          future: AppStateChecker.getState(),
          builder: (BuildContext context, AsyncSnapshot<AppState> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return const ContriesScreen();
            }

            if (snapshot.hasData) {
              final AppState state = snapshot.data!;
              switch (state) {
                case AppState.dummy:
                  return const ContriesScreen();
                case AppState.noInternet:
                  return const NoInternetScreen();
                case AppState.main:
                  return WebViewScreen(
                    url: AppStateChecker.url,
                  );
                default:
                  return const ContriesScreen();
              }
            }

            return const ContriesScreen();
          }),
    );
  }
}
