import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../app_custom_component/jobs_and_order_card.dart';
import '../../job/route/job_route.dart';
import '../../notification/route/notification_route.dart';
import '../../order/route/order_route.dart';
import '../component/home_grid_card.dart';
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
          action: GestureDetector(
              onTap: () {
                NotificationRoute.goToNotification(context);
              },
              child: ImageUtil.iconImageClass.notificationIcon),
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
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: JobsAndOrderDummyModel.jobsListData.length,
                itemBuilder: (context, index) {
                  final jobsAndOrderDummyModel = JobsAndOrderDummyModel.jobsListData[index];
                return GestureDetector(
                  onTap: () {
                    JobRoute.goToJobDetailsPage(context);
                  },
                  child: JobsAndOrderCardWidget(
                    jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                  ),
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
                  return GestureDetector(
                    onTap: () {
                      OrderRoute.goToOrderDetailsPage(context);
                    },
                    child: JobsAndOrderCardWidget(
                      jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                    ),
                  );
                },),
            ],
          ),
        ),
      )
    );
  }
}
