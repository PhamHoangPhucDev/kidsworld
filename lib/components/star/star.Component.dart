import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

class StarComponent extends StatefulWidget {
  StarComponent({super.key,this.size = 13});
  double size;
  @override
  State<StarComponent> createState() => _StarComponentState();
}

class _StarComponentState extends State<StarComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,size: widget.size,color: AppColor.yellow,),
        Icon(Icons.star,size: widget.size,color: AppColor.yellow,),
        Icon(Icons.star,size: widget.size,color: AppColor.yellow,),
        Icon(Icons.star,size: widget.size,color: AppColor.yellow,),
        Icon(Icons.star,size: widget.size,color: AppColor.yellow,),
      ],
    );
  }
}