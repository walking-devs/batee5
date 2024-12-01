import 'package:batee5/1_features/authentication_feature/1_presentation/pages/sign_in/sign_in_screen.dart';

import 'package:batee5/1_features/change_location/change_location.dart';
import 'package:batee5/1_features/home_screen/home_screen.dart';
import 'package:batee5/1_features/search_screen/search_screen.dart';
import 'package:batee5/1_features/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

bool signedIn = false;

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        // return MaterialPageRoute(builder: (_) => SignInScreen());
        return MaterialPageRoute(
          builder:
              (_) => signedIn ? Wrapper(pages: [HomeScreen()]) : SignInScreen(),
        );

      case '/location':
        return MaterialPageRoute(builder: (_) => ChangeLocation());
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchScreen());
      default:
        return null;
    }
  }
}
