import 'package:flutter/material.dart';
import '../../../../base/view/base_components/skeleton_loading.dart';
import '../../../../utils/utils.dart';
import '../commonent/custom_report_card.dart';
import '../commonent/sales_weekly_card.dart';



class DailyReport extends StatefulWidget {
  DailyReport({Key? key}) : super(key: key);

  @override
  _DailyReportState createState() {
    return _DailyReportState();
  }
}

final cDate = DateTime.now().day;

class _DailyReportState extends State<DailyReport> {

  int reportDay = 0;

  @override
  void initState() {
    super.initState();

    reportDay = DateTime.now().day;

    setState(() {

    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final reportProvider = context.watch<ReportProvider>();
    // final userProvider = context.watch<UserProvider>();
    // final currencyData = userProvider.getCurrencyTypeResponse.data?.data;
    // final reportData = reportProvider.reportListResponse.data?.data;
    // final reportLoader = reportProvider.reportListResponse.state == Status.LOADING;
    //
    // var date = DateTime.now();
    //
    // var dateFormat =  DateFormat('dd-MM-yyyy').format(date ?? DateTime.now());
    //
    // final maxDateValidate = reportData?.salesCount?.startDate == dateFormat;


    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if(reportData?.list?.isEmpty == true  && !reportLoader)
          //    const Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text("No data Found"),
          //     ],
          //   ),


          SizedBox(height: 10.sp),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: ()async{
                  // final reportProvider = context.read<ReportProvider>();

                  setState(() {
                    reportDay  = reportDay - 1;
                  });

                  // await reportProvider.reportList(reportReqModel: ReportReqModel(
                  //   startDate: DateTime(date.year, date.month, reportDay),
                  //   endDate: DateTime(date.year, date.month, reportDay),
                  // ));

                },
                icon: Icon(Icons.chevron_left,
                  color: Colors.black,
                  size: 30.sp,
                ),),

              SkeletonView(
                borderRadius: BorderRadius.circular(8.sp),
                isLoading: false,
                skeletonBody: Row(
                  children: [
                      const SizedBox(
                      width: 20,
                      ),

                    SizedBox(
                      height: 20.sp,
                      width: 220,
                    ),

                     const SizedBox(
                      width: 20,
                     ),
                  ],
                ),
                child: Expanded(child: Align(
                    alignment: Alignment.center,
                    child: Text("23/11/2023",style: CustomTextStyle.blackBoldFont16Style))),
              ),

              IconButton(
                padding: EdgeInsets.zero,
                onPressed:
                // maxDateValidate == false
                //     ? ()async{
                //
                //   setState(() {
                //     reportDay  = reportDay + 1;
                //   });
                //
                //   await reportProvider.reportList(reportReqModel: ReportReqModel(
                //     startDate: DateTime(date.year, date.month, reportDay),
                //     endDate: DateTime(date.year, date.month, reportDay),
                //   ));
                // }
                // :
                    (){
                        setState(() {
                          reportDay  = reportDay + 1;
                        });
                    },
                icon: Icon(Icons.chevron_right,
                color:
                // maxDateValidate ? Colors.grey :
                Colors.black,
                size: 30.sp,
              ),)
            ],
          ),

          SalesWeeklyCard(
            loader: false,
            cardText: "Monthly",
            // totalOrder: double.tryParse(monthlyData?.salesCount?.totalSum ?? "")  ?? 0.0,
            // sales: double.tryParse(monthlyData?.salesCount?.orderCount ?? "")  ?? 0.0,
            // avgValue: double.tryParse(monthlyData?.salesCount?.avg ?? "") ?? 0.0 ,
            totalOrder: "₹1000" ?? "",
            sales: "10" ?? "",
            avgValue: "₹25" ?? "",
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.sp),
            child: Text("Sales Overview",style: CustomTextStyle.blackRegularFont16Style.copyWith(fontSize: 22.sp)),
          ),

          // if(reportData?.list?.isEmpty == true)
          //   Expanded(
          //     child: const Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text("No data Found"),
          //       ],
          //     ),
          //   ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20.sp,right: 20.sp,bottom: MediaQuery.of(context).padding.bottom + 20.sp),
              itemCount: reportCardList.length,
              itemBuilder:(context, index) {
                return  CustomReportCard(
                  reportCardModel: reportCardList[index],
                );
              }, ),
          )

        ],
      ),
    );
  }
}