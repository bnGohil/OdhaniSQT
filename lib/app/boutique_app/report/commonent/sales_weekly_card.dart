
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../base/view/base_components/skeleton_loading.dart';

class SalesWeeklyCard extends StatefulWidget {
  bool? loader;
  final String? sales;
  final String? totalOrder;
  final String? avgValue;
  final String? cardText;
  SalesWeeklyCard({Key? key,this.sales, this.totalOrder, this.avgValue,this.loader,this.cardText}) : super(key: key);

  @override
  _SalesWeeklyCardState createState() {
    return _SalesWeeklyCardState();
  }
}

class _SalesWeeklyCardState extends State<SalesWeeklyCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("${widget.loader} ===  check this loader");

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,0),
                blurRadius: 20.sp,
                color: kTextSecondaryColor.withOpacity(0.15)
            )
          ]
      ),
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              children: [
                SkeletonView(
                    isLoading: widget.loader,
                    borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 40.sp,
                    ),
                    child: Text("${widget.sales}",style: CustomTextStyle.mainColorBoldFont18Style.copyWith(color: kWhiteColor),)),

                if(widget.loader == true)
                SizedBox(
                  height: 5.sp
                ),

                SkeletonView(
                    isLoading: widget.loader,
                    borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    child: Text("${widget.cardText} \nsales",style: CustomTextStyle.blackRegularFont16Style.copyWith(fontSize: 14.sp,color: kWhiteColor),textAlign: TextAlign.center)),
              ],
            ),
          ),
          Container(width: 1,height: 50.sp,color: Colors.grey),

          Expanded(
            child: Column(
              children: [
                SkeletonView(
                    isLoading: widget.loader,
                    borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 40.sp,
                    ),
                    child: Text("${widget.totalOrder}",style: CustomTextStyle.mainColorBoldFont18Style.copyWith(color: kWhiteColor),)),

                if(widget.loader == true)
                  SizedBox(
                    height: 5.sp,
                  ),

                SkeletonView(
                    isLoading: widget.loader,
                    borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    child: Text("Total \nOrders",style: CustomTextStyle.blackRegularFont16Style.copyWith(fontSize: 14.sp,color: kWhiteColor),textAlign: TextAlign.center)),
              ],
            ),
          ),
          Container(width: 1,height: 50.sp,color: Colors.grey),

          Expanded(
            child: Column(
              children: [
                SkeletonView(
                    isLoading: widget.loader,
                    borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 40.sp,
                    ),
                    child: Text("${widget.avgValue}",style: CustomTextStyle.mainColorBoldFont18Style.copyWith(color: kWhiteColor),)),

                if(widget.loader == true)
                SizedBox(
                  height: 5.sp,
                ),


                SkeletonView(
                    isLoading: widget.loader,
                  borderRadius: BorderRadius.circular(8),
                    skeletonBody: SizedBox(
                      height: 30.sp,
                      width: 30.sp,
                    ),
                    child: Text("Avarage\n Order Value",style: CustomTextStyle.blackRegularFont16Style.copyWith(fontSize: 14.sp,color: kWhiteColor),textAlign: TextAlign.center)
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}