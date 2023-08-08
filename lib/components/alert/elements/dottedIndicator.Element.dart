import 'package:flutter/material.dart';

import '../../../configs/appStyle.Config.dart';

class DottedIndicatorElement extends StatelessWidget {
  const DottedIndicatorElement({super.key,required this.currentIndex,required this.imagePaths});
  final List<String> imagePaths;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagePaths
        .map<Widget>((String imagePath) => _buildDot(imagePath)).toList(),
    );
  }

  
  Container _buildDot(String imagePath){
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == imagePaths.indexOf(imagePath)
          ? AppColor.whiteColor
          : AppColor.blueColor
      ),
    );
  }
}