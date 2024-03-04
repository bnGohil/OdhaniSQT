import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../../base/view/base_components/multi_selection_photo.dart';
import '../../../../utils/utils.dart';
import '../../order/component/chip_textfield.dart';
import '../../order/component/form_to_datepicker.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_auto_suggestion_textfield.dart';

class JobDetailCustomView extends StatefulWidget {
  CustomJobDetailsModel? customJobDetailsData;
  final GestureTapCallback? onTap;
   JobDetailCustomView({super.key,this.customJobDetailsData, this.onTap});

  @override
  State<JobDetailCustomView> createState() => _JobDetailCustomViewState();
}

class _JobDetailCustomViewState extends State<JobDetailCustomView> {
  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Agency",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

        Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 10.sp),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15.sp),
                  decoration: BoxDecoration(
                      color: Color(0xffF4F4F4),
                      borderRadius: BorderRadius.circular(10.sp)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      FromToDatePicker(
                        startDate: CustomDatePickerWidget(
                            initialDate: widget.customJobDetailsData?.jobOrderDate,
                            firstDate: DateTime(1800),
                            lastDate: DateTime.now(),
                            radius: 8,
                            onSelectedDateTime: (p0) async{
                              setState((){
                                widget.customJobDetailsData?.jobOrderDate = p0;
                              });
                              // try{
                              //   final reportProvider = context.read<ReportProvider>();
                              //
                              //   await reportProvider.weeklyList(reportReqModel: ReportReqModel(
                              //     startDate: startDate,
                              //     endDate: endDate ?? DateTime.now(),
                              //   ));
                              //
                              // }catch(e){
                              //   Toaster.showMessage(context, msg: e.toString());
                              // }
                            },

                            shoDatePicker: false,

                            name: widget.customJobDetailsData?.jobOrderDate != null
                                ? DateFormat("dd/MM/yyyy").format(widget.customJobDetailsData?.jobOrderDate ?? DateTime.now())
                                : "Order Date"),


                        lastDate: CustomDatePickerWidget(
                            initialDate: widget.customJobDetailsData?.jobDeliveryDate,
                            firstDate: widget.customJobDetailsData?.jobOrderDate,
                            lastDate: DateTime.now(),
                            radius: 8,
                            onSelectedDateTime: (p0) async{
                              setState((){
                                widget.customJobDetailsData?.jobDeliveryDate = p0;
                              });

                              // try{
                              //   final reportProvider = context.read<ReportProvider>();
                              //
                              //   await reportProvider.weeklyList(reportReqModel: ReportReqModel(
                              //     startDate: startDate ?? DateTime.now(),
                              //     endDate: endDate ?? DateTime.now(),
                              //   ));
                              // }catch(e){
                              //   Toaster.showMessage(context, msg: e.toString());
                              // }
                            },
                            shoDatePicker: false,
                            name:  widget.customJobDetailsData?.jobDeliveryDate != null
                                ? DateFormat("dd/MM/yyyy").format( widget.customJobDetailsData?.jobDeliveryDate ?? DateTime.now())
                                : "Delivery Date"),
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Agency Name",
                        suggestions: [],
                        // controller: ,
                        hint: "Agency Name",
                        focusNode: widget.customJobDetailsData?.agencyNameFN,
                        controller: widget.customJobDetailsData?.agencyNameController,
                        // onSearchTextChanged: (query) {
                        //   final filter = empty
                        //       .where((element) =>
                        //       element.toLowerCase().contains(query.toLowerCase()))
                        //       .toList();
                        //   return filter
                        //       .map((e) =>
                        //       SearchFieldListItem<String>(e, child: searchChild(e)))
                        //       .toList();
                        // },
                      ),

                      SizedBox(height: 10.sp),

                      ChipTextField(
                        selectedList: [],
                        apiList: materialList,
                        headerText: "Select Services"
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Price",
                        suggestions: [],
                        // controller: ,
                        hint: "Price",
                        focusNode: widget.customJobDetailsData?.priceFN,
                        // onSearchTextChanged: (query) {
                        //   final filter = empty
                        //       .where((element) =>
                        //       element.toLowerCase().contains(query.toLowerCase()))
                        //       .toList();
                        //   return filter
                        //       .map((e) =>
                        //       SearchFieldListItem<String>(e, child: searchChild(e)))
                        //       .toList();
                        // },
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Description",
                        suggestions: [],
                        controller:widget.customJobDetailsData?.descriptionController  ,
                        hint: "Description",
                        maxLine: 4,
                        focusNode: widget.customJobDetailsData?.descriptionFN ,
                      ),

                      SizedBox(height: 10.sp),

                      MultiSelectionImage(
                        apiImgList: widget.customJobDetailsData?.imageList,
                        imageFileList: widget.customJobDetailsData?.imageFileList,
                        imageFileDataTap: (val){
                          setState(() {});
                        },
                        deleteImageOnTap: (val)async{
                          // final restProvider = context.read<RestaurantsProvider>();
                          //
                          // print("${val} == check this id");
                          //
                          // await restProvider.deleteRestaurantImage(assetId: val.toString());
                          //
                          // setState(() {
                          //   imageList?.removeWhere((element) => element.assetId == val);
                          // });
                        },
                        headerText: "Upload Photos",
                      ),


                    ],
                  ),
                ),

              ],
            ),

            Positioned(
              right: 0,
              child: InkWell(
                onTap: widget.onTap,
                child: Container(
                  height: 24.sp,
                  width: 24.sp,
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: ImageUtil.iconImageClass.circleCancelIcon,

                ),
              ),
            ),
          ],
        ),

      ],
    );
  }
}
