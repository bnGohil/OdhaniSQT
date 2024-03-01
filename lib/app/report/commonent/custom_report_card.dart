import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';
import 'package:odhani_design_sqt/utils/utils.dart';



class CustomReportCard extends StatefulWidget {
  ReportCardModel? reportCardModel;
    CustomReportCard({super.key,this.reportCardModel});

  @override
  State<CustomReportCard> createState() => _CustomReportCardState();
}

class _CustomReportCardState extends State<CustomReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: CustomDecoration.detailDecoration,
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text("Client Name",style: CustomTextStyle.blackRegularFont16Style,)),

              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text("${widget.reportCardModel?.cName}",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                  color: kBlackColor
                )),
              )),
            ],
          ),

          SizedBox(height: 3.sp),

          Row(
            children: [
              Expanded(child: Text("Product Name",style: CustomTextStyle.blackRegularFont16Style,)),

              Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("${widget.reportCardModel?.pName}",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                                    color: kBlackColor
                                  )),
                  )),
            ],
          ),

          SizedBox(height: 3.sp),

          Row(
            children: [
              Expanded(child: Text("Order Value",style: CustomTextStyle.blackRegularFont16Style,)),

              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text("${widget.reportCardModel?.orderValue}",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                  color: kBlackColor
                )),
              )),
            ],
          ),

          SizedBox(height: 3.sp),

          Row(
            children: [
              Expanded(child: Text("Order Completion",style: CustomTextStyle.blackRegularFont16Style,)),

              Expanded(child: Align(
                alignment: Alignment.centerRight,
                child: Text("${widget.reportCardModel?.orderCompletion}",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                  color: kBlackColor
                )),
              )),
            ],
          ),
        ],
      ),
    );
  }
}



