
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.leftColor,
    required this.rightColor,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    required this.buttonWeight,
  });
  final Color leftColor;
  final Color rightColor;
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double buttonWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            leftColor,
            rightColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: isLoading
          ? Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            )
          : TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}
