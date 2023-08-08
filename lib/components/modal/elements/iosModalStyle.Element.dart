import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class IOSModalStyleElement extends StatelessWidget {
  final Widget childBody;
  final double? height;

  const IOSModalStyleElement({Key? key,required this.childBody,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dividerWidget(),
        Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor, // color of card
            // borderRadius: const BorderRadius.only(
            //   topLeft:Radius.circular(16.0),
            //   topRight:Radius.circular(16.0)
            // ),
          ),
          height: height, // body container height
          width: double.infinity,
          child: childBody,
        )
      ],
    );
  }

  Widget _dividerWidget() {
    return FractionallySizedBox(
      widthFactor: 0.2, // width of top divider bar
      child: Container(
        margin: const EdgeInsets.symmetric( // margin of top divider bar
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: AppColor.greyOpa, // color of top divider bar
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}