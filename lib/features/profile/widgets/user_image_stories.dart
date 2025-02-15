import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      itemBuilder: (context, index) {
        return GridItem(
          height: ((index + 1) % 2 + 3) * 80,
          imageUrl: images[index],
        );
      },
      itemCount: images.length,
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.imageUrl,
    required this.height,
  });
  final double height;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
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
    );
  }
}
