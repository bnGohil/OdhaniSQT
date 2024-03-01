import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/sizer/enum.dart';
import '../../../../utils/utils.dart';
import '../../../notification/route/notification_route.dart';
import '../../component/job_status_widget.dart';
class CompletedOrderPage extends StatefulWidget {
  const CompletedOrderPage({super.key});

  @override
  State<CompletedOrderPage> createState() => _CompletedOrderPageState();
}

class _CompletedOrderPageState extends State<CompletedOrderPage> {


  WorkingStatus? workingStatus = WorkingStatus.COMPLETED;


  @override
  Widget build(BuildContext context) {
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
        title: "Complete Order",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JobStatusWidget(
              isStatus: false,
              workingStatus: workingStatus,
              onWorkingOnTap: (p0) {
                setState(() {
                  workingStatus = p0;
                });
              },
            ),
            SizedBox(height: 20.sp,),
            Container(
              decoration: CustomDecoration.detailDecoration,
              padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 15.sp),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Text("Total Amount",style: CustomTextStyle.regularFont16Style,)),
                      SizedBox(
                        height: 13.sp,
                          width: 13.sp,
                          child: ImageUtil.iconImageClass.rupees2Icon),
                      Text("800",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                        color: kBlackColor
                      ),)
                    ],
                  ),
                  SizedBox(height: 10.sp,),
                  Row(
                    children: [
                      Expanded(child: Text("Paid Amount",style: CustomTextStyle.regularFont16Style,)),
                      SizedBox(
                          height: 13.sp,
                          width: 13.sp,
                          child: ImageUtil.iconImageClass.rupees2Icon),
                      Text("000",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                          color: kBlackColor
                      ),)
                    ],
                  ),
                  SizedBox(height: 10.sp,),
                  Divider(),
                  SizedBox(height: 10.sp,),
                  Row(
                    children: [
                      Expanded(child: Text("Due Amount",style: CustomTextStyle.regularFont16Style,)),
                      SizedBox(
                          height: 13.sp,
                          width: 13.sp,
                          child: ImageUtil.iconImageClass.rupees2Icon),
                      Text("800",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                          color: kBlackColor
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.sp,),
            Container(
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
            SizedBox(height: 10.sp,),
            Row(
              children: [
                Expanded(
                  child: Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "Payment Request By",
                        style: CustomTextStyle.regularFont18Style,
                        children: [
                          TextSpan(
                            text: "ABC Agency ",
                            style: CustomTextStyle.semiBoldFont18Style
                          )
                        ]
                      )
                    ]
                  )),
                ),
                Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                  color: kBlackColor
                ))
              ],
            ),
            SizedBox(height: 10.sp,),
            Container(
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.sp),
                border: Border.all(color: kBorderColor)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      height: 13.sp,
                      width: 13.sp,
                      child: ImageUtil.iconImageClass.rupees2Icon),
                  Text("800",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                    color: kBlackColor
                  ),),
                ],
              ),
            ),
            SizedBox(height: 20.sp,),
            GestureDetector(
              onTap: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add,color: kWhiteColor,),
                  ),
                  SizedBox(width: 10.sp,),
                  Text("Add payment",style: CustomTextStyle.semiBoldFont18Style.copyWith(
                    color: kPrimaryColor
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
