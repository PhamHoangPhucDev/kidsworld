import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'system.Controller.dart';

class SystemScreen extends GetWidget<SystemController> {
  // final SystemController systemController = Get.find();
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container();
  }
}