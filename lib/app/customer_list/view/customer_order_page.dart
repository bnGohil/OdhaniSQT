import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/common_utils/custom_app_bar.dart';
import '../../notification/route/notification_route.dart';
import '../domian/dummy/customer_order_data_model.dart';
class CustomerOrderPage extends StatefulWidget {
  const CustomerOrderPage({super.key});

  @override
  State<CustomerOrderPage> createState() => _CustomerOrderPageState();
}

class _CustomerOrderPageState extends State<CustomerOrderPage> {



  @override
  Widget build(BuildContext context) {

    final screenType = ModalRoute.of(context)?.settings.arguments as ScreenType?;

    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: (screenType == ScreenType.CUSTOMER) ? "pooja’s Orders" : "Agency’s orders",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                    width: 35.sp,
                    height: 35.sp,
                    child: Image.asset(GetCustomerDummyData.getCustomerData.profilePic ?? "")),
                SizedBox(width: 10.sp,),
                Expanded(child: Text((screenType == ScreenType.CUSTOMER) ? (GetCustomerDummyData.getCustomerData.name ?? "") : (GetCustomerDummyData.getAgencyData.name ?? ""),style: CustomTextStyle.semiBoldFont18Style,))
              ],
            ),
            SizedBox(height: 10.sp,),
            Expanded(
              child: ListView.builder(
                itemCount: (screenType == ScreenType.CUSTOMER) ? GetCustomerDummyData.getCustomerData.list?.length : GetCustomerDummyData.getAgencyData.list?.length,
                itemBuilder: (context, index) {
                  final customerData = (screenType == ScreenType.CUSTOMER) ? GetCustomerDummyData.getCustomerData.list![index] : GetCustomerDummyData.getAgencyData.list![index];
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10.sp),
                  decoration: CustomDecoration.detailDecoration,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [

                                SizedBox(
                                      width: 18.sp,
                                      height: 18.sp,
                                      child: ImageUtil.iconImageClass.dressIcon),
                                SizedBox(width: 5.sp,),
                                Expanded(child: Text(customerData.item ?? "",style: CustomTextStyle.regularFont16Style,))
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
                                Expanded(child: Text(customerData.count ?? "",style: CustomTextStyle.regularFont16Style,))
                              ],
                            ),
                            SizedBox(height: 10.sp,),
                            Wrap(
                              spacing: 5.sp,
                              runSpacing: 5.sp,
                              children: List.generate(customerData.imageList?.length ?? 0, (index2) {
                                final imageData = customerData.imageList?[index2];
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
                        padding: EdgeInsets.all(10.sp),
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
              },),
            )
          ],
        ),
      ),
    );
  }
}
