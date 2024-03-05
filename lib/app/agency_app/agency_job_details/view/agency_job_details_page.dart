import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/boutique_app/order/component/job_status_widget.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../base/view/base_components/custom_button.dart';
import '../../../../utils/common_utils/custom_tabbar_view.dart';
import '../../../../utils/theme/custom_decocarion.dart';
import '../../../boutique_app/app_custom_component/app_bar_component.dart';
import '../../../boutique_app/chat/route/chat_route.dart';
import '../../../boutique_app/job/route/job_route.dart';
import '../../../boutique_app/order/domian/order_tab_list_data.dart';
class AgencyJobDetailsPage extends StatefulWidget {
  const AgencyJobDetailsPage({super.key});

  @override
  State<AgencyJobDetailsPage> createState() => _AgencyJobDetailsPageState();
}

class _AgencyJobDetailsPageState extends State<AgencyJobDetailsPage> {

  JobStatus? jobStatus;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
  //
  //
  //
  //     final jobStatus = ModalRoute.of(context)?.settings.arguments as JobStatus?;
  //
  //     setState(() {
  //
  //       this.jobStatus = jobStatus;
  //
  //     });
  //
  //
  //
  //
  //   });
  //
  //
  // }


  @override
  Widget build(BuildContext context) {
    var jobStatus = ModalRoute.of(context)?.settings.arguments as JobStatus?;
    this.jobStatus = jobStatus;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
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
                    leading: Icon(Icons.arrow_back_outlined,size: 24.sp,color: kBlackColor),
                    action: Icon(Icons.add,size: 24.sp,color: kBlackColor),
                    title: "Jobs Order Detail",
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
                toolbarHeight: 170.sp,
                flexibleSpace: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: JobStatusWidget(
                    status: jobStatus,
                    isEdit: false,
                    isStatus: false,
                    onStatusOnTap: (p0) {
                      setState(() {
                        jobStatus = p0;
                      });
                    },
                  ),
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
                            padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
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
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Order Date - ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 10.sp)),
                                      Flexible(
                                        child: Tooltip(
                                          message: DateTime.now().formatCommonDate(),
                                          child: Text(DateTime.now().formatCommonDate(),
                                              style: CustomTextStyle.semiBoldFont14Style.copyWith(
                                                  fontSize: 10.sp
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
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Due Date - ",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 10.sp)),
                                      Flexible(child: Tooltip(
                                          message:DateTime.now().formatCommonDate(),
                                          child: Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.semiBoldFont14Style.copyWith(fontSize: 10.sp))))
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
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 90.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      btnColor: kLightWhiteColor,
                      radius: 100.sp,
                      onTap: () {

                      },
                      textStyle: CustomTextStyle.mediumFont18Style,
                      btnText: "Complete",
                      // btnText: workingStatus == WorkingStatus.PENDING ?  "Cancel Order" : workingStatus?.title,
                      isBoxShadow: false,
                    ),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(
                    child: CustomButton(
                      radius: 100.sp,
                      btnText: "Query Log",
                      onTap: () {
                        ChatRoute.goToChatPage(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}