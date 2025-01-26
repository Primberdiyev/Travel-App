import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/features/splash/providers/splash_provider.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<SplashProvider>(
        create: (context) => SplashProvider()..chechRegister(),
        child: Consumer<SplashProvider>(builder: (
          context,
          value,
          child,
        ) {
          final condition = value.state.isCompleted;
          if (condition && !value.isRegister) {
            Future.delayed(Duration(seconds: 3), () {
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, NameRoutes.signIn);
              }
            });
          } else if (condition && value.isRegister) {
            Future.delayed(Duration(seconds: 3), () {
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, NameRoutes.home);
              }
            });
          }
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4AE8C5),
                  Color(0xFF6B7AFF),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppIcons.travel.icon,
                    height: 114,
                    width: 114,
                  ),
                  Text(
                    AppTexts.travel,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      fontFamily: 'Caveat',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
