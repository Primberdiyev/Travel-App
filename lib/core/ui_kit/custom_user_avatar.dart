import 'package:flutter/material.dart';

class CustomUserAvatar extends StatelessWidget {
  const CustomUserAvatar({
    super.key,
    this.imageLink,
    required this.size,
    this.imagePath,
  });
  final String? imageLink;
  final double size;
  final String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFFFAEF20),
            Color(0xFFFAEF20),
            Color(0xFFD98160),
            Color(0xFFC94B80),
            Color(0xFFB814A0),
            Color(0xFFBD2198),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageLink != null
                ? NetworkImage(
                    imageLink ?? '',
                  )
                : AssetImage(imagePath ?? ""),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
