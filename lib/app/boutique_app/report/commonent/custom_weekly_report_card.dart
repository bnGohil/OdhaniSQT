import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../base/view/base_components/skeleton_loading.dart';

class CustomWeeklyReportCard extends StatefulWidget {
  bool? loader;
  final String date;
  final String datePrice;
  final double totalOrder;
  final String orderValue;
   CustomWeeklyReportCard({super.key, this.loader ,required this.date, required this.datePrice, required this.orderValue, required this.totalOrder});

  @override
  State<CustomWeeklyReportCard> createState() => _CustomWeeklyReportCardState();
}

class _CustomWeeklyReportCardState extends State<CustomWeeklyReportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.sp),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.sp),
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.sp),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,0),
                    blurRadius: 20.sp,
                    color: kTextSecondaryColor.withOpacity(0.15)
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 15.sp,horizontal: 15.sp),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        SkeletonView(
                          borderRadius: BorderRadius.circular(8.sp),
                          isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 180.sp,
                            ),
                            child: Text(widget.date,style: CustomTextStyle.regularFont16Style,)),

                        SkeletonView(
                            borderRadius: BorderRadius.circular(8.sp),
                            isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 80.sp,
                            ),
                            child: Text("\$${widget.datePrice.toString()}",style: CustomTextStyle.blackBoldFont16Style,)),
                      ],
                    ),

                    if(widget.loader == true)
                      SizedBox(
                        height: 5.sp,
                      ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonView(
                            borderRadius: BorderRadius.circular(8.sp),
                            isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 180.sp,
                            ),
                            child: Text("Orders",style: CustomTextStyle.regularFont16Style,)),

                        SkeletonView(
                            borderRadius: BorderRadius.circular(8.sp),
                            isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 80.sp,
                            ),
                            child: Text(widget.totalOrder.toString(),style: CustomTextStyle.blackBoldFont16Style,)),
                      ],
                    ),

                    Divider(color: Color(0xff291F1F).withOpacity(0.4)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SkeletonView(
                            borderRadius: BorderRadius.circular(8.sp),
                            isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 180.sp,
                            ),
                            child: Text("Average Order Value",style: CustomTextStyle.regularFont16Style,)),


                        SkeletonView(
                            borderRadius: BorderRadius.circular(8.sp),
                            isLoading: widget.loader,
                            skeletonBody: SizedBox(
                              height: 30.sp,
                              width: 80.sp,
                            ),
                            child: Text("${widget.orderValue.toString()}",style: CustomTextStyle.blackBoldFont16Style,)),
                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
