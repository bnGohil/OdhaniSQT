import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../home/domian/dummy/jobs_and_order_dummy_model.dart';

class JobsAndOrderCardWidget extends StatefulWidget {
  final JobsAndOrderDummyModel? jobsAndOrderDummyModel;
  const JobsAndOrderCardWidget({super.key, this.jobsAndOrderDummyModel});

  @override
  State<JobsAndOrderCardWidget> createState() => _JobsAndOrderCardWidgetState();
}

class _JobsAndOrderCardWidgetState extends State<JobsAndOrderCardWidget> {
  @override
  Widget build(BuildContext context) {
    final orderValue = widget.jobsAndOrderDummyModel?.ordersValue?.join(",");
    return Container(
      margin: EdgeInsets.only(top: 10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        image: const DecorationImage(
            image: AssetImage("assets/images/graphics/card_back_ground.png"),
            fit: BoxFit.fill),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 35.sp,
                        width: 35.sp,
                        child: Image.asset(
                          widget.jobsAndOrderDummyModel?.profilePic ?? "",
                        )),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: Text(
                              widget.jobsAndOrderDummyModel?.title ?? "",
                              style: CustomTextStyle.mediumFont18Style,
                            ))),
                    if (widget.jobsAndOrderDummyModel?.typesOfApp == TypesOfApp.AGENCY)
                      Column(
                        children: [
                          if(widget.jobsAndOrderDummyModel?.jobStatus == JobStatus.PENDING)
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(100.sp)),
                                  child: Icon(Icons.check,
                                      color: kWhiteColor, size: 17.sp),
                                ),
                                SizedBox(width: 5.sp,),
                                Container(
                                  padding: EdgeInsets.all(5.sp),
                                  decoration: BoxDecoration(
                                      color: kBlackColor,
                                      borderRadius: BorderRadius.circular(100.sp)),
                                  child: Icon(Icons.close,
                                      color: kWhiteColor, size: 17.sp),
                                )
                              ],
                            )
                          else if(widget.jobsAndOrderDummyModel?.jobStatus == JobStatus.ACCEPT)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 8.sp),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(widget.jobsAndOrderDummyModel?.jobStatus?.jobTitle ?? "",style: CustomTextStyle.mediumFont16Style.copyWith(fontSize: 12.sp,color: kWhiteColor),))


                        ],
                      )
                    else
                       Column(
                         children: [
                           if(widget.jobsAndOrderDummyModel?.count != null)
                             Container(
                                 padding: EdgeInsets.symmetric(
                                     vertical: 7.sp, horizontal: 12.sp),
                                 decoration: BoxDecoration(
                                     color: kDarkOrangeColor,
                                     borderRadius: BorderRadius.circular(100.sp)),
                                 child: Text(
                                   widget.jobsAndOrderDummyModel?.count != null
                                       ? "${widget.jobsAndOrderDummyModel?.count}"
                                       : "",
                                   style: CustomTextStyle.mediumFont16Style
                                       .copyWith(color: kWhiteColor),
                                 ))
                         ],
                       )
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  children: [
                    if (orderValue?.isNotEmpty == true)
                      SizedBox(
                          width: 18.sp,
                          height: 18.sp,
                          child: ImageUtil.iconImageClass.dressIcon),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                        child: Text(
                      orderValue ?? "",
                      style: CustomTextStyle.regularFont16Style,
                    ))
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18.sp,
                      width: 18.sp,
                      child: ImageUtil.iconImageClass.locationIcon,
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                        child: Text(
                      widget.jobsAndOrderDummyModel?.location ?? "",
                      style: CustomTextStyle.regularFont16Style,
                    ))
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Wrap(
                  spacing: 5.sp,
                  runSpacing: 5.sp,
                  children: List.generate(
                      widget.jobsAndOrderDummyModel?.ordersImages?.length ?? 0,
                      (index) => SizedBox(
                          width: 51.sp,
                          height: 51.sp,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.sp),
                              child: Image.asset(
                                  widget.jobsAndOrderDummyModel
                                          ?.ordersImages?[index] ??
                                      "",
                                  fit: BoxFit.cover)))),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
            decoration: BoxDecoration(
                color: const Color(0xffF6DAE1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15.sp),
                  bottomLeft: Radius.circular(15.sp),
                )),
            child: Row(
              children: [
                SizedBox(
                  height: 18.sp,
                  width: 18.sp,
                  child: ImageUtil.iconImageClass.calenderIcon,
                ),
                SizedBox(
                  width: 5.sp,
                ),
                Expanded(
                  child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Order Date - ",
                          style: CustomTextStyle.regularFont16Style
                              .copyWith(fontSize: 10.sp)),
                      Flexible(
                        child: Tooltip(
                          message: DateFormat("dd/MM/yyyy").format(
                              widget.jobsAndOrderDummyModel!.orderDate!),
                          child: Text(
                              widget.jobsAndOrderDummyModel?.dueDate != null
                                  ? DateFormat("dd/MM/yyyy").format(
                                      widget.jobsAndOrderDummyModel!.dueDate!)
                                  : "",
                              style: CustomTextStyle.semiBoldFont14Style
                                  .copyWith(fontSize: 10.sp)),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Container(
                    height: 1.sp,
                    width: 5.sp,
                    color: kBlackColor,
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Due Date - ",
                          style: CustomTextStyle.regularFont16Style
                              .copyWith(fontSize: 10.sp)),
                      Flexible(
                          child: Tooltip(
                              message: DateFormat("dd/MM/yyyy").format(
                                  widget.jobsAndOrderDummyModel!.dueDate!),
                              child: Text(
                                  widget.jobsAndOrderDummyModel?.dueDate != null
                                      ? DateFormat("dd/MM/yyyy").format(widget
                                          .jobsAndOrderDummyModel!.dueDate!)
                                      : "",
                                  style: CustomTextStyle.semiBoldFont14Style
                                      .copyWith(fontSize: 10.sp))))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
