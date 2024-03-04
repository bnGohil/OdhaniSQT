import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../../base/domin/asset/asset_model.dart';
import '../../../../../base/view/base_components/auto_suggestion_textfield.dart';
import '../../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import '../../../../../base/view/base_components/custom_button.dart';
import '../../../../../utils/common_utils/custom_app_bar.dart';
import '../../../notification/route/notification_route.dart';
import '../../route/order_route.dart';

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
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_outlined,size: 24.sp,color: kBlackColor)),
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
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 70.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                radius: 100.sp,
                btnText: "Next",
                onTap: () {
                  OrderRoute.goToCreateSubOrderDetails(context);
                  // ChatRoute.goToChatPage(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget searchChild(x) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
    child: Text(x, style: TextStyle(fontSize: 16, color: Colors.black)),
  );
}
