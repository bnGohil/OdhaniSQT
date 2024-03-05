import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';
import '../../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../../utils/utils.dart';
import '../../../notification/route/notification_route.dart';
import '../../component/job_status_widget.dart';
import '../../component/order_total_amount_widget.dart';
class CompletedOrderDetailsPage extends StatefulWidget {
  const CompletedOrderDetailsPage({super.key});

  @override
  State<CompletedOrderDetailsPage> createState() => _CompletedOrderDetailsPageState();
}

class _CompletedOrderDetailsPageState extends State<CompletedOrderDetailsPage> {


  bool isOrderDetail = false;
  bool isJobDetail = false;




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
        title: "Completed Orders",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: JobStatusWidget(
                isStatus: false,
                status: JobStatus.PENDING,
                onWorkingOnTap: (p0) {
                  setState(() {

                  });
                },
              ),
            ),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Container(
                decoration: CustomDecoration.detailDecoration,
                padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
                child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Total Amount",style: CustomTextStyle.regularFont16Style,),
                       Row(
                         children: [
                           SizedBox(
                               height: 13.sp,
                               width: 13.sp,
                               child: ImageUtil.iconImageClass.rupees2Icon),
                           Text("800",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                             color: kBlackColor
                           ),),
                         ],
                       )
                     ],
                   ),
                   SizedBox(height: 10.sp,),
                   Divider(
                     color: Color(0xffD9D9D9),
                   ),
                   SizedBox(height: 10.sp,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Paid Amount",style: CustomTextStyle.regularFont16Style,),
                       Row(
                         children: [
                           SizedBox(
                               height: 13.sp,
                               width: 13.sp,
                               child: ImageUtil.iconImageClass.rupees2Icon),
                           Text("800",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                               color: kBlackColor
                           ),),
                         ],
                       )
                     ],
                   ),

                 ],
                ),
              ),
            ),
            SizedBox(height: 20.sp,),
            OrderDeliveryWidget(),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isOrderDetail =! isOrderDetail;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("Order Detail",style: CustomTextStyle.semiBoldFont18Style.copyWith(color: kWhiteColor),)),
                      SizedBox(
                          height: 24.sp,
                          width:24.sp,
                          child: isOrderDetail ? ImageUtil.iconImageClass.arrowDropUpOutlined : ImageUtil.iconImageClass.dropDownWhiteIcon
                      )

                    ],
                  ),
                ),
              ),
            ),
            if(isOrderDetail)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.sp),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Contact No.",style: CustomTextStyle.regularFont16Style),
                          Text("+91 96* *** **52",style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",style: CustomTextStyle.regularFont16Style),
                          Text("poojagajera2015@gmail.com",style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",style: CustomTextStyle.regularFont16Style),
                          Text("34, shyam Enclave, Opp madhav Farm Ahmedabad Gujrat 382330",style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Text("Anarkali Kurti",style: CustomTextStyle.semiBoldRegularFont24Style.copyWith(
                        color: kBlackColor
                    ),),
                    SizedBox(height: 10.sp),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.sp),
                            decoration: CustomDecoration.detailDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Order Date",style: CustomTextStyle.regularFont16Style),
                                Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.mediumFont18Style)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.sp,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.sp),
                            decoration: CustomDecoration.detailDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Delivery Date",style: CustomTextStyle.regularFont16Style),
                                Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.mediumFont18Style)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.sp),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Quantity",style: CustomTextStyle.regularFont16Style),
                          Text("1",style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.sp),
                            decoration: CustomDecoration.detailDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Kurti Length",style: CustomTextStyle.regularFont16Style),
                                Text("34 cm",style: CustomTextStyle.mediumFont18Style)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.sp,),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(15.sp),
                            decoration: CustomDecoration.detailDecoration,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Kurti Width",style: CustomTextStyle.regularFont16Style),
                                Text("24 cm",style: CustomTextStyle.mediumFont18Style)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            SizedBox(height: 20.sp,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isJobDetail =! isJobDetail;
                  });
                },
                child: AnimatedContainer(
                  curve: Curves.bounceIn,
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: kPrimaryColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text("Jobs Detail",style: CustomTextStyle.semiBoldFont18Style.copyWith(color: kWhiteColor),)),
                      SizedBox(
                          height: 24.sp,
                          width:24.sp,
                          child: isJobDetail ? ImageUtil.iconImageClass.arrowDropUpOutlined : ImageUtil.iconImageClass.dropDownWhiteIcon
                      )

                    ],
                  ),
                ),
              ),
            ),
            if(isJobDetail)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.sp),
                  JobStatusWidget(
                    isEdit: false,
                    workingStatus: WorkingStatus.PENDING,
                    isStatus: true,
                    onWorkingOnTap: (p0) {
                      setState(() {

                      });
                    },
                  ),
                  SizedBox(height: 15.sp),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.sp),
                    decoration: CustomDecoration.detailDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Job Order No.",style: CustomTextStyle.regularFont16Style),
                        Text("245261",style: CustomTextStyle.mediumFont18Style)
                      ],
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.sp),
                    decoration: CustomDecoration.detailDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address",style: CustomTextStyle.regularFont16Style),
                        Text("78, Via Domenico Maria Manni Nikol,Ahmedabad - 382350",style: CustomTextStyle.mediumFont18Style)
                      ],
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.sp),
                          decoration: CustomDecoration.detailDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product",style: CustomTextStyle.regularFont16Style),
                              Text("Anarkali kurti",style: CustomTextStyle.mediumFont18Style)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.sp,),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(15.sp),
                          decoration: CustomDecoration.detailDecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Product Quantity",style: CustomTextStyle.regularFont16Style),
                              Text("1",style: CustomTextStyle.mediumFont18Style)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15.sp),
                    decoration: CustomDecoration.detailDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Material",style: CustomTextStyle.regularFont16Style),
                        Text("Cloth, Canvas",style: CustomTextStyle.mediumFont18Style)
                      ],
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Container(
                    width: double.infinity,
                    decoration: CustomDecoration.detailDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.sp,right: 20.sp,left: 20.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Krisha Creativity",style: CustomTextStyle.mediumFont18Style,),
                              SizedBox(height: 11.sp,),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 18.sp,
                                      width: 18.sp,
                                      child: ImageUtil.iconImageClass.stichIcon),
                                  SizedBox(width: 5.sp,),
                                  Expanded(child: Text("Stich",style: CustomTextStyle.regularFont16Style))
                                ],
                              ),
                              SizedBox(height: 11.sp,),
                              Row(
                                children: [
                                  SizedBox(
                                      height: 18.sp,
                                      width: 18.sp,
                                      child: ImageUtil.iconImageClass.rupeesIcon),
                                  SizedBox(width: 5.sp,),
                                  Expanded(child: Text("6000",style: CustomTextStyle.regularFont16Style))
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 11.sp,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                          decoration: BoxDecoration(
                              color: const Color(0xffF6DAE1),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(15.sp),
                                bottomLeft: Radius.circular(15.sp),
                              )

                          ),
                          child: Row(

                            children: [
                              SizedBox(
                                height: 18.sp,
                                width: 18.sp,
                                child: ImageUtil.iconImageClass.calenderIcon,
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Expanded(
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Order Date - ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp)),
                                    Flexible(
                                      child: Tooltip(
                                        message: DateTime.now().formatCommonDate(),
                                        child: Text(DateTime.now().formatCommonDate(),
                                            style: CustomTextStyle.semiBoldFont14Style.copyWith(
                                                overflow: TextOverflow.ellipsis,
                                                decoration: TextDecoration.none
                                            )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                                child: Container(
                                  height: 1.sp,
                                  width: 5.sp,
                                  color: kBlackColor,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Due Date - ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp)),
                                    Flexible(child: Tooltip(
                                        message:DateTime.now().formatCommonDate(),
                                        child: Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldFont14Style)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Text("Photos",style: CustomTextStyle.mediumFont16Style,),
                  SizedBox(height: 10.sp),
                  Wrap(
                    spacing: 5.sp,
                    runSpacing: 5.sp,
                    children: List.generate(5 ?? 0, (index) => SizedBox(
                        width: 80.sp,
                        height: 80.sp,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.sp),
                            child: Image.asset("assets/images/dummy_img/image_2.png",fit: BoxFit.cover)))),
                  )
                ],
              ),
            )
            // Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.sp),
            //     child: _renderSteps())
          ],
        ),
      ),
    );
  }



}
