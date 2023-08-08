import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';
import 'elements/iosModalStyle.Element.dart';

class Modal{
  static void showModalBottomSheetComponent({required BuildContext context,double? height,required Widget child}){
    showModalBottomSheet<void>(
      // barrierColor: Colors.transparent,
      isScrollControlled: true, // to full height
      useSafeArea: true, // to show under status bar
      backgroundColor: AppColor.whiteColor, // to show BorderRadius of Container
      context: context,
      builder: (BuildContext context) {
        return IOSModalStyleElement(
          childBody: child,
          height: height,
        );
      },
    );
  }
}