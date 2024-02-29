import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/theme/custom_decocarion.dart';
import '../domian/dummy/customer_list_data_model.dart';
class CustomerDataComponentWidget extends StatelessWidget {
  final CustomerListDataModel? customerListData;
  const CustomerDataComponentWidget({super.key, this.customerListData});

  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.symmetric(vertical: 5.sp),
     decoration: CustomDecoration.detailDecoration,
     padding: EdgeInsets.all(15.sp),
     child: Column(
       children: [
         Row(
           children: [
             SizedBox(
                 height: 35.sp,
                 width: 35.sp,
                 child: Image.asset(customerListData?.profilePic ?? "")),
             SizedBox(width: 5.sp,),
             Expanded(child: Text(customerListData?.name ?? "",style: CustomTextStyle.semiBoldRegularFont20Style,))
           ],
         ),
         SizedBox(height: 18.sp,),
         if(customerListData?.location != null)
         Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(
                 height: 18.sp,
                 width: 18.sp,
                 child: ImageUtil.iconImageClass.locationIcon),
             SizedBox(width: 5.sp,),
             Flexible(child: Text(customerListData?.location ?? "",style: CustomTextStyle.regularFont16Style,))
           ],
         ),
       ],
     ),
   );
  }
}
