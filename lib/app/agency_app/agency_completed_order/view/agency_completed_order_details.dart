import 'package:flutter/material.dart';

import '../../../../base/view/base_components/custom_button.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/sizer/enum.dart';
import '../../../../utils/theme/custom_decocarion.dart';
import '../../../../utils/utils.dart';
import '../../../boutique_app/notification/route/notification_route.dart';
import '../../../boutique_app/order/component/job_status_widget.dart';

class CompletedOrderAgencyDetailsScreen extends StatefulWidget {
  const CompletedOrderAgencyDetailsScreen({super.key});

  @override
  State<CompletedOrderAgencyDetailsScreen> createState() => _CompletedOrderAgencyDetailsScreenState();
}

class _CompletedOrderAgencyDetailsScreenState extends State<CompletedOrderAgencyDetailsScreen> {
  WorkingStatus? workingStatus = WorkingStatus.COMPLETED;


  List<String> list = ["GPay","PhonePe","Ptm"];


  String? selectedValue;
  String? _selectedItem;
  List<String> _items = ["GPay","PhonePe","Ptm"];


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
                showModalBottomSheet(context: context, builder: (context) {
                  return StatefulBuilder(
                    builder: (context, setState) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 1.sp,width: 50.sp,
                              color: kLightGrayColor,
                            ),
                            SizedBox(height: 10.sp,),
                            Row(
                              children: [
                                Expanded(child: Text("Due Amount",style: CustomTextStyle.semiBoldRegularFont20Style,)),
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      border: Border.all(width: 1.sp,color: Color(0xffD9D9D9))
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 13.sp,
                                          height: 13.sp,
                                          child: ImageUtil.iconImageClass.rupees2Icon),
                                      Text("800",style: CustomTextStyle.semiBoldRegularFont16Style,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10.sp,),
                            Row(
                              children: [
                                Expanded(child: Text("Mode of Payment",style: CustomTextStyle.semiBoldRegularFont20Style,)),
                                Expanded(child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5.sp),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.sp),
                                      border: Border.all(width: 1.sp,color: Color(0xffD9D9D9))
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: Text("Payment Type",style: CustomTextStyle.hintTextStyle,),
                                      value: _selectedItem,
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedItem = value ?? "";
                                        });
                                      },
                                      items: _items.map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item,style: CustomTextStyle.mainColorBoldFont16Style),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(height: 10.sp,),
                            CustomButton(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              radius: 100,
                              btnText: "Done",
                              btnColor: kPrimaryColor,
                            )
                          ],
                        ),
                      );
                    },

                  );
                },);
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
