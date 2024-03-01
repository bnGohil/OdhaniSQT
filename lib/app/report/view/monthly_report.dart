import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../order/component/form_to_datepicker.dart';
import '../commonent/custom_report_card.dart';
import '../commonent/sales_weekly_card.dart';

class MonthlyReport extends StatefulWidget {
  const MonthlyReport({super.key});

  @override
  State<MonthlyReport> createState() => _MonthlyReportState();
}

class _MonthlyReportState extends State<MonthlyReport> {
  DateTime? startDate;
  DateTime? endDate;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.sp),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.sp),
          child: FromToDatePicker(
            startDate: CustomDatePickerWidget(
                initialDate: startDate,
                firstDate: DateTime(1800),
                lastDate: DateTime.now(),
                radius: 8,

                onSelectedDateTime: (p0) async{
                  setState((){
                    startDate = p0;
                  });

                  // try{
                  //   final reportProvider = context.read<ReportProvider>();
                  //
                  //   await reportProvider.monthlyList(reportReqModel: ReportReqModel(
                  //     startDate: startDate,
                  //     endDate: endDate ?? DateTime.now(),
                  //   ));
                  //
                  // }catch(e){
                  //   print(e.toString());
                  // }

                },

                shoDatePicker: false,

                name: startDate != null
                    ? DateFormat("dd/MM/yyyy").format(startDate ?? DateTime.now())
                    : "Start Date"),


            lastDate: CustomDatePickerWidget(
                initialDate: endDate,
                firstDate: startDate,
                lastDate: DateTime.now(),
                radius: 8,
                onSelectedDateTime: (p0) async{
                  setState((){
                    endDate = p0;
                  });

                  // try{
                  //
                  //   final reportProvider = context.read<ReportProvider>();
                  //
                  //   await reportProvider.monthlyList(reportReqModel: ReportReqModel(
                  //     startDate: startDate ?? DateTime.now(),
                  //     endDate: endDate ?? DateTime.now(),
                  //   ));
                  //
                  // }catch(e){
                  //
                  //   Toaster.showMessage(context, msg: e.toString());
                  //
                  // }


                },
                shoDatePicker: false,
                name: endDate != null
                    ? DateFormat("dd/MM/yyyy").format(endDate ?? DateTime.now())
                    : "End Date"),
          ),
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
    );
  }
}
