import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

class DefaultAppBarComponent extends StatefulWidget implements PreferredSizeWidget{
  DefaultAppBarComponent({super.key,this.leading = false,this.title = "",this.actions});
  final String? title;
  final bool? leading;
  final List<Widget>? actions;
  @override
  State<DefaultAppBarComponent> createState() => DefaultAppBarComponentState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class DefaultAppBarComponentState extends State<DefaultAppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.leading!,
      backgroundColor: AppColor.nearlyBlue,
      title: Text(widget.title!,style: DesignCourseAppTheme.font20White,),
      centerTitle: true,
      leading: widget.leading!
        ?IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded,size: 30,color: AppColor.whiteColor),
          onPressed: () {
            Navigator.pop(context,true);
          }
        ):const SizedBox(),
      actions: widget.actions,
    );
  }
}