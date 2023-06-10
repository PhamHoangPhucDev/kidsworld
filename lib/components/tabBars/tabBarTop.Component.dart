import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class TabBarTopComponent extends StatefulWidget {
  const TabBarTopComponent({super.key,required this.current,required this.tabs,this.tabViews = const SizedBox(),this.onTap});
  final List<String> tabs;
  final int current;
  final Widget tabViews;
  final Function(int)? onTap;
  @override
  State<TabBarTopComponent> createState() => _TabBarTopComponentState();
}

class _TabBarTopComponentState extends State<TabBarTopComponent> {
  late Size size;
  double changePositionedOfLine() {
    switch (widget.current) {
      case 0:
        return 0;
      case 1:
        return 78;
      case 2:
        return 192;
      case 3:
        return 263;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (widget.current) {
      case 0:
        return 50;
      case 1:
        return 80;
      case 2:
        return 50;
      case 3:
        return 50;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: size.height * 0.05,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.05,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.tabs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if(widget.onTap!=null){
                                widget.onTap!(index);
                              } 
                            });
                          },
                          child: Container(
                            color: AppColor.nearlyBlue,
                            width: size.width/(widget.tabs.length),
                            child: Center(
                              child: Text(
                                widget.tabs[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: widget.current == index ? 18 : 17,
                                  fontWeight: widget.current == index
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                  color: AppColor.whiteColor.withOpacity(widget.current == index ? 1 : .6)
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              AnimatedPositioned(
                curve: Curves.fastLinearToSlowEaseIn,
                bottom: 0,
                left: (size.width/(widget.tabs.length))*widget.current,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                  width: size.width/(widget.tabs.length),
                  height: size.height * 0.004,
                  decoration: BoxDecoration(
                    color: AppColor.yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn,
                ),
              )
            ],
          ),
        ),
        Expanded(child: widget.tabViews)
      ],
    );
  }
}