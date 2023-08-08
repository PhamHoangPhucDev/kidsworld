import 'package:flutter/material.dart';

import '../../data/appData.dart';
import '../../models/apps/product.Model.dart';
import '../boxs/boxProduct.Component.dart';
import '../skelton/skelton.Component.dart';

class GirdViewComponent extends StatefulWidget {
  const GirdViewComponent({super.key,this.future, this.onTap,this.textNull,this.onRefresh});
  final Future<List<ProductModel>>? future;
  final Function(int,List<ProductModel>)? onTap;
  final String? textNull;
  final Function? onRefresh;
  @override
  State<GirdViewComponent> createState() => _GirdViewComponentState();
}
class _GirdViewComponentState extends State<GirdViewComponent> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return FutureBuilder<List<ProductModel>>(
      future: widget.future,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          if(snapshot.data != null && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3/2,
                mainAxisExtent: size.height*AppDatas.ratioHeightPrdColumn,
                crossAxisSpacing: AppDatas.paddingWidth,
                mainAxisSpacing: AppDatas.paddingWidth
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx,index){
                return BoxProductComponent(
                  prd: snapshot.data![index],
                  onTap: (){
                    if(widget.onTap!=null){
                      widget.onTap!(index,snapshot.data!);
                    }
                  },
                  onRefresh: widget.onRefresh,
                );
              },
            );
            } else {
              return SizedBox(
                height: size.height,
                child: Center(child: Text(widget.textNull??'',textAlign: TextAlign.center,))
              );
            }
          } else if(snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"),);
          }
          return SkeltonComponent(horizontalType: true,isGridView: true,);
        }
      );
    }
  }