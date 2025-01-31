import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utilities/app_images.dart';

class UserImageStories extends StatelessWidget {
  const UserImageStories({
    super.key,
    required this.images,
    required this.isLoading,
  });
  final List images;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        mainAxisExtent: size.height * 0.29,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        final double height = (index % 4 == 0 || index % 4 == 2)
            ? size.height * 0.29
            : size.height * 0.21;

        return SizedBox(
          height: height,
          child:
              // Container(
              //   height: height,
              //   color: Colors.black,
              // ),
              !isLoading
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: images[index],
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Image.asset(
                            AppImages.parij,
                            fit: BoxFit.fill,
                          );
                        },
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) {
                          return Image.asset(
                            AppImages.parij,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    )
                  : Image.asset(
                      AppImages.parij,
                      fit: BoxFit.cover,
                    ),
        );
      },
    );
  }
}
