import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/authorization/providers/auth_provider.dart';
import 'package:travel_app/features/splash/splash_page.dart';
import 'package:travel_app/utilities/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        home: SplashPage(),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
