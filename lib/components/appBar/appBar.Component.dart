import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:kidsworld/data/appData.dart';

import '../../routers/app.Router.dart';

class AppBarComponent extends StatefulWidget {
  const AppBarComponent({super.key,this.scrollController,this.onTap});
  final TrackingScrollController? scrollController;
  final VoidCallback? onTap;
  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {

  late Color _backgroundColor;
  late Color _backgroundColorSearch;
  late Color _colorIcon;
  late Color _colorIconSearch;
  late Color _colorTextSearch;
  late Color _colorBorderSearch;
  late double _opacity;
  late double _offset;
  late double _paddingIcon;
  
  final _opacityMax = 0.01;
  final _paddingIconMax = 0.1;

  @override
  void initState() {
    super.initState();
    _backgroundColor = Colors.transparent;
    _backgroundColorSearch = AppColor.whiteColor;
    _colorIcon = AppColor.whiteColor;
    _colorIconSearch = AppColor.blackText.withOpacity(.5);
    _colorTextSearch = AppColor.grey.withOpacity(.5);
    _colorBorderSearch = Colors.transparent;
    _opacity = 0.0;
    _offset = 0.0;
    _paddingIcon = 0.0;

    if(widget.scrollController!=null){
      widget.scrollController!.addListener(_onScroll);
    } else {
      _backgroundColor = AppColor.blueColor;
      _backgroundColorSearch = AppColor.blueColor;
      _colorIcon = AppColor.whiteColor;
      _colorIconSearch = AppColor.whiteColor;
      _colorTextSearch = AppColor.whiteColor;
      _colorBorderSearch = AppColor.whiteColor;
      _opacity = 1;
      _paddingIcon = AppDatas.marginHorital;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: widget.onTap??(){},
                  child: Stack(
                    children: [
                      _buildAnimatedOpacityIcon(),
                      _buildInputSearch(),
                    ],
                  ),
                ),
              ),
              SizedBox(width: AppDatas.marginHorital,),
              _buildIconButton(
                onPress: () => Get.toNamed(AppRouter.shoppingCart),
                icon: Icons.shopping_cart_outlined,
                notification: 20
              )
            ],
          ),
        ),
      )
    );
  }

  Widget _buildAnimatedOpacityIcon(){
    return Padding(
      padding: EdgeInsets.only(left: _paddingIcon),
      child: AnimatedOpacity(
        opacity: widget.scrollController!=null?_opacity:1,
        duration: const Duration(milliseconds: 100),
        child: CircleAvatar(
          child: FlutterLogo()
        ),
      ),
    );
  }

  Widget _buildInputSearch(){
    final sizeIcon = BoxConstraints(
      minWidth: 40,
      minHeight: 40,
    );
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: _colorBorderSearch,
        width: 2,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10)
      )
    );
    return Padding(
      padding: EdgeInsets.only(left: _paddingIcon*6,),
      child: TextField(
        onTap: (){print("click search");},
        decoration: InputDecoration(
          enabled : false,
          contentPadding: EdgeInsets.all(4),
          isDense: true,
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "Sản phẩm A",
          hintStyle: TextStyle(fontSize: 16,color: _colorTextSearch),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal:AppDatas.marginHorital),
            child: Icon(Icons.search_outlined,color: _colorIconSearch,size: 35),
          ),
          prefixIconConstraints: sizeIcon,
          filled: true,
          fillColor: _backgroundColorSearch,
          
        ),
      ),
    );
  }

  Widget _buildIconButton({VoidCallback? onPress,IconData? icon,int notification = 0}){
    return Stack(
      children: [
        IconButton(
          onPressed: onPress??(){},
          icon: Icon(icon,color: _colorIcon,size: 35,),
        ),
        notification == 0
        ?const SizedBox()
        :Positioned(
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColor.yellow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2,color: AppColor.whiteColor)
            ),
            constraints: const BoxConstraints(
              minHeight: 20,
              minWidth: 20
            ),
            child: Text(
              "$notification",
              style: TextStyle(color: AppColor.blueColor,fontSize: 12,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        )
      ],
    );

  }
  
  void _onScroll(){
    final scrollOffset = widget.scrollController!.offset;
    _paddingIcon = (scrollOffset/10)+_paddingIconMax;
    if(scrollOffset >= _offset && scrollOffset > AppDatas.marginHorital){
      _opacity = double.parse((_opacity + (scrollOffset/1000)).toStringAsFixed(2));
      if(_opacity >= 1.0){
        _opacity = 1.0;
      }
      if(_paddingIcon >= AppDatas.marginHorital){
        _paddingIcon = AppDatas.marginHorital;
      }
      if(scrollOffset > 100){
        _offset = 110;
      }
    } else if(scrollOffset < 100){
      _opacity = double.parse((_opacity - _opacityMax).toStringAsFixed(2));
      if(_opacity <= 0.0){
        _opacity = 0.0;
      }
    }

    setState(() {
      if(scrollOffset <= AppDatas.marginHorital*2){
        _colorIcon = AppColor.whiteColor;
        _offset = 0.0;
        _opacity = 0.0;
      } else {
        _colorIcon = AppColor.whiteColor.withOpacity(_opacity);
      }
      if(_paddingIcon < AppDatas.marginHorital){
        _backgroundColorSearch = AppColor.whiteColor;
        _colorIconSearch = AppColor.blackText.withOpacity(.5);
        _colorTextSearch = AppColor.grey.withOpacity(.5);
        _colorBorderSearch = Colors.transparent;
      } else {
        _backgroundColorSearch = AppColor.blueColor.withOpacity(_opacity);
        _colorIconSearch = AppColor.whiteColor.withOpacity(_opacity);
        _colorTextSearch = AppColor.whiteColor.withOpacity(_opacity);
        _colorBorderSearch = AppColor.whiteColor.withOpacity(_opacity);
      }
      _backgroundColor = AppColor.blueColor.withOpacity(_opacity);
    });
  }
}