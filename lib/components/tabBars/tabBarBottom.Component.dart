import 'package:flutter/material.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

import '../../configs/appStyle.Config.dart';

class TabBottomComponent extends StatefulWidget {
  const TabBottomComponent({super.key,required this.tabIndex,this.hexColor,required this.switchTap,required this.tabItems});
  final List<BottomNavigationBarItem> tabItems;
  final int tabIndex;
  final Function(int) switchTap;
  final String? hexColor;

  @override
  State<TabBottomComponent> createState() => _TabBottomComponentState();
}

class _TabBottomComponentState extends State<TabBottomComponent> with TickerProviderStateMixin{

    @override
  void initState() {
    super.initState();
  }
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.tabItems.length>=2?
    
    MotionTabBar(
        initialSelectedTab: widget.tabItems[widget.tabIndex].label??"",
        useSafeArea: true, // default: true, apply safe area wrapper
        // labels: const ["Dashboard", "Home", "Profile", "Settings"],
        labels: widget.tabItems.map((itemTab) => itemTab.label).toList(),
        icons: widget.tabItems.map((itemTab) => (itemTab.icon as Icon).icon!).toList(),

        // optional badges, length must be same with labels
        // badges: [
        //   // Default Motion Badge Widget
        //   const MotionBadgeWidget(
        //     text: '99+',
        //     textColor: Colors.white, // optional, default to Colors.white
        //     color: Colors.red, // optional, default to Colors.red
        //     size: 18, // optional, default to 18
        //   ),

        //   // custom badge Widget
        //   Container(
        //     color: Colors.black,
        //     padding: const EdgeInsets.all(2),
        //     child: const Text(
        //       '48',
        //       style: TextStyle(
        //         fontSize: 14,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),

        //   // allow null
        //   null,

        //   // Default Motion Badge Widget with indicator only
        //   const MotionBadgeWidget(
        //     isIndicator: true,
        //     color: Colors.red, // optional, default to Colors.red
        //     size: 5, // optional, default to 5,
        //     show: true, // true / false
        //   ),
        // ],
        tabSize: 50,
        tabBarHeight: 55,
        textStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: AppColor.grey.withOpacity(.5),
        tabIconSize: 28.0,
        tabIconSelectedSize: 26.0,
        tabSelectedColor: AppColor.brightBlue,
        tabIconSelectedColor: Colors.white,
        tabBarColor: AppColor.whiteColor,
        onTabItemSelected: widget.switchTap
      )
    
    
    
    
    // BottomNavigationBar(
    //   items: widget.tabItems.map((itemTab) => itemTab).toList(),
    //   currentIndex: widget.tabIndex,
    //   selectedItemColor: widget.hexColor!=null&&widget.hexColor!.isNotEmpty?HexColor.fromHex(widget.hexColor!):AppConfig.appColor,
    //   onTap: widget.switchTap,
    // )
    :SizedBox();
  }
}