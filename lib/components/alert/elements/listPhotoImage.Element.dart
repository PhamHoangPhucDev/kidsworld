import 'package:flutter/material.dart';
import 'package:kidsworld/configs/appStyle.Config.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'portfolioGalleryImage.Element.dart';

class ListPhotoImageElement extends StatefulWidget {
  const ListPhotoImageElement({super.key,required this.imagePaths,required this.currentIndex});
  // final List<String> imagePaths;
  final List imagePaths;
  final int currentIndex;

  @override
  State<ListPhotoImageElement> createState() => _ListPhotoImageElementState();
}

class _ListPhotoImageElementState extends State<ListPhotoImageElement> {
  late PageController _pageController;
  late int _currentIndex;
  late Size size;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.blackText,
      body: SafeArea(child: _buildContent()),
    );
  }

  Widget _buildContent(){
    return Stack(
      children: [
        _buildPhotoViewGallery(),
        _buildIndicator(),
        _buildClosePage(),
      ],
    );
  }

  Widget _buildClosePage(){
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text("${_currentIndex+1}/${widget.imagePaths.length}",style: DesignCourseAppTheme.font20White,),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              color: AppColor.whiteColor,
              onPressed: ()=> Navigator.pop(context),
              icon: const Icon(Icons.close_rounded,size: 40,)
            ),
          )
        ],
      )
    );
  }

  Widget _buildIndicator(){
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: _buildImageCarouselSlider()
    );
  }

  Widget _buildImageCarouselSlider(){
    return CarouselSlider.builder(
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(width: 4,color: _currentIndex == index?AppColor.whiteColor:Colors.transparent),
            borderRadius: BorderRadius.circular(5)
          ),
          child: PortfolioGalleryImageElement(
            imagePath: widget.imagePaths[index],
            onImageTap: () => _pageController.jumpToPage(index)
          ),
        );
      },
      options: CarouselOptions(
        // aspectRatio: .2,
        height: 100,
        enableInfiniteScroll: false,//hiển thị đúng số ảnh
        padEnds: false,//start row
        viewportFraction: .2,
        // enlargeCenterPage: true,
        initialPage: _currentIndex
      )
    );
  }

  PhotoViewGallery _buildPhotoViewGallery() {
    return PhotoViewGallery.builder(
      itemCount: widget.imagePaths.length,
      builder: (context, index) {
        return PhotoViewGalleryPageOptions(
          imageProvider: NetworkImage(widget.imagePaths[index]),
          minScale: PhotoViewComputedScale.contained * 1,
          // maxScale: PhotoViewComputedScale.covered * 1.8,
        );
      },
      // enableRotation: true,//cho xoay hình
      scrollPhysics: const BouncingScrollPhysics(),
      pageController: _pageController,
      loadingBuilder: (context, event) {
        return const Center(child: CircularProgressIndicator(),);
      },
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

}
