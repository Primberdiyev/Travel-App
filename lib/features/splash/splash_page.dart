import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  void initState() {
    final User? currentUser = FirebaseAuth.instance.currentUser;

    Future.delayed(Duration(seconds: 3), () {
      if (currentUser == null && mounted) {
        Navigator.pushReplacementNamed(context, NameRoutes.signIn);
      } else if (mounted && currentUser != null) {
        Navigator.pushReplacementNamed(context, NameRoutes.signIn);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
      ),
    );
  }
}
