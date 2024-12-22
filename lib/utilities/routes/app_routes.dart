import 'package:flutter/material.dart';
import 'package:travel_app/features/authorization/sign_in_page.dart';
import 'package:travel_app/features/authorization/sign_up_page.dart';
import 'package:travel_app/features/home/pages/home_page.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NameRoutes.signIn:
      return MaterialPageRoute(
        builder: (_) => SignInPage(),
      );
    case NameRoutes.signUp:
      return MaterialPageRoute(
        builder: (_) => SignUpPage(),
      );
    case NameRoutes.home:
      return MaterialPageRoute(
        builder: (_) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
