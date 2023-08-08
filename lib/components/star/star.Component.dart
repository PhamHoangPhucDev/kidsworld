import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

typedef void RatingChangeCallback(double rating);

class StarComponent extends StatelessWidget {
  StarComponent({super.key,this.size = 13,this.starCount = 5, this.rating = 5, this.onRatingChanged,});
  double size;
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        size: size,
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        size: size,
        Icons.star_half,
        color: AppColor.yellow,
      );
    } else {
      icon = Icon(
        size: size,
        Icons.star,
        color: AppColor.yellow,
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: icon,
    );
  }
}