import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../domain/query_list_model.dart';
class QueryListDataWidget extends StatelessWidget {
  final QueryListModel? queryListModel;
  const QueryListDataWidget({super.key, this.queryListModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.sp),
      decoration: CustomDecoration.detailDecoration,
      padding: EdgeInsets.all(15.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(child: Text(queryListModel?.fashion ?? "",style: CustomTextStyle.semiBoldFont18Style,)),
              if(queryListModel?.dateTime != null)
                Text(DateFormat("dd/MM/yyyy").format(queryListModel!.dateTime!),style: CustomTextStyle.semiBoldFont14Style,)
            ],
          ),
          SizedBox(height: 8.sp,),
          Row(
            children: [
              Text("Job Order No. - ",style: CustomTextStyle.regularFont14Style,),
              Expanded(child: Text(queryListModel?.jobOrderNum ?? "",style: CustomTextStyle.semiBoldRegularFont16Style,))
            ],
          ),
          SizedBox(height: 8.sp,),
          Row(
            children: [
              Text("Customer Name - ",style: CustomTextStyle.regularFont14Style,),
              Expanded(child: Text(queryListModel?.cName ?? "",style: CustomTextStyle.semiBoldRegularFont16Style,))
            ],
          ),
          SizedBox(height: 8.sp,),
          Row(
            children: [
              Text("Product -  ",style: CustomTextStyle.regularFont14Style,),
              Expanded(child: Text(queryListModel?.product ?? "",style: CustomTextStyle.semiBoldRegularFont16Style,))
            ],
          ),


        ],
      ),
    );
  }
}
