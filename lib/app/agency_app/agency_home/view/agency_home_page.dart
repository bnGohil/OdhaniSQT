import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/utils.dart';
import '../../../boutique_app/app_custom_component/jobs_and_order_card.dart';
import '../../../boutique_app/home/component/home_grid_card.dart';
import '../../../boutique_app/home/domian/dummy/jobs_and_order_dummy_model.dart';
import '../../../boutique_app/job/route/job_route.dart';
import '../../../boutique_app/notification/route/notification_route.dart';
import '../../../boutique_app/order/route/order_route.dart';
import '../../agency_job_details/route/agency_job_details_route.dart';

class AgencyHomePage extends StatefulWidget {
  const AgencyHomePage({super.key});

  @override
  State<AgencyHomePage> createState() => _AgencyHomePageState();
}

class _AgencyHomePageState extends State<AgencyHomePage> {
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
                SizedBox(height: 10.sp,),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: JobsAndOrderDummyModel.jobAgencyPendingListData.length,
                  itemBuilder: (context, index) {
                    final jobsAndOrderDummyModel = JobsAndOrderDummyModel.jobAgencyPendingListData[index];
                    return GestureDetector(
                      onTap: () {
                        AgencyJobDetailsRoute.goToAgencyJobDetailsPage(context,jobsAndOrderDummyModel.jobStatus);
                        },
                      child: JobsAndOrderCardWidget(jobsAndOrderDummyModel: jobsAndOrderDummyModel),
                    );
                  },),

              ],
            ),
          ),
        )
    );
  }
}
