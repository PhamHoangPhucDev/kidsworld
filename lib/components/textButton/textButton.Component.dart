import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class TextButtonComponent extends StatefulWidget {
  const TextButtonComponent({super.key,this.height = 40,this.width,this.colorButton,this.label = "OK",this.imageLeft,this.onPressed});
  final double? height;
  final double? width;
  final Color? colorButton;
  final String? label;
  final String? imageLeft;
  final VoidCallback? onPressed;

  @override
  State<TextButtonComponent> createState() => _TextButtonComponentState();
}

class _TextButtonComponentState extends State<TextButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: widget.colorButton??AppColor.nearlyBlue, // Background Color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: widget.onPressed??(){},
        child: Stack(
          children: [
            widget.imageLeft!=null && widget.imageLeft!.isNotEmpty
              ?Image.network(widget.imageLeft!, fit: BoxFit.contain,)
              :SizedBox(),
            Align(
              child: Text(widget.label!,style: DesignCourseAppTheme.font16White,)
            )
          ],
        )
      ),
    );
  }
}