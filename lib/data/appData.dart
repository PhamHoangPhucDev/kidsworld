import 'package:flutter/material.dart';
import '../../models/apps/product.Model.dart';

class AppKey{
  static GlobalKey<NavigatorState> keyTabMain = GlobalKey<NavigatorState>(debugLabel: 'main');
  static GlobalKey<NavigatorState> keyTabNotify = GlobalKey<NavigatorState>(debugLabel: 'notify');
  static GlobalKey<NavigatorState> keyTabAuth = GlobalKey<NavigatorState>(debugLabel: 'auth');
}
class pageSizeConfig{
  static final int page = 1;
  static final int totalPage = 1;
  static final int pageSize = 25;
}

class PackageName{

}


class AppDatas{
  static double ratioHeightPrdRow = .25;
  static double ratioHeightPrdColumn = .4;
  static double paddingHeight = 10;
  static double paddingWidth = 2;
  static double marginHorital = 10;
  static double marginVerital = 10;
  static double sizeStar = 15;
  static IconData iconEmpty = Icons.error_outline;
  // quyền 
  static List<String> permissionApprove = [
    "",
  ];
}