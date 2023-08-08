import 'package:flutter/material.dart';

import '../../../configs/appStyle.Config.dart';
import '../../../data/appData.dart';

class ItemProductElement extends StatefulWidget {
  const ItemProductElement({super.key,this.icon,this.lable,this.onTap,this.color});
  final IconData? icon;
  final String? lable;
  final VoidCallback? onTap;
  final Color? color;
  @override
  State<ItemProductElement> createState() => _ItemProductElementState();
}

class _ItemProductElementState extends State<ItemProductElement> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.icon!=null
        ?ListTile(
          leading: CircleAvatar(
            backgroundColor: widget.color,
            maxRadius: 15,
            child: Icon(widget.icon,color: AppColor.whiteColor,size: 22,)
          ),
          title: Align(
            alignment: const Alignment(-1.1, 0),
            child: Text(widget.lable??"",style: DesignCourseAppTheme.body1,)
          ),
          trailing: Icon(Icons.chevron_right_sharp,color: AppColor.grey700,size: 35,),
          onTap: widget.onTap??(){}
        )
        :Container(
          color: AppColor.grey.withOpacity(.05),
          padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital*1.5,vertical: AppDatas.marginVerital-5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.lable??"",style: DesignCourseAppTheme.font16,),
              InkWell(
                onTap: (){
                  if(widget.onTap!=null){
                    widget.onTap;
                  }
                },
                child: Icon(Icons.chevron_right_sharp,color: AppColor.grey700,size: 35,),
              )
            ],
          ),
        ),
        Divider(
          height: 0,
          indent: AppDatas.marginHorital,
          endIndent: AppDatas.marginHorital,
          thickness: 1,
          color: AppColor.grey.withOpacity(.4),
        ),
      ],
    );
  }
}