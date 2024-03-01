import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/job/route/job_route.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../notification/route/notification_route.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/auto_suggestion_textfield.dart';
import '../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_chipe_widget.dart';

import '../../../order/component/chip_textfield.dart';

class CreateJobOrderScreen extends StatefulWidget {
  const CreateJobOrderScreen({super.key});

  @override
  State<CreateJobOrderScreen> createState() => _CreateJobOrderScreenState();
}

class _CreateJobOrderScreenState extends State<CreateJobOrderScreen> {
  DateTime? startDate;
  DateTime? endDate;

  final FocusNode jobOrderNoFocus = FocusNode();
  final TextEditingController jobOrderNoController = TextEditingController();

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

  @override
  void initState() {

    super.initState();

    firstName = [
      'Gaurav',
      'Kishan',
      'Sagar',
      'Shree',
      'Parth',
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
        title: "Job Order",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
        child: Column(

          children: [
            CustomAutoSearchTextField(
              headerText: "Job Order No.",
              suggestions: [],
              // controller: ,
              focusNode: jobOrderNoFocus,
              hint: "Enter Your Name",
              // onSearchTextChanged: (query) {
              //   final filter = firstName
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
              headerText: "Boutique Name",
              suggestions: lastName.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
              // controller: ,
              hint: "Boutique Name",
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
              headerText: "Boutique Address",
              suggestions: [],
              // controller: ,
              hint: "Enter your number",
              maxLine: 2,
              focusNode: numberFocus,
              // onSearchTextChanged: (query) {
              //   final filter = number
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
              headerText: "Product Name",
              suggestions: [],
              // controller: ,
              hint: "Product Name",
              focusNode: emailFocus,
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
              // suffixIcon: Padding(
              //   padding:  EdgeInsets.only(right: 10.sp),
              //   child: Icon(Icons.arrow_drop_down),
              // ),
            ),

            SizedBox(height: 15.sp),

            CustomAutoSearchTextField(
              headerText: "Product Quantity",
              suggestions: [],
              // controller: ,
              hint: "Product Quantity",
              focusNode: addressFocus ,
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
              headerText: "Product Material",
            ),

          ],
        ),
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
                  JobRoute.goToSubJobOrderDetailPage(context);
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
