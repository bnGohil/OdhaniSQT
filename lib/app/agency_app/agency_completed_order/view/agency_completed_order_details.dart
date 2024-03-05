import 'package:flutter/material.dart';

import '../../../../base/view/base_components/custom_button.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/sizer/enum.dart';
import '../../../../utils/theme/custom_decocarion.dart';
import '../../../../utils/utils.dart';
import '../../../boutique_app/notification/route/notification_route.dart';
import '../../../boutique_app/order/component/job_status_widget.dart';
import '../route/completed_order_agency_route.dart';

class CompletedOrderAgencyDetailsScreen extends StatefulWidget {
  const CompletedOrderAgencyDetailsScreen({super.key});

  @override
  State<CompletedOrderAgencyDetailsScreen> createState() => _CompletedOrderAgencyDetailsScreenState();
}

class _CompletedOrderAgencyDetailsScreenState extends State<CompletedOrderAgencyDetailsScreen> {
  // WorkingStatus? workingStatus = WorkingStatus.COMPLETED;





  JobStatus jobStatus = JobStatus.COMPLETED;

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
              status: jobStatus,
              name: "Odhani Boutiue",
              onStatusOnTap: (p0) {

                setState(() {

                  jobStatus = p0;

                });

              },
              onWorkingOnTap: (p0) {

              },
              // workingStatus: workingStatus,
              // onWorkingOnTap: (p0) {
              //   setState(() {
              //     workingStatus = p0;
              //   });
              // },
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
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.sp,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20.sp),
              height: 50.sp,
              child: CustomButton(
                btnText: "Sent request for Due Amount",
                textStyle: CustomTextStyle.mediumFont18Style.copyWith(color: kWhiteColor),
                radius: 100,
                onTap: () {
                  CompletedOrderAgencyRoute.goToSendRequestPage(context);
                },
              )),
          SizedBox(height: 10.sp,),
        ],
      )),
    );
  }
}
