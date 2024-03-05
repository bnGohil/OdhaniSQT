import 'package:flutter/material.dart';
import '../../../../utils/common_utils/custom_tabbar_view.dart';
import '../../../../utils/utils.dart';
import '../domian/order_tab_list_data.dart';
import 'package:odhani_design_sqt/utils/sizer/enum.dart';

class JobStatusWidget extends StatefulWidget {
  final bool? isStatus;
  final WorkingStatus? workingStatus;
  final String? name;
  final JobStatus? status;
  final Function(WorkingStatus)? onWorkingOnTap;
  final Function(JobStatus)? onStatusOnTap;
  final bool? isEdit;
  const JobStatusWidget({super.key, this.workingStatus, this.onWorkingOnTap, this.isStatus, this.isEdit, this.status, this.onStatusOnTap, this.name});

  @override
  State<JobStatusWidget> createState() => _JobStatusWidgetState();
}

class _JobStatusWidgetState extends State<JobStatusWidget> {


  // WorkingStatus? workingStatus;

  JobStatus? jobStatus;

  @override
  void initState() {
    // TODO: implement initState

    // setState(() {
    //
    //
    //
    //
    //
    //
    //
    //   // workingStatus = widget.workingStatus;
    //
    //
    //
    // });

    super.initState();


    jobStatus = widget.status;
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
print("jobStatus is :::::::::::::::::::::::${jobStatus}");
    // final isPending = workingStatus == WorkingStatus.PENDING;
    final isPending = jobStatus == JobStatus.PENDING;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(widget.name ?? "Pooja Gajera",style: CustomTextStyle.semiBoldRegularFont24Style.copyWith(
                  color: kBlackColor
              ),),
            ),
            if(widget.isEdit == true)
            SizedBox(
                height: 22.sp,
                width: 22.sp,
                child: ImageUtil.iconImageClass.profileEditIcon)
          ],
        ),
        SizedBox(height: 15.sp),
        if(widget.isStatus == true)
        CustomTabBarView(
          tabList: OrderDummyListData.orderListValue,
          callBackFun: (p0) {

            setState(() {

              switch(p0){

                case 0 :
                  // workingStatus = WorkingStatus.PENDING;
                  // widget.onWorkingOnTap!(workingStatus!);

                  jobStatus = JobStatus.PENDING;
                  widget.onStatusOnTap!(jobStatus!);

                case 1 :
                  // workingStatus = WorkingStatus.COMPLETED;
                  // widget.onWorkingOnTap!(workingStatus!);

                  jobStatus = JobStatus.COMPLETED;
                  widget.onStatusOnTap!(jobStatus!);


              }


            });

          },
        ),
        SizedBox(height: 15.sp),
        Row(
          children: [
            Expanded(child: Text("Job Status",style: CustomTextStyle.mediumFont16Style)),
            Container(
                padding: EdgeInsets.symmetric(vertical: 8.sp,horizontal: 15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.sp),
                    color: kPrimaryColor
                ),
                child: Text(jobStatus?.jobTitle ?? "",style: CustomTextStyle.regularFont14Style.copyWith(
                    color: kWhiteColor
                )))
          ],
        ),
        SizedBox(height: 15.sp),
        Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: List.generate(2, (index) {


                if(isPending){
                  return Container(
                    width: (MediaQuery.of(context).size.width - 40.sp) / 2,
                    height: 3.sp,
                    /// pending Status
                    color: index == 1 ? const Color(0xffD9D9D9) :kPrimaryColor,

                    /// completed Status
                    //  color: kPrimaryColor,
                    /// not Started
                    //   color: Color(0xffD9D9D9),

                  );
                }

                if(!isPending){
                  return Container(
                    width: (MediaQuery.of(context).size.width - 40.sp) / 2,
                    height: 3.sp,
                    /// completed Status
                    color: kPrimaryColor,
                    /// not Started
                    //   color: Color(0xffD9D9D9),

                  );
                }


                return Container(
                  width: (MediaQuery.of(context).size.width - 40.sp) / 2,
                  height: 3.sp,
                  /// pending Status
                  // color: index == 1 ? const Color(0xffD9D9D9) :kPrimaryColor,
                  // color: isPending ? Color(0xffD9D9D9) :kPrimaryColor,
                  /// completed Status
                  color: kPrimaryColor,
                  /// not Started
                  //   color: Color(0xffD9D9D9),

                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(3, (index) {

                if(isPending){

                  return Container(
                    // padding: index != 2 ? EdgeInsets.all(3.sp) : EdgeInsets.zero,
                    padding: index != 2 ? EdgeInsets.all(3.sp) : EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(100),
                        /// not Started
                        //  border: !(index == 2 && index == 1) ? null: Border.all(color: kPrimaryColor)
                        /// completed
                        //    border: Border.all(color: kPrimaryColor)
                        /// pending
                        border: Border.all(color: !(index == 2) ? kPrimaryColor : Colors.transparent)

                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        /// pending Status
                        color: index == 2 ? Color(0xffD9D9D9) : kPrimaryColor,
                        // color: isPending ? Color(0xffD9D9D9) : kPrimaryColor,
                        /// completed Status
                        // color: kPrimaryColor,
                        /// not Started
                        // color: Color(0xffD9D9D9)

                      ),
                      width: 18.sp,
                      height: 18.sp,
                    ),
                  );

                }

                if(!isPending){

                  return Container(
                    padding: EdgeInsets.all(3.sp),
                    // padding: isPending ? EdgeInsets.all(3.sp) : EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(100),
                        /// not Started
                        //  border: !(index == 2 && index == 1) ? null: Border.all(color: kPrimaryColor)
                        /// completed
                        border: Border.all(color: kPrimaryColor)
                      /// pending
                      // border: Border.all(color: !(index == 2) ? kPrimaryColor : Colors.transparent)
                      // border: Border.all(color: isPending ? kPrimaryColor : Colors.transparent)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        /// pending Status
                        //   color: index == 2 ? Color(0xffD9D9D9) : kPrimaryColor,
                        // color: isPending ? Color(0xffD9D9D9) : kPrimaryColor,
                        /// completed Status
                        color: kPrimaryColor,
                        /// not Started
                        // color: Color(0xffD9D9D9)

                      ),
                      width: 18.sp,
                      height: 18.sp,
                    ),
                  );

                }

                return Container(
                  // padding: index != 2 ? EdgeInsets.all(3.sp) : EdgeInsets.zero,
                  padding: isPending ? EdgeInsets.all(3.sp) : EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(100),
                      /// not Started
                      //  border: !(index == 2 && index == 1) ? null: Border.all(color: kPrimaryColor)
                      /// completed
                      //    border: Border.all(color: kPrimaryColor)
                      /// pending
                      // border: Border.all(color: !(index == 2) ? kPrimaryColor : Colors.transparent)
                      border: Border.all(color: isPending ? kPrimaryColor : Colors.transparent)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      /// pending Status
                      //   color: index == 2 ? Color(0xffD9D9D9) : kPrimaryColor,
                      color: isPending ? Color(0xffD9D9D9) : kPrimaryColor,
                      /// completed Status
                      // color: kPrimaryColor,
                      /// not Started
                      // color: Color(0xffD9D9D9)

                    ),
                    width: 18.sp,
                    height: 18.sp,
                  ),
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}
