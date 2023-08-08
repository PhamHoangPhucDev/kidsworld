import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';
import 'package:kidsworld/models/apps/userInfo.Model.dart';

import '../../main/main.Controller.dart';

class AppBarProfileElement extends StatefulWidget {
  AppBarProfileElement({super.key,});
  @override
  State<AppBarProfileElement> createState() => _AppBarProfileElementState();
}

class _AppBarProfileElementState extends State<AppBarProfileElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.nearlyBlue,
      padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital,vertical: AppDatas.marginVerital),
      child: FutureBuilder(
        future: MainController.initance.getUserData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              UserInfoModel userData = snapshot.data as UserInfoModel;
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
                    child: CircleAvatar(
                      maxRadius: 25,
                      child: Text("Img"),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Xin chào",style: TextStyle(color: AppColor.whiteColor,fontSize: 15),),
                        Text(userData.name??"Khách hàng",style: DesignCourseAppTheme.font16White,),
                      ],
                    ),
                  ),
                ],
              );
            } else if(snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()),);
            } else {
              return const Center(child: Text("Something went wrong"),);
            }
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}