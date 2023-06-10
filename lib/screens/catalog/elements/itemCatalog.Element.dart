import 'package:flutter/material.dart';

import '../../../configs/appStyle.Config.dart';

class ItemCalalogElement extends StatefulWidget {
  const ItemCalalogElement({super.key,this.onTap,this.color = AppColor.nearlyBlue,this.imgPath,this.title = ""});
  final Color color;
  final String? imgPath;
  final String title;
  final VoidCallback? onTap;
  @override
  State<ItemCalalogElement> createState() => _ItemCalalogElementState();
}

class _ItemCalalogElementState extends State<ItemCalalogElement> {
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
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: AppColor.darkText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ),
              widget.imgPath!=null
              ?Expanded(flex: 1,child: Image.network(widget.imgPath!,fit: BoxFit.contain,))
              :Image.asset("assets/images/error.png",fit: BoxFit.fill,),
            ],
          ),
        ),
      ),
    );
  }
}