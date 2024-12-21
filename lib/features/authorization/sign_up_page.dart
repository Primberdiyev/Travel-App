import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/core/ui_kit/custom_button.dart';
import 'package:travel_app/core/ui_kit/custom_text_field.dart';
import 'package:travel_app/features/authorization/widgets/agree_condition.dart';
import 'package:travel_app/features/authorization/widgets/auth_buttons.dart';
import 'package:travel_app/features/authorization/widgets/question_text.dart';
import 'package:travel_app/utilities/app_colors.dart';
import 'package:travel_app/utilities/app_icons.dart';
import 'package:travel_app/utilities/app_texts.dart';
import 'package:travel_app/utilities/routes/name_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(
        padding: EdgeInsets.only(
          left: 50,
          right: 50,
          top: 67,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, NameRoutes.signIn);
                },
                child: SvgPicture.asset(AppIcons.back.icon),
              ),
              SvgPicture.asset(
                AppIcons.travel.icon,
                height: 25,
                width: 25,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppTexts.signUp,
                style: TextStyle(
                  fontSize: 26,
                  color: AppColors.buttonColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.textFieldColor,
                child: SvgPicture.asset(
                  AppIcons.happy.icon,
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 15,
            ),
            child: CustomTextField(
              topText: AppTexts.name,
              hintText: AppTexts.smith,
              controller: nameController,
            ),
          ),
          CustomTextField(
            topText: AppTexts.email,
            hintText: AppTexts.exampleEmail,
            controller: emailController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomTextField(
              topText: AppTexts.password,
              hintText: AppTexts.hintTextDot,
              controller: passwordController,
            ),
          ),
          CustomTextField(
            topText: AppTexts.confirmPassword,
            hintText: AppTexts.hintTextDot,
            controller: confirmController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: AgreeCondition(),
          ),
          CustomButton(
            leftColor: AppColors.primary,
            rightColor: AppColors.buttonColor,
            text: AppTexts.signUp,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23),
            child: Text(
              AppTexts.orSignUp,
              textAlign: TextAlign.center,
            ),
          ),
          AuthButtons(),
          SizedBox(
            height: 10,
          ),
          QuestionText(
            questionText: AppTexts.haveAccount,
            signText: AppTexts.signIn,
          ),
        ],
      ),
    );
  }
}
