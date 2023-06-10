import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../../data/appData.dart';

class IconCatalog extends StatefulWidget {
  IconCatalog({super.key,this.icon,this.title = "",this.colorBackground = AppColor.nearlyBlue,this.onTap});
  IconData? icon;
  String? title;
  Color? colorBackground;
  VoidCallback? onTap;
  @override
  State<IconCatalog> createState() => _IconCatalogState();
}

class _IconCatalogState extends State<IconCatalog> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        if(widget.onTap!=null){
          widget.onTap;
        }
      },
      child: Column(
        children: [
          Container(
            height: size.width*.11,
            width: size.width*.11,
            decoration: BoxDecoration(
              color: widget.colorBackground,
              borderRadius: BorderRadius.circular(100) 
            ),
            child: Icon(
              widget.icon?? AppDatas.iconEmpty,
              color: AppColor.whiteColor,
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Text(
              widget.title!,
              style: TextStyle(
                color: AppColor.darkText.withOpacity(.65),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            )
          )
        ],
      ),
    );
  }
}