import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/theme/custom_decocarion.dart';
import '../../customer_list/domian/dummy/customer_order_data_model.dart';
class CompletedOrderListWidget extends StatelessWidget {
  final CustomerData? customerData;
  const CompletedOrderListWidget({super.key, this.customerData});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      decoration: CustomDecoration.detailDecoration,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [

                    if(customerData?.profilePic != null)
                    SizedBox(
                        width: 35.sp,
                        height: 35.sp,
                        child: Image.asset(customerData?.profilePic ?? "")),
                    SizedBox(width: 5.sp,),
                    if(customerData?.name != null)
                    Expanded(child: Text(customerData?.name ?? "",style: CustomTextStyle.semiBoldFont18Style,))
                  ],
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [

                    SizedBox(
                        width: 18.sp,
                        height: 18.sp,
                        child: ImageUtil.iconImageClass.dressIcon),
                    SizedBox(width: 5.sp,),
                    Expanded(child: Text(customerData?.item ?? "",style: CustomTextStyle.regularFont16Style,))
                  ],
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [

                    SizedBox(
                        width: 18.sp,
                        height: 18.sp,
                        child: ImageUtil.iconImageClass.rupeesIcon),
                    SizedBox(width: 5.sp,),
                    Expanded(child: Text(customerData?.count ?? "",style: CustomTextStyle.regularFont16Style,))
                  ],
                ),
                SizedBox(height: 10.sp,),
                Wrap(
                  spacing: 5.sp,
                  runSpacing: 5.sp,
                  children: List.generate(customerData?.imageList?.length ?? 0, (index2) {
                    final imageData = customerData?.imageList?[index2];
                    return SizedBox(
                        width: 51.sp,
                        height: 51.sp,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Image.asset(imageData ?? "",fit: BoxFit.cover)));
                  }),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.sp),
            decoration: CustomDecoration.detailsCornerDecoration,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 18.sp,
                        width: 18.sp,
                        child: ImageUtil.iconImageClass.calenderIcon),
                    SizedBox(width: 5.sp,),
                    Text("Order Date",style: CustomTextStyle.regularFont14Style),
                    Text("-${customerData?.orderDate}",style: CustomTextStyle.semiBoldFont14Style),
                  ],
                ),
                SizedBox(height: 10.sp,),
                Row(
                  children: [
                    SizedBox(
                        height: 18.sp,
                        width: 18.sp,
                        child: ImageUtil.iconImageClass.calenderIcon),
                    SizedBox(width: 5.sp,),
                    Text("Completed Date ",style: CustomTextStyle.regularFont14Style),
                    Text("-${customerData?.completedDate}",style: CustomTextStyle.semiBoldFont14Style),
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
