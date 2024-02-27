import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/app_custom_component/jobs_and_order_card.dart';
import 'package:odhani_design_sqt/app/home/component/home_grid_card.dart';
import 'package:odhani_design_sqt/app/tab/domian/tab_model.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/common_utils/custom_app_bar.dart';
import '../domian/dummy/jobs_and_order_dummy_model.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          height: 100.sp,
          leading: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.searchIcon,
          ),
          title: "Home",
          action: SizedBox(
            child: ImageUtil.iconImageClass.notificationIcon,
          ),
        ),
      backgroundColor: kBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeGridCardView(),
              SizedBox(height: 10.sp,),
              Text("Job’s",style: CustomTextStyle.semiBoldRegularFont20Style,),
              SizedBox(height: 10.sp,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: JobsAndOrderDummyModel.jobsListData.length,
                itemBuilder: (context, index) {
                  final jobsAndOrderDummyModel = JobsAndOrderDummyModel.jobsListData[index];
                return JobsAndOrderCardWidget(
                  jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                );
              },),
              SizedBox(height: 10.sp,),
              Text("Orders List",style: CustomTextStyle.semiBoldRegularFont20Style,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: JobsAndOrderDummyModel.orderListData.length,
                itemBuilder: (context, index) {
                  final jobsAndOrderDummyModel = JobsAndOrderDummyModel.orderListData[index];
                  return JobsAndOrderCardWidget(
                    jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                  );
                },),
            ],
          ),
        ),
      )
    );
  }
}
