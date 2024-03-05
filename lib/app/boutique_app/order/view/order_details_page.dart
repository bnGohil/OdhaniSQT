import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_tabbar_view.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/theme/custom_decocarion.dart';
import '../../app_custom_component/app_bar_component.dart';
import '../../job/route/job_route.dart';
import '../domian/order_tab_list_data.dart';
class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
                  child: AppBarComponent(
                    actionOnTap: () {},
                    leadingOnTap: () {
                      Navigator.of(context).pop();
                    },
                    action: Icon(Icons.add,size: 24.sp,color: kBlackColor),
                    title: "Order Detail",
                  ),

                ),
              ),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverAppBar(
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                pinned: true,
                snap: false,
                floating: true,
                expandedHeight: 120.sp,
                toolbarHeight: 120.sp,
                flexibleSpace: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Text("Pooja Gajera",style: CustomTextStyle.semiBoldRegularFont24Style.copyWith(
                      color: kBlackColor
                    ),),
                  ),
                  SizedBox(height: 15.sp),
                  CustomTabBarView(
                    tabList: OrderDummyListData.orderListValue,
                    callBackFun: (p0) {

                    },
                  ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              sliver:SliverToBoxAdapter(
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        height: 100.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              radius: 100.sp,
              btnText: "Create Job Order",
              onTap: (){
                JobRoute.goToCreateJobPage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
