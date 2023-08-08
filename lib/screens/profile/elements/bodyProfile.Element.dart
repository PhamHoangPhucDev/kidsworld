import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kidsworld/firebase/auth.Firebase.dart';
import 'package:kidsworld/screens/profile/pages/userInfo/userInfo.Container.dart';

import '../../../components/textButton/textButtonIcon.Component.dart';
import '../../../configs/appStyle.Config.dart';
import '../../../data/appData.dart';
import '../pages/prdFavorite/prdFavorite.Container.dart';
import 'appBarProfile.Element.dart';
import 'itemProduct.Element.dart';

class BodyProfileElement extends StatefulWidget {
  BodyProfileElement({super.key});

  @override
  State<BodyProfileElement> createState() => _BodyProfileElementState();
}

class _BodyProfileElementState extends State<BodyProfileElement> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBarProfileElement(),
          ItemProductElement(
            color: AppColor.blueColor,
            icon: Icons.person_outline,
            lable: "Thông tin tài khoản",
            onTap: ()=> Get.to(() => UserInfoScreen()),
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.receipt_long,
            lable: "Quản lý đơn hàng",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.home_work_outlined,
            lable: "Số địa chỉ",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.speaker_notes_outlined,
            lable: "Nhận xét sản phẩm đã mua",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.visibility_outlined,
            lable: "Sản phẩm đã xem",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.favorite_border_outlined,
            lable: "Sản phẩm yêu thích",
            onTap: ()=> Get.to(() => PrdFavoriteScreen()),
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.inventory_2_outlined,
            lable: "Sản phẩm mua sau",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.edit_outlined,
            lable: "Nhận xét của tôi",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.help_center_outlined,
            lable: "Hỏi đáp",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.credit_card_outlined,
            lable: "Ví ưu đãi",
          ),
          ItemProductElement(
            color: AppColor.nearlyBlue,
            icon: Icons.person_outline,
            lable: "Xóa tài khoản",
          ),
          SizedBox(height: AppDatas.paddingHeight*2,),
          ItemProductElement(
            lable: "Tư vấn khách hàng",
          ),
          ItemProductElement(
            lable: "Chăm sóc khách hàng",
          ),
          ItemProductElement(
            lable: "Giới thiệu về KidsWorld",
          ),
          ItemProductElement(
            lable: "Chính sách bảo mật",
          ),
          ItemProductElement(
            lable: "Mua và giao nhận Online",
          ),
          ItemProductElement(
            lable: "Quy trình & hình thức thanh toán",
          ),
          ItemProductElement(
            lable: "Đổi trả & hoàn tiền",
          ),
          ItemProductElement(
            lable: "Bảo hành & bảo trì",
          ),
          ItemProductElement(
            lable: "Chính sách và quy định chung",
          ),
          SizedBox(height: AppDatas.paddingHeight,),
          Padding(
            padding: EdgeInsets.only(left: AppDatas.marginHorital,right: AppDatas.marginHorital,bottom: 50),
            child: TextButtonIconComponent(
              width: size.width,
              icon: Icons.logout_outlined,
              label: "Đăng xuất",
              onPress: () {
                FireAuth.instance.signOut();
              } 
            ),
          )
        ],
      ),
    );
  }
}