import 'package:intl/intl.dart';
import '../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import '../../../../base/view/base_components/multi_selection_photo.dart';
import '../../../../utils/utils.dart';
import 'chip_textfield.dart';
import 'form_to_datepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class OrderDetailsCustomView extends StatefulWidget {
  CustomOrderDetailsModel? customOrderDetailsData;
  final GestureTapCallback? onTap;
  OrderDetailsCustomView({Key? key,this.customOrderDetailsData, this.onTap}) : super(key: key);

  @override
  _OrderDetailsCustomViewState createState() {
    return _OrderDetailsCustomViewState();
  }
}

class _OrderDetailsCustomViewState extends State<OrderDetailsCustomView> {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Detail",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

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
                      SizedBox(height: 10.sp),

                      FromToDatePicker(
                        startDate: CustomDatePickerWidget(
                            initialDate: widget.customOrderDetailsData?.orderDate,
                            firstDate: DateTime(1800),
                            lastDate: DateTime.now(),
                            radius: 8,
                            onSelectedDateTime: (p0) async{
                              setState((){
                                widget.customOrderDetailsData?.orderDate = p0;
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

                            name: widget.customOrderDetailsData?.orderDate != null
                                ? DateFormat("dd/MM/yyyy").format(widget.customOrderDetailsData?.orderDate ?? DateTime.now())
                                : "Start Date"),


                        lastDate: CustomDatePickerWidget(
                            initialDate: widget.customOrderDetailsData?.deliveryDate,
                            firstDate: widget.customOrderDetailsData?.orderDate,
                            lastDate: DateTime.now(),
                            radius: 8,
                            onSelectedDateTime: (p0) async{
                              setState((){
                                widget.customOrderDetailsData?.deliveryDate = p0;
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
                            name:  widget.customOrderDetailsData?.deliveryDate != null
                                ? DateFormat("dd/MM/yyyy").format( widget.customOrderDetailsData?.deliveryDate ?? DateTime.now())
                                : "End Date"),
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Product Name",
                        suggestions: [],
                        // controller: ,
                        hint: "Product Name",
                        focusNode: widget.customOrderDetailsData?.productFN ,
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
                        headerText: "Product Quantity",
                        suggestions: [],
                        // controller: ,
                        hint: "Product Quantity",
                        focusNode: widget.customOrderDetailsData?.productQuantityFN,
                      ),

                      SizedBox(height: 10.sp),

                      ChipTextField(selectedList: [],apiList: materialList,),

                      SizedBox(height: 10.sp),

                      Text("Attributes",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

                      SizedBox(height: 10.sp),

                      GridView.builder(
                        itemCount: 4 ?? 0,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 5.sp,
                          childAspectRatio: 2.3,
                          crossAxisSpacing: 10.sp,
                        ),
                        itemBuilder: (context, index) {
                          final itemFN = widget.customOrderDetailsData?.attributesList?[index].attributeFN;
                          final itemController = widget.customOrderDetailsData?.attributesList?[index].attributeController;

                          return  CustomAutoSearchTextField(
                            headerText: "Attribute$index",
                            suggestions: [],
                            hint: "Attribute$index",
                            focusNode: itemFN ,
                            controller: itemController,
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
                          );
                        },
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Price",
                        suggestions: [],
                        controller: widget.customOrderDetailsData?.priceController,
                        hint: "Price",
                        focusNode: widget.customOrderDetailsData?.priceFN ,
                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Advance Payment",
                        suggestions: [],
                        hint: "Advance Payment",
                        focusNode: widget.customOrderDetailsData?.advicePayFN ,
                        controller: widget.customOrderDetailsData?.advicePayController,

                      ),

                      SizedBox(height: 10.sp),

                      CustomAutoSearchTextField(
                        headerText: "Description",
                        suggestions: [],
                        controller:widget.customOrderDetailsData?.descriptionController  ,
                        hint: "Description",
                        maxLine: 4,
                        focusNode: widget.customOrderDetailsData?.descriptionFN ,
                      ),

                      SizedBox(height: 10.sp),

                      MultiSelectionImage(
                        apiImgList: widget.customOrderDetailsData?.imageList,
                        imageFileList: widget.customOrderDetailsData?.imageFileList,
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



