import 'package:flutter/material.dart';

class PortfolioGalleryImageElement extends StatelessWidget {
  const PortfolioGalleryImageElement({super.key,required this.imagePath,required this.onImageTap});
  final String imagePath;
  final VoidCallback onImageTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink.image(
        image: NetworkImage(imagePath),
        fit: BoxFit.contain,
        child: InkWell(onTap: onImageTap),
      ),
    );
  }
}