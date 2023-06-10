// import 'package:flutter/material.dart';
// import 'package:erpcore/configs/app.Config.dart';
// import 'package:erpcore/configs/appStyle.Config.dart';
// import 'package:erpcore/screens/transport/models/actTransport.Model.dart';
// class TransportItem extends StatelessWidget {
//   const TransportItem({super.key, required this.model, this.callBack, this.tabIndex = 0});
//   final ActTransportModel model;
//   final int? tabIndex;
//   final Function()? callBack;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         if (callBack != null) {
//           callBack!();
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.only(top: 10.0),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//               Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               ),
//               child: IntrinsicHeight(
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: AppConfig.appColor,
//                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)),
//                       ),
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.all(10),
//                         child: _buildShowInfo(),
//                       )
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Text(model.getTransStatus(tabIndex!), style: TextStyle(color: tabIndex! == 0 ? AppColor.brightRed : model.getStatusColor(), fontSize: 14, fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget itemLabelName(String left, String right,Color cl){
//     return Container(
//       child: RichText(
//         text: TextSpan(
//           text: left,
//           style: TextStyle(color: AppColor.grey,fontSize: 14),
//           children: <TextSpan>[
//             TextSpan(text: " "),
//             TextSpan(text: right, style: TextStyle(color: cl, fontSize: 15,fontWeight: FontWeight.bold)),
//           ],
//         ),
//       )
//     );
//   }

//   Widget _buildShowInfo(){
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         itemLabelName("Mã đơn: ",model.getCode(),AppColor.grey),
//         itemLabelName("Từ: ", model.getAddressFrom(),AppColor.grey),
//         itemLabelName("Đến: ",model.getAddressTo(),Colors.green),
//         itemLabelName("Số lượng: ",model.getTransQuantity(),Colors.red),
//         itemLabelName("Ghi chú: ",model.getNote(),AppColor.grey),
//       ],
//     );
//   }
// }
