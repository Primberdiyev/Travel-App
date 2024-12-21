import 'package:flutter/material.dart';
import 'package:travel_app/features/authorization/sign_in_page.dart';
import 'package:travel_app/utilities/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
      onGenerateRoute: generateRoute,
    );
  }
}
