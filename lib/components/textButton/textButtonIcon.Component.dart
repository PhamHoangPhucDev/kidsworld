import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class TextButtonIconComponent extends StatefulWidget {
  const TextButtonIconComponent({super.key,this.icon,this.label = "OK",this.onPress,this.color,this.colorBackground,this.height,this.width});
  final IconData? icon;
  final String? label;
  final VoidCallback? onPress;
  final Color? color;
  final Color? colorBackground;
  final double? width;
  final double? height;
  @override
  State<TextButtonIconComponent> createState() => _TextButtonIconComponentState();
}

class _TextButtonIconComponentState extends State<TextButtonIconComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.colorBackground??AppColor.whiteColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: widget.color??AppColor.nearlyBlue,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2)
            )
          )
        ),
        onPressed: widget.onPress??(){},
        icon: Icon(widget.icon,color: widget.color??AppColor.nearlyBlue,size: 23,),
        label: Text(widget.label!,style: TextStyle(color: widget.color??AppColor.nearlyBlue,fontSize: 16,),)
      ),
    );
  }
}