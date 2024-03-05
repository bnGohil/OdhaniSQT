import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/sizer/enum.dart';
import '../../../../utils/theme/custom_decocarion.dart';
import '../../../boutique_app/notification/route/notification_route.dart';
import '../../../boutique_app/order/component/job_status_widget.dart';
class SendRequestForDeuAmountPage extends StatefulWidget {
  const SendRequestForDeuAmountPage({super.key});

  @override
  State<SendRequestForDeuAmountPage> createState() => _SendRequestForDeuAmountPageState();
}

class _SendRequestForDeuAmountPageState extends State<SendRequestForDeuAmountPage> {
  JobStatus jobStatus = JobStatus.COMPLETED;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        title: "Complete Order",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
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
              SizedBox(height: 10.sp,),
              Text("Payment Request",style: CustomTextStyle.semiBoldRegularFont16Style,),
              SizedBox(height: 10.sp,),
              Container(
                decoration: CustomDecoration.detailDecoration,
                padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 15.sp),
                child: Row(
                  children: [
                    Expanded(child: Text("Payment Request Sent",style: CustomTextStyle.regularFont16Style.copyWith(color: kBlackColor),)),
                    Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(color: kBlackColor),)
          
                  ],
                ),
              ),
              SizedBox(height: 10.sp,),
              Container(
                decoration: CustomDecoration.detailDecoration,
                padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 15.sp),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text("Payment Receive",style: CustomTextStyle.regularFont16Style.copyWith(color: kBlackColor),)),
                        Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(color: kBlackColor),)
          
                      ],
                    ),
                    SizedBox(height: 10.sp,),
                    Row(
                      children: [
                        Expanded(child: Text("MOP",style: CustomTextStyle.regularFont16Style.copyWith(color: kBlackColor),)),
                        Text("Gpay",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(color: kBlackColor),)
          
                      ],
                    ),
                    SizedBox(height: 20.sp,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Payment Accept",style: CustomTextStyle.semiBoldFont18Style.copyWith(color: kPrimaryColor),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.sp,),
            ],
          ),
        ),
      ),

    );
  }
}
