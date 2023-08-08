import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../../../components/appBar/defaultAppBar.Component.dart';
import '../../../../components/boxs/boxStackPositionBottom.Component.dart';
import '../../../../components/textField/textField.Component.dart';
import '../../../../data/appData.dart';
import 'userInfo.Controller.dart';

class UserInfoScreen extends GetWidget<UserInfoController> {
  final userInfoController = Get.put(UserInfoController());
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    userInfoController.context = context;
    return Scaffold(
      appBar: DefaultAppBarComponent(
        leading: true,
        title: "Thông tin tài khoản",
      ),
      body: BoxStackPositionBottomComponent(
        labelPosition: "CẬP NHẬT",
        colorPosition: AppColor.nearlyBlue,
        onPressPosition: ()=> userInfoController.onUpdateUserClick(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppDatas.marginHorital),
            child: Column(
              children: [
                TextFieldComponent(
                  label: "Họ tên",
                  hintText: "Nhập họ và tên *",
                  stream: userInfoController.authBloc.nameStream,
                  textController: userInfoController.nameController,
                ),
                SizedBox(height: AppDatas.paddingHeight*2,),
                TextFieldComponent(
                  label: "Số điện thoại",
                  hintText: "Nhập số điện thoại *",
                  enabled: false,
                  textController: userInfoController.phoneController,
                ),
                SizedBox(height: AppDatas.paddingHeight*2,),
                TextFieldComponent(
                  label: "Email",
                  hintText: "Nhập email *",
                  enabled: false,
                  textController: userInfoController.emailController,
                ),
                SizedBox(height: AppDatas.paddingHeight*2,),
                TextFieldComponent(
                  label: "Mật khẩu cũ",
                  hintText: "Nhập mật khẩu cũ của tài khoản *",
                  stream: userInfoController.authBloc.passOldStream,
                  textController: userInfoController.passOldController,
                ),
                SizedBox(height: AppDatas.paddingHeight*2,),
                TextFieldComponent(
                  label: "Mật khẩu mới",
                  hintText: "Nhập mật khẩu mới *",
                  stream: userInfoController.authBloc.passStream,
                  textController: userInfoController.passController,
                ),
                SizedBox(height: AppDatas.paddingHeight*2,),
                TextFieldComponent(
                  label: "Xác nhận mật khẩu",
                  hintText: "Xác nhận lại mật khẩu *",
                  stream: userInfoController.authBloc.passConfirmStream,
                  textController: userInfoController.passConfirmController,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}