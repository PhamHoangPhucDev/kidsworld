import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

class BoxTitleComponent extends StatefulWidget {
  BoxTitleComponent({super.key,this.title = "Tiêu đề",this.titleOnTap=">>",this.onTap});
  final String? title;
  final String? titleOnTap;
  final VoidCallback? onTap;

  @override
  State<BoxTitleComponent> createState() => _BoxTitleComponentState();
}

class _BoxTitleComponentState extends State<BoxTitleComponent> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      color: AppColor.brightBlue,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title!,style: TextStyle(color: AppColor.whiteColor,fontSize: 14,fontWeight: FontWeight.w600),),
          Visibility(
            visible: widget.onTap!=null,
            child: GestureDetector(
              onTap: (){
                if(widget.onTap!=null) widget.onTap;
              },
              child: Text(widget.titleOnTap!,style: TextStyle(color: AppColor.whiteColor,fontSize: 12,fontWeight: FontWeight.w500),),
            ),
          )
        ],
      ),
    );
  }
}