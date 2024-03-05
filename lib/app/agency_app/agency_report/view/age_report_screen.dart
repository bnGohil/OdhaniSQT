import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_report/view/age_daily_page.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_report/view/age_monthly_page.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_report/view/age_weekly_page.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/utils.dart';

class ReportAgencyScreen extends StatefulWidget {
  const ReportAgencyScreen({super.key});

  @override
  State<ReportAgencyScreen> createState() => _ReportAgencyScreenState();
}

class _ReportAgencyScreenState extends State<ReportAgencyScreen>with SingleTickerProviderStateMixin {

  int currentIndex = 0;
  TabController? tabController;
  @override
  void initState() {
    super.initState();

    tabController = TabController(length: reportTabList.length, vsync: this);

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
    //   final reportProvider = context.read<ReportProvider>();
    //   await reportProvider.reportList(reportReqModel: ReportReqModel(
    //     startDate: DateTime.now(),
    //     endDate: DateTime.now(),
    //   )
    //   );
    // });

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: kWhiteColor,
          appBar: CustomAppbar(
            height: 100.sp,
            title: "Report",
            action: GestureDetector(
                onTap: () {
                  // NotificationRoute.goToNotification(context);
                },
                child: ImageUtil.iconImageClass.notificationIcon),
          ),

          body: Column(
            children: [

              SizedBox(height: 20.sp),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                    color: Color(0xffF4F4F4),
                    borderRadius: BorderRadius.circular(50.sp)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(reportTabList.length, (index) {
                    return InkWell(
                      splashColor: kPrimaryColor.withOpacity(0.1),
                      onTap: ()async{
                        // final reportProvider = context.read<ReportProvider>();

                        setState(() {
                          currentIndex = index;
                          tabController?.animateTo(currentIndex,duration: const Duration(milliseconds: 400),curve: Curves.easeIn);
                        });

                        // switch(index){
                        //
                        //   case 0:
                        //
                        //     reportProvider.reportList(reportReqModel: ReportReqModel(
                        //       startDate: DateTime.now(),
                        //       endDate: DateTime.now(),
                        //     ));
                        //
                        //     break;
                        //
                        //   default :
                        //     return ;
                        // }
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.sp),
                            width: MediaQuery.sizeOf(context).width / 3.5,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 5.sp),
                            decoration: BoxDecoration(
                                color: currentIndex == index ? kPrimaryColor : Colors.transparent,
                                borderRadius: BorderRadius.circular(50.sp)
                            ),
                            child: Text(reportTabList[index],
                                style: currentIndex == index
                                    ? CustomTextStyle.mainColorBoldFont18Style.copyWith(color: kWhiteColor)
                                    : CustomTextStyle.blackRegularFont16Style.copyWith(fontSize: 18.sp)
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),


              Expanded(
                child: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      DailyAgencyReport(),
                      WeeklyAgencyReport(),
                      MonthlyAgencyReport(),
                    ]
                ),
              )
            ],
          )
      ),
    );
  }
}
