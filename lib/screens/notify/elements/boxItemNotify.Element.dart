import 'package:flutter/material.dart';
import 'package:kidsworld/models/apps/prCodeName.Model.dart';

import '../../../configs/appStyle.Config.dart';

class BoxItemNotifyElement extends StatelessWidget {
  const BoxItemNotifyElement({super.key,required this.item});
  final PrCodeName item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){},
      tileColor:AppColor.nearlyBlue.withOpacity(.05),
      splashColor: AppColor.grey.withOpacity(.1),
      leading: Image.network(item.value,fit: BoxFit.contain,),
      title: Text(item.name??"",
        style: const TextStyle(
          color: AppColor.darkText,
          fontSize: 14,
          fontWeight: FontWeight.w700
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(item.codeDisplay??"",
        style: const TextStyle(
          color: AppColor.darkText,
          fontSize: 13,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}