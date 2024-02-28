import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../../base/domin/asset/asset_model.dart';
import '../../../base/view/base_components/auto_suggestion_textfield.dart';
import '../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import '../../../base/view/base_components/multi_selection_photo.dart';
import '../../../utils/common_utils/custom_app_bar.dart';
import '../../notification/route/notification_route.dart';
import '../component/form_to_datepicker.dart';
import 'demo_screen.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {

  DateTime? startDate;
  DateTime? endDate;

  final FocusNode firstNameFocus = FocusNode();
  final TextEditingController firstNameController = TextEditingController();

  final FocusNode lastNameFocus = FocusNode();
  final TextEditingController lastNameController = TextEditingController();

  final FocusNode numberFocus = FocusNode();
  final TextEditingController numberController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final TextEditingController emailController = TextEditingController();

  final FocusNode countryFocus = FocusNode();
  final TextEditingController countryController = TextEditingController();

  final FocusNode addressFocus = FocusNode();
  final TextEditingController addressController = TextEditingController();

  final FocusNode areaFocus = FocusNode();
  final TextEditingController areaController = TextEditingController();

  final FocusNode pinCodeFocus = FocusNode();
  final TextEditingController pinCodeController = TextEditingController();

  final FocusNode cityFocus = FocusNode();
  final TextEditingController cityController = TextEditingController();

  final FocusNode stateFocus = FocusNode();
  final TextEditingController stateController = TextEditingController();


  var suggestions = <String>[];
  var firstName = <String>[];
  var lastName = <String>[];
  var number = <String>[];
  var empty = <String>[];

  List<File>? imageFileList = [];
  List<AssetModel>? imageList;

  @override
  void initState() {
    super.initState();

    suggestions = [
      'United States',
      'Germany',
      'Washington',
      'Paris',
      'Jakarta',
      'Australia',
      'India',
      'Czech Republic',
      'Lorem Ipsum',
    ];

    firstName = [
      'Gaurav',
      'Kishan',
      'Sagar',
      'Shree',
      'Parth',
    ];

    lastName = [
      'Patel',
      'Parmar',
      'Rathod',
      'Vala',
      'Tank',
    ];

    number = [
      '1234567891',
      '1234567896',
      '1234567444',
      '1234541414',
      '1234512345',
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: SizedBox(
          height: 24.sp,
          width: 24.sp,
          child: ImageUtil.iconImageClass.searchIcon,
        ),
        title: "Create Order",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
        children: [
          CustomAutoSearchTextField(
            headerText: "First Name",
            suggestions: firstName.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
            // controller: ,
            focusNode: firstNameFocus,
            hint: "Enter Your Name",
            onSearchTextChanged: (query) {
                final filter = firstName
                    .where((element) =>
                    element.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                return filter
                    .map((e) =>
                    SearchFieldListItem<String>(e, child: searchChild(e)))
                    .toList();
              },
            suffixIcon: Padding(
              padding:  EdgeInsets.only(right: 10.sp),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),

          SizedBox(height: 10.sp),

          CustomAutoSearchTextField(
            headerText: "Last Name",
            suggestions: lastName.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
            // controller: ,
            hint: "Enter your Last Name",
            focusNode: lastNameFocus,
            onSearchTextChanged: (query) {
                final filter = lastName
                    .where((element) =>
                    element.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                return filter
                    .map((e) =>
                    SearchFieldListItem<String>(e, child: searchChild(e)))
                    .toList();
              },
            suffixIcon: Padding(
              padding:  EdgeInsets.only(right: 10.sp),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),

          SizedBox(height: 10.sp),

          CustomAutoSearchTextField(
            headerText: "Contact No.",
            suggestions: number.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
            // controller: ,
            hint: "Enter your number",
            focusNode: numberFocus,
            onSearchTextChanged: (query) {
                final filter = number
                    .where((element) =>
                    element.toLowerCase().contains(query.toLowerCase()))
                    .toList();
                return filter
                    .map((e) =>
                    SearchFieldListItem<String>(e, child: searchChild(e)))
                    .toList();
              },
            suffixIcon: Padding(
              padding:  EdgeInsets.only(right: 10.sp),
              child: Icon(Icons.arrow_drop_down),
            ),
          ),

          SizedBox(height: 10.sp),

          CustomAutoSearchTextField(
            headerText: "Email",
            suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
            // controller: ,
            hint: "Enter your Email Address",
            focusNode: emailFocus,
            onSearchTextChanged: (query) {
              final filter = empty
                  .where((element) =>
                  element.toLowerCase().contains(query.toLowerCase()))
                  .toList();
              return filter
                  .map((e) =>
                  SearchFieldListItem<String>(e, child: searchChild(e)))
                  .toList();
            },
            // suffixIcon: Padding(
            //   padding:  EdgeInsets.only(right: 10.sp),
            //   child: Icon(Icons.arrow_drop_down),
            // ),
          ),


          SizedBox(height: 15.sp),

          Text("Address"?? "",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

          SizedBox(height: 10.sp),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15.sp),
            decoration: BoxDecoration(
            color: Color(0xffF4F4F4),
              borderRadius: BorderRadius.circular(10.sp)
            ),
            child: Column(
              children: [
                CustomAutoSearchTextField(
                  headerText: "House No./Building Name",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Enter your Address",
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Area",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Enter your Area",
                  focusNode: areaFocus,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                Row(
                  children: [
                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Pincode",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Pincode",
                        focusNode: pinCodeFocus,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                    SizedBox(width: 15.sp),

                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "City",
                        suggestions: suggestions.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "City",
                        focusNode: cityFocus,
                        onSearchTextChanged: (query) {
                          final filter = suggestions
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        suffixIcon: Padding(
                          padding:  EdgeInsets.only(right: 10.sp),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.sp),

                Row(
                  children: [
                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "State",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "State",
                        focusNode: stateFocus,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                    SizedBox(width: 15.sp),

                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Country",
                        suggestions: suggestions.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Country",
                        focusNode: countryFocus,
                        onSearchTextChanged: (query) {
                          final filter = suggestions
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        suffixIcon: Padding(
                          padding:  EdgeInsets.only(right: 10.sp),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 15.sp),

          Text("Order Detail",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

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
                      name: endDate != null
                          ? DateFormat("dd/MM/yyyy").format(endDate ?? DateTime.now())
                          : "End Date"),
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Product Name",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Product Name",
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Product Quantity",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Product Name",
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                Text("Attributes",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 20.sp),),

                SizedBox(height: 10.sp),

                Row(
                  children: [
                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Kurti Height",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Kurti Height",
                        focusNode: addressFocus ,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                    SizedBox(width: 15.sp),

                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Kurti Weight",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Kurti Weight",
                        focusNode: addressFocus ,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10.sp),

                Row(
                  children: [
                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Sleeve Height",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Sleeve Height",
                        focusNode: addressFocus ,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                    SizedBox(width: 15.sp),

                    Expanded(
                      child: CustomAutoSearchTextField(
                        headerText: "Sleeve Width",
                        suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                        // controller: ,
                        hint: "Product Name",
                        focusNode: addressFocus ,
                        onSearchTextChanged: (query) {
                          final filter = empty
                              .where((element) =>
                              element.toLowerCase().contains(query.toLowerCase()))
                              .toList();
                          return filter
                              .map((e) =>
                              SearchFieldListItem<String>(e, child: searchChild(e)))
                              .toList();
                        },
                        // suffixIcon: Padding(
                        //   padding:  EdgeInsets.only(right: 10.sp),
                        //   child: Icon(Icons.arrow_drop_down),
                        // ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Price",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Price",
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Advance Payment",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Advance Payment",
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                CustomAutoSearchTextField(
                  headerText: "Description",
                  suggestions: empty.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                  // controller: ,
                  hint: "Description",
                  maxLine: 4,
                  focusNode: addressFocus ,
                  onSearchTextChanged: (query) {
                    final filter = empty
                        .where((element) =>
                        element.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) =>
                        SearchFieldListItem<String>(e, child: searchChild(e)))
                        .toList();
                  },
                  // suffixIcon: Padding(
                  //   padding:  EdgeInsets.only(right: 10.sp),
                  //   child: Icon(Icons.arrow_drop_down),
                  // ),
                ),

                SizedBox(height: 10.sp),

                MultiSelectionImage(
                  apiImgList: imageList,
                  imageFileList: imageFileList,
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
    );
  }


  Widget searchChild(x) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
    child: Text(x, style: TextStyle(fontSize: 16, color: Colors.black)),
  );
}
