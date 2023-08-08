import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../carouselSlider/imgSlider.Component.dart';

class Alert {
  // static ListPhotoImage(BuildContext context ,{required List<String> imagePaths}){
  static ListPhotoImage(BuildContext context ,{required List imagePaths}){
    return ImageSliderComponent(
      listSrcImage: imagePaths,
      boxFit: BoxFit.contain,
      onTapAlert: true ,
    );
  }

  static void showMsgDialog(BuildContext context, String msg,{String? title}){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(title??"Thông báo"),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(Alert),
            child: const Text("OK")
          )
        ],
      ),
    );
  }
}