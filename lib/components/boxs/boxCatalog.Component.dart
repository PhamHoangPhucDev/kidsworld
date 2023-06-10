import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class BoxCatalogComponent extends StatefulWidget {
  BoxCatalogComponent({super.key,required this.listCatalog,this.title,this.rowGidview,this.axisExtent});
  final String? title;
  final List<Widget> listCatalog;
  final double? rowGidview; 
  final double? axisExtent;
  @override
  State<BoxCatalogComponent> createState() => _BoxCatalogComponentState();
}

class _BoxCatalogComponentState extends State<BoxCatalogComponent> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: size.height*.13,
      color: AppColor.whiteColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: widget.title!=null && widget.title!.isNotEmpty,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Text(widget.title??"",style: const TextStyle(color: AppColor.darkText,fontSize: 15,fontWeight: FontWeight.w700),),
                  ),
                  const SizedBox(height: 10,),
                ],
              )
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: widget.axisExtent??size.width*.2,
                childAspectRatio: widget.rowGidview??size.width/(size.height*.7),
                crossAxisSpacing: widget.axisExtent!=null?15:0,
                mainAxisSpacing: widget.axisExtent!=null?15:0
              ),
              children: widget.listCatalog.map((e) => e).toList(),
            ),
          ],
        ),
      ),
    );
  }
}