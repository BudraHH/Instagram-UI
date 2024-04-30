import 'package:flutter/material.dart';
import 'package:instagramui/features/comment/comment_page.dart';
import 'dart:developer' as developer;

import 'package:instagramui/features/home/home_page.dart';
import 'package:instagramui/features/main_page.dart';

class AuthorizedNavigation extends StatefulWidget {
  static const ROUTE_NAME = 'AuthorizedNavigation';
  @override
  _AuthorizedNavigationState createState() => _AuthorizedNavigationState();
}

class _AuthorizedNavigationState extends State<AuthorizedNavigation> {
  static const TAG = 'AuthorizedNavigation';

  GlobalKey<NavigatorState> navigator = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigator,
          onGenerateRoute: (setting) {
            switch(setting.name) {
              case CommentPage.ROUTE_NAME:
                return MaterialPageRoute(
                    builder: (context) => CommentPage(
                        setting.arguments as String
                    ),
                    settings: setting
                );
              default:
                return MaterialPageRoute(builder: (context) => MainPage());
            }
          },
          initialRoute: MainPage.ROUTE_NAME,
        ),
        onWillPop: () async {
          return !(await navigator.currentState!.maybePop());
        });
  }
}
