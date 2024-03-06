import 'dart:io';

import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/agency_app/agency_profile/route/agency_profile_route.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../base/base.dart';
import '../../../../base/view/base_components/auto_suggestion_textfield.dart';
import '../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/custom_image_picker.dart';
import '../../../../base/view/base_components/image_placeholder.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../boutique_app/profile/route/profile_route.dart';

class AgencyEditProfileScreen extends StatefulWidget {
  const AgencyEditProfileScreen({super.key});

  @override
  State<AgencyEditProfileScreen> createState() => _AgencyEditProfileScreenState();
}

class _AgencyEditProfileScreenState extends State<AgencyEditProfileScreen> {

  CustomImagePicker customImagePicker = CustomImagePicker();



  List<String> suggestions = ["Female","Male"];

  final FocusNode nameFocus = FocusNode();
  final FocusNode userTypeFocus = FocusNode();
  final FocusNode bodFocus = FocusNode();
  final FocusNode genderFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();

  String? _selectedItem;

  File? file;

  DateTime? dateTime;
  @override
  void initState() {
    super.initState();

    customImagePicker.onFile = (value){
      setState(() {
        file = File(value[0]);
      });
    };
    customImagePicker.onLoading = (value){
      setState(() {});
    };

    customImagePicker.onError = (error){
      setState(() {

        Toaster.showMessage(context, msg: error);

      });
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: CustomAppbar(
        height: 100.sp,
        title: "Edit Profile",
        action: GestureDetector(
            onTap: () {

            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 70.sp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  radius: 100,
                  onTap: () {
                    ProfileAgencyRoute.goToProfilePage(context);
                  },
                  btnColor: kPrimaryColor,
                  btnText: "Update",
                ),
                SizedBox(height: 10.sp,),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: 30.sp),
                  child: GestureDetector(
                    onTap: () {
                      customImagePicker.bottom(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(120.sp/2),
                      ),
                      width: 108.sp,
                      height: 108.sp,
                      child: ImagePlaceHolder(
                        isLoading: customImagePicker.isLoading,
                        child: file != null ?
                        ClipRRect(
                            borderRadius: BorderRadius.circular(100.sp),
                            child: Image.file(file!,fit: BoxFit.cover,)
                        ) : null,
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.sp,),
              CustomAutoSearchTextField(
                headerText: "Name",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Name",
                focusNode: nameFocus,
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 15.sp,),
              CustomAutoSearchTextField(
                headerText: "User Type",
                maxLine: 1,
                suggestions: [],
                textInputAction: TextInputAction.next,
                // controller: ,
                hint: "User Type",
                focusNode: userTypeFocus,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 15.sp,),
              Text("DOB",style: CustomTextStyle.semiBoldFont18Style,),
              SizedBox(height: 6.sp,),
              CustomDatePickerWidget(
                  firstDate: DateTime(1800),
                  lastDate: DateTime.now(),
                  radius: 8,
                  onSelectedDateTime: (p0) async{
                    setState((){
                      dateTime = p0;
                    });

                  },

                  shoDatePicker: false,

                  name: dateTime?.formatCommonDate()
              ),
              SizedBox(height: 15.sp,),
              Text("Gender",style: CustomTextStyle.semiBoldFont18Style,),
              SizedBox(height: 5.sp,),
              Container(
                height: 45.sp,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all(width: 1,color: borderColor,
                      style: BorderStyle.solid,)
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: ImageUtil.iconImageClass.dropDownIcon,
                    padding: EdgeInsets.zero,
                    hint: Text("Gender",style: CustomTextStyle.semiBoldFont14Style.copyWith(color: Colors.grey),),
                    value: _selectedItem,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value ?? "";
                      });
                    },
                    items: suggestions.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item,style: CustomTextStyle.semiBoldFont14Style),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 15.sp,),
              CustomAutoSearchTextField(
                focusNode: addressFocus,
                textInputAction: TextInputAction.done,
                headerText: "Address",
                maxLine: 4,
                suggestions: [],
                // controller: ,
                hint: "Address",
                // focusNode: areaFocus,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 15.sp,),
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
