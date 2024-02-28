import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utils/utils.dart';

class FromToDatePicker extends StatefulWidget {
  final Widget? startDate;
  final Widget? lastDate;
   FromToDatePicker({super.key,this.startDate,this.lastDate});

  @override
  State<FromToDatePicker> createState() => _FromToDatePickerState();
}

class _FromToDatePickerState extends State<FromToDatePicker> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: widget.startDate ?? CustomDatePickerWidget(
                    radius: 8,

                    onSelectedDateTime: (p0) async{
                      setState((){
                        startDate = p0;
                      });

                      // final reportProvider = context.read<ReportProvider>();
                      // await reportProvider.reportList(reportReqModel: ReportReqModel(
                      //   startDate: DateTime.now(),
                      //   endDate: DateTime.now(),
                      // ));
                    },

                    shoDatePicker: false,

                    name: startDate != null
                        ? DateFormat("MM/dd/yyyy").format(startDate ?? DateTime.now())
                        : "Start Date"),
              ),
            ],
          ),
        ),

        SizedBox(width: 20.sp),

        Expanded(
          child: Row(
            children: [
              Expanded(
                child: widget.lastDate ?? CustomDatePickerWidget(
                    radius: 8,
                    onSelectedDateTime: (p0) async{
                      setState((){
                        endDate = p0;
                      });
                    },
                    shoDatePicker: false,
                    name: endDate != null
                        ? DateFormat("MM/dd/yyyy").format(endDate ?? DateTime.now())
                        : "End Date"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
