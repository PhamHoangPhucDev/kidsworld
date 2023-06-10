import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';

class ImageSliderComponent extends StatefulWidget {
  ImageSliderComponent({super.key,required this.listSrcImage,this.centerPage = false});
  final List<String> listSrcImage;
  final bool centerPage; 
  @override
  State<ImageSliderComponent> createState() => _ImageSliderComponentState();
}

class _ImageSliderComponentState extends State<ImageSliderComponent> {
  int currentSlider = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          items: widget.listSrcImage.map((e) => _buildItemImageSlider(e)).toList(),
          carouselController: _controller,
           options: CarouselOptions(
            aspectRatio: widget.centerPage?2.5:2,
            viewportFraction : widget.centerPage?0.8:1.1,
            enlargeCenterPage: widget.centerPage,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            onPageChanged: (index,reason){
              setState(() {
                currentSlider = index;
              });
            }
          ),
        ),
        Visibility(
          visible: !widget.centerPage,
          child: Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.listSrcImage.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5,color: AppColor.blackText),
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? AppColor.whiteColor
                                : (currentSlider == entry.key)
                                  ?AppColor.blackText:AppColor.whiteColor)
                            // .withOpacity(currentSlider == entry.key ? 0.9 : 0.1)
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
    
    
    
  }

  Widget _buildItemImageSlider(String srcPath){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(srcPath, fit: BoxFit.cover, width: 1000.0),
            ],
          )),
    );
  }
}