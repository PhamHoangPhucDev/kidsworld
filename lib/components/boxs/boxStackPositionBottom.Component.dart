import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';
import '../../data/appData.dart';
import '../textButton/textButton.Component.dart';

class BoxStackPositionBottomComponent extends StatelessWidget {
  BoxStackPositionBottomComponent({super.key,this.onPressPosition,this.colorPosition,this.labelPosition,this.child});
  final String? labelPosition;
  final Color? colorPosition;
  final Widget? child;
  final VoidCallback? onPressPosition;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          child??SizedBox(),
      
          Positioned(
            bottom: AppDatas.marginHorital,
            left: AppDatas.marginHorital,
            right: AppDatas.marginHorital,
            child: TextButtonComponent(
              width: MediaQuery.of(context).size.width,
              colorButton: colorPosition??AppColor.brightRed,
              label: labelPosition,
              onPressed: onPressPosition??() {},
            ),
          ),
        ],
      ),
    );
  }
}