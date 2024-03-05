import 'package:flutter/material.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/common_utils/custom_tabbar_view.dart';
import '../../../../utils/sizer/enum.dart';
import '../../../../utils/utils.dart';
import '../../../boutique_app/app_custom_component/jobs_and_order_card.dart';
import '../../../boutique_app/home/domian/dummy/jobs_and_order_dummy_model.dart';
import '../../../boutique_app/notification/route/notification_route.dart';
import '../../../boutique_app/order/route/order_route.dart';
import '../../agency_job_details/route/agency_job_details_route.dart';

class AgencyOrderPage extends StatefulWidget {
  const AgencyOrderPage({super.key});

  @override
  State<AgencyOrderPage> createState() => _AgencyOrderPageState();
}

class _AgencyOrderPageState extends State<AgencyOrderPage> {


  int selectedIndex = 0;

  List<String> tabList = ["Accept","Reject","Pending"];

  List<JobsAndOrderDummyModel> list = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      list = JobsAndOrderDummyModel.jobAcceptsListData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: CustomAppbar(
        height: 100.sp,
        leading: SizedBox(
          height: 24.sp,
          width: 24.sp,
          child: ImageUtil.iconImageClass.searchIcon,
        ),
        title: "Jobs",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),

      body: Column(
        children: [
          SizedBox(height: 5.sp,),
          CustomTabBarView(
            tabList: tabList,
            callBackFun: (p0) {
              setState(() {
                selectedIndex = p0;

                switch(p0){

                  case 0 :
                    setState(() {list = JobsAndOrderDummyModel.jobAcceptsListData;});
                   case 1 :
                     setState(() {list = JobsAndOrderDummyModel.jobAgencyRejectListData;});
                   case 2 :
                     setState(() {list = JobsAndOrderDummyModel.jobAgencyTabPendingListData;});
                     break;


                }

              });
            },
          ),
          SizedBox(height: 5.sp,),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            itemCount: list.length,
            itemBuilder: (context, index) {

              final jobsAndOrderDummyModel = list[index];

              jobsAndOrderDummyModel.index ??= 0;
              jobsAndOrderDummyModel.index = index;


              print("jobsAndOrderDummyModel.index test ${jobsAndOrderDummyModel.index}");


              return GestureDetector(
                onTap: () async{

                  final data = await Navigator.pushNamed(context,AgencyJobDetailsRoute.agencyJobDetailsRoute,arguments: GetHomeAgencyData(index: index,jobStatus: jobsAndOrderDummyModel.jobStatus));


                  if(data != null){





                    setState(() {




                      list.where((element) => element.index == data).forEach((element) {

                        element.jobStatus = JobStatus.ACCEPT;


                      });











                    });



                  }


                  // AgencyJobDetailsRoute.goToAgencyJobDetailsPage(context,GetHomeAgencyData(
                  //   jobStatus: jobsAndOrderDummyModel.jobStatus,
                  //   index: index
                  // ));
                },
                child: JobsAndOrderCardWidget(
                  jobsAndOrderDummyModel: jobsAndOrderDummyModel,
                ),
              );
            },))
        ],
      ),

    );
  }
}
