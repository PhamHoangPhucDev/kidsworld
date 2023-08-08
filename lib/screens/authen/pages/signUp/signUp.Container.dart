import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

import '../../../../components/textButton/textButton.Component.dart';
import '../../../../components/textField/textField.Component.dart';
import '../../../../data/appData.dart';
import 'signUp.Controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  final signUpController = Get.put(SignUpController());
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    signUpController.context = context;
    return Container(
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldComponent(
              label: "Họ tên",
              hintText: "Nhập họ và tên *",
              stream: signUpController.authBloc.nameStream,
              textController: signUpController.nameController,
            ),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextFieldComponent(
              label: "Số điện thoại",
              hintText: "Nhập số điện thoại *",
              stream: signUpController.authBloc.phoneStream,
              textController: signUpController.phoneController,
            ),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextFieldComponent(
              label: "Email",
              hintText: "Nhập email *",
              stream: signUpController.authBloc.emailStream,
              textController: signUpController.emailController,
            ),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextFieldComponent(
              label: "Mật khẩu",
              hintText: "Nhập mật khẩu *",
              stream: signUpController.authBloc.passStream,
              textController: signUpController.passController,
            ),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextFieldComponent(
              label: "Xác nhận mật khẩu",
              hintText: "Xác nhận lại mật khẩu *",
              stream: signUpController.authBloc.passConfirmStream,
              textController: signUpController.passConfirmController,
            ),
            SizedBox(height: AppDatas.paddingHeight*2,),
            TextButtonComponent(
              label: "TẠO TÀI KHOẢN",
              onPressed: () {
                signUpController.onSignUpClick();
              },
            ),
          ]
        ),
      )
    );
  }
}