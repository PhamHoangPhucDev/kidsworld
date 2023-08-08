import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../data/appData.dart';
import '../../models/apps/product.Model.dart';
import '../boxs/boxProduct.Component.dart';
import '../skelton/skelton.Component.dart';

class ListViewComponent extends StatefulWidget {
  ListViewComponent({super.key, this.onTap,this.horizontalType,this.future,this.textNull,this.onRefresh});
  final Function(int,List<ProductModel>)? onTap;
  final bool? horizontalType;
  final Future<List<ProductModel>>? future;
  final String? textNull;
  final Function? onRefresh;
  @override
  State<ListViewComponent> createState() => _ListViewComponentState();
}

class _ListViewComponentState extends State<ListViewComponent> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FutureBuilder<List<ProductModel>>(
        future: widget.future,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.data!=null && snapshot.data!.isNotEmpty){
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: (widget.horizontalType??false)?Axis.horizontal:Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, index){
                  return listViewType(
                    BoxProductComponent(
                      onRefresh: widget.onRefresh,
                      prd: snapshot.data![index],
                      horizontalType: !(widget.horizontalType??false),
                      onTap: (){
                        if(widget.onTap!=null){
                          widget.onTap!(index,snapshot.data!);
                        }
                      }
                    )
                  );
                }
              );
            } else {
              return SizedBox(
                height: size.height,
                child: Center(child: Text((widget.textNull??'').toUpperCase(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: AppColor.nearlyBlue),))
              );
            }
          } else if(snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"),);
          }
          return SkeltonComponent(horizontalType: widget.horizontalType??false,);
        }
      );
      // return ListView.builder(
      //       shrinkWrap: true,
      //       scrollDirection: (widget.horizontalType??false)?Axis.horizontal:Axis.vertical,
      //       itemCount: widget.listProduct.length,
      //       itemBuilder: (BuildContext context, index){
      //         return listViewType(
      //           BoxProductComponent(
      //             idUser: widget.userData?.code,
      //             prd: widget.listProduct[index],
      //             horizontalType: !(widget.horizontalType??false),
      //             onTap: (){
      //               if(widget.onTap!=null){
      //                 widget.onTap!(index);
      //               }
      //             }
      //           )
      //         );
      //       }
      //     );
  }

  Widget listViewType(Widget item){
    Widget result = const SizedBox();
    if(widget.horizontalType??false){
      result = Padding(
        padding: EdgeInsets.only(right: AppDatas.paddingWidth),
        child: item
      );
    } else {
      result = Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height*AppDatas.ratioHeightPrdRow,
            child: item,
          ),
          Divider(thickness: 1,color: AppColor.greyOpa,)
        ],
      );
    }
    return result;
  }
}