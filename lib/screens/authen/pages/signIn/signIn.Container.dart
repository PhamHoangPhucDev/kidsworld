import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/components/textButton/textButton.Component.dart';
import 'package:kidsworld/data/appData.dart';

import '../../../../components/textField/textField.Component.dart';
import '../../../../configs/appStyle.Config.dart';
import 'signIn.Controller.dart';

class SignInScreen extends GetWidget<SignInController> {
  final signInController = Get.put(SignInController());
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    signInController.context = context;

    return Obx(() => Container(
      color: AppColor.whiteColor,
      padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldComponent(
            label: "Email / Số điện thoại",
            hintText: "Nhập email hoặc số điện thoại *",
            stream: signInController.authBloc.emailStream,
            textController: signInController.emailController,
          ),
          SizedBox(height: AppDatas.paddingHeight*2,),
          TextFieldComponent(
            stream: signInController.authBloc.passStream,
            textController: signInController.passController,
            label: "Mật khẩu",
            hintText: "Nhập mật khẩu của tài khoản *",
            obscured: signInController.obscured.value,
            keyboardType: TextInputType.visiblePassword,
            listRightIcon: [
              GestureDetector(
                onTap: (){
                  signInController.obscured.value = !signInController.obscured.value;
                },
                child: Icon(
                  signInController.obscured.value
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
                  size: 28
                ),
              ),
              Container(margin: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),color: Colors.black45, height: 30, width: 2,),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColor.aqua,
                  padding: EdgeInsets.zero,
                  minimumSize: Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft
                ),
                onPressed: (){},
                child: const Text("Quên?")
              )
            ],
          ),
          SizedBox(height: AppDatas.paddingHeight*2,),
          TextButtonComponent(
            label: "ĐĂNG NHẬP",
            onPressed: ()=>signInController.onSignInClick(),
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: AppDatas.marginHorital),
                  child: Divider(color: AppColor.blackText,height: 36,)
                ),
              ),
              const Text("hoặc đăng nhập bằng",style: DesignCourseAppTheme.font13,),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: AppDatas.marginHorital),
                  child: Divider(color: AppColor.blackText,height: 36,)
                ),
              ),
            ]
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          TextButtonComponent(
            label: "Tin nhắn điện thoại",
            colorButton: AppColor.laSalleGreen,
            imageLeft: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhCS7lwcWkL_wIBhgMFSUEAFZaT56ib0nNQA&usqp=CAU',
          ),
          SizedBox(height: AppDatas.paddingHeight*2,),
          TextButtonComponent(
            label: "Facebook",
            colorButton: AppColor.blueColor,
            imageLeft: 'https://1000logos.net/wp-content/uploads/2021/04/Facebook-logo.png',
          ),
        ],
      ),
    ));
  }
}