import 'package:flutter/material.dart';

import '../../configs/appStyle.Config.dart';

class TabBarComponent extends StatefulWidget {
  TabBarComponent({super.key,required this.listTab,required this.listPageView,this.current = 0,this.colorTab,this.scrollable});
  final List<String> listTab;
  final List<Widget> listPageView;
  final Color? colorTab;
  final ScrollPhysics? scrollable;
  int? current;
  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
  TabController tabController = TabController(length: widget.listTab.length, vsync: this);
    return Column(
      children: [
        ColoredBox(
          color: widget.colorTab ?? AppColor.nearlyBlue,
          child: TabBar(
            dividerColor: widget.colorTab,
            indicatorColor: AppColor.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.5,
            labelColor: (widget.colorTab==AppColor.whiteColor?AppColor.blueColor:AppColor.whiteColor),
            labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
            unselectedLabelColor: (widget.colorTab==AppColor.whiteColor?AppColor.grey:AppColor.whiteColor).withOpacity(.6),
            unselectedLabelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),
            controller: tabController,
            onTap: (int idx){
              widget.current = idx;
            },
            tabs: widget.listTab.map((e) => Tab(text: e,)).toList()
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: widget.scrollable??NeverScrollableScrollPhysics(),
            controller: tabController,
            children: widget.listPageView
          ),
        )
      ],
    );
  }
}