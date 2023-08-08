import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../../blocs/auth.Bloc.dart';
import '../../../../components/alert/alert.Component.dart';
import '../../../../models/apps/userInfo.Model.dart';
import '../../../main/main.Controller.dart';

class UserInfoController extends GetxController {
  late BuildContext context;
  
  AuthBloc authBloc = AuthBloc(); 
  TextEditingController emailController = TextEditingController();
  TextEditingController passOldController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    emailController.text = MainController.initance.userData.value.email??"";
    nameController.text = MainController.initance.userData.value.name??"";
    phoneController.text = MainController.initance.userData.value.phone??"";
    super.onReady();
  }

  void clearController(){
    passOldController.clear();
    passController.clear();
    passConfirmController.clear();
  }

  addListenerSink(){
    authBloc.passSink.add(passController.text);
    passController.addListener(() {
      authBloc.passSink.add(passController.text);
      authBloc.passConfirmSink.add({
        "pass" : passController.text,
        "passConfirm":passConfirmController.text
      });
    });
    authBloc.passConfirmSink.add({
      "pass" : passController.text,
      "passConfirm":passConfirmController.text
    });
    passConfirmController.addListener(() {
      authBloc.passConfirmSink.add({
        "pass" : passController.text,
        "passConfirm":passConfirmController.text
      });
    });
    authBloc.nameSink.add(nameController.text);
    nameController.addListener(() {
      authBloc.nameSink.add(nameController.text);
    });
    authBloc.passOldSink.add(passOldController.text);
    passOldController.addListener(() {
      authBloc.passOldSink.add(passOldController.text);
    });
  }

  void onUpdateUserClick() {
    final user = UserInfoModel(
      // email: emailController.text.trim(),
      password: passController.text.trim(),
      name: nameController.text.trim(),
    );
    if(authBloc.isValid(email:emailController.text, pass:passController.text,passOld: passOldController.text, passConfirmController.text, nameController.text, phoneController.text)){
    EasyLoading.show(status: 'Loading...');
    authBloc.updateUser(passOldController.text.trim(),user,(){
        EasyLoading.dismiss();
        clearController();
        Alert.showMsgDialog(context, "Cập nhật thành công");
        authBloc.dispose();
        print("Cập nhật thành công");
      },
      (msg) {
        EasyLoading.dismiss();
        Alert.showMsgDialog(context, msg);
      }
    );
    } else {
      addListenerSink();
    }
  }

}