import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/extensions/build_context_extension.dart';
import 'package:travel_app/core/ui_kit/custom_button.dart';
import 'package:travel_app/core/ui_kit/custom_text_field.dart';
import 'package:travel_app/features/authorization/providers/auth_provider.dart';
import 'package:travel_app/features/authorization/widgets/auth_buttons.dart';
import 'package:travel_app/features/authorization/widgets/question_text.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';
import 'package:travel_app/utilities/statuses.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.only(
          top: 125,
          right: 50,
          left: 50,
        ),
        children: [
          Center(
            child: SvgPicture.asset(
              AppIcons.travel.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 73, bottom: 51),
            child: Text(
              AppTexts.signInAccount,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: AppColors.signInAccount,
              ),
            ),
          ),
          CustomTextField(
            topText: AppTexts.email,
            hintText: AppTexts.hintText,
            controller: emailController,
          ),
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 37),
            child: CustomTextField(
              topText: AppTexts.password,
              hintText: AppTexts.hintTextDot,
              controller: passwordController,
            ),
          ),
          Consumer<AuthProvider>(builder: (
            context,
            provider,
            child,
          ) {
            return CustomButton(
              buttonWeight: MediaQuery.of(context).size.width - 102,
              isLoading: provider.state == Statuses.loading,
              leftColor: AppColors.primary,
              rightColor: AppColors.buttonColor,
              text: AppTexts.signIn,
              onPressed: () {
                provider
                    .signIn(
                  email: emailController.text,
                  password: passwordController.text,
                )
                    .then((_) {
                  if (context.mounted && provider.state == Statuses.completed) {
                    Navigator.pushReplacementNamed(context, NameRoutes.home);
                  } else {
                    if (context.mounted) {
                      context.showSnackBar(AppTexts.notRegistered);
                    }
                  }
                });
              },
            );
          }),
          Padding(
            padding: EdgeInsets.only(
              top: 26,
              bottom: 30,
            ),
            child: Text(
              textAlign: TextAlign.center,
              AppTexts.orSignInWith,
            ),
          ),
          AuthButtons(),
          SizedBox(
            height: 40,
          ),
          QuestionText(
            questionText: AppTexts.dontHaveAccount,
            signText: AppTexts.signUp,
            onPressed: () {
              Navigator.pushReplacementNamed(context, NameRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
