import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';
import '../../data/appData.dart';

class TextFieldComponent extends StatefulWidget {
  TextFieldComponent({super.key,this.enabled = true,this.label = "Giá trị",this.hintText = "Nhập giá trị",this.obscured,this.listRightIcon,this.keyboardType,this.stream,this.textController,this.line});
  final String? label;
  final String? hintText;
  final List<Widget>? listRightIcon;
  final bool? obscured;
  final TextInputType? keyboardType;
  final Stream<Object?>? stream;
  final TextEditingController? textController;
  final bool? enabled;
  final int? line;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label!,style: DesignCourseAppTheme.subtitle,),
        SizedBox(height: 5,),
        StreamBuilder(
          stream: widget.stream,
          builder: (context, snapshot) => TextField(
            maxLines: widget.line??1,
            controller: widget.textController,
            style: TextStyle(fontSize: 15.0, color: AppColor.darkText),
            decoration: InputDecoration(
              hintText: widget.hintText,
              // errorText: snapshot.hasError ? snapshot.error.toString() : null,
              errorText: snapshot.data?.toString(),
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: AppColor.whiteColor,
              contentPadding: const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.nearlyBlue),
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.lightText),
                borderRadius: BorderRadius.circular(5.0),
              ),
        
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // isDense: true, // giảm chiều cao form
              suffixIcon: widget.listRightIcon!=null?Padding(
                padding: EdgeInsets.symmetric(horizontal: AppDatas.marginHorital),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: widget.listRightIcon!,
                ),
              ):SizedBox(),
            ),
            enabled: widget.enabled,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscured??false,//pass *** true        
          ),
        ),
      ],
    );
  }
}