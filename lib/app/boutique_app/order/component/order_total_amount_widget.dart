import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/theme/custom_decocarion.dart';

class OrderDeliveryWidget extends StatelessWidget {
  const OrderDeliveryWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: EdgeInsets.symmetric(horizontal: 20.sp),
     child: Container(
       decoration: CustomDecoration.detailDecoration,
       padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp),
       child: Column(
         children: [
           Row(
             children: [
               Expanded(child: Text("Actual Order Date",style: CustomTextStyle.regularFont16Style,)),
               SizedBox(
                   height: 13.sp,
                   width: 13.sp,
                   child: ImageUtil.iconImageClass.rupees2Icon),
               Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                   color: kBlackColor
               ),)
             ],
           ),
           SizedBox(height: 10.sp,),
           Row(
             children: [
               Expanded(child: Text("Expected Delivery Date",style: CustomTextStyle.regularFont16Style,)),
               SizedBox(
                   height: 13.sp,
                   width: 13.sp,
                   child: ImageUtil.iconImageClass.rupees2Icon),
               Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                   color: kBlackColor
               ),)
             ],
           ),
           SizedBox(height: 10.sp,),
           Divider(),
           SizedBox(height: 10.sp,),
           Row(
             children: [
               Expanded(child: Text("Actual Delivery Date",style: CustomTextStyle.regularFont16Style,)),
               SizedBox(
                   height: 13.sp,
                   width: 13.sp,
                   child: ImageUtil.iconImageClass.rupees2Icon),
               Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                   color: kBlackColor
               ),)
             ],
           ),
         ],
       ),
     ),
   );
  }
}
