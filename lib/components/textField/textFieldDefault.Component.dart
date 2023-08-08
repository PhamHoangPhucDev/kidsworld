import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

class TextFieldDefaultComponent extends StatefulWidget {
  TextFieldDefaultComponent({super.key,this.enabled = true,this.hintText = "Nhập giá trị",this.stream,this.textController,this.line});
  final String? hintText;
  final Stream<Object?>? stream;
  final TextEditingController? textController;
  final bool? enabled;
  final int? line;

  @override
  State<TextFieldDefaultComponent> createState() => _TextFieldDefaultComponentState();
}

class _TextFieldDefaultComponentState extends State<TextFieldDefaultComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              isDense: true, // giảm chiều cao form
            ),
            enabled: widget.enabled,     
          ),
        ),
      ],
    );
  }
}