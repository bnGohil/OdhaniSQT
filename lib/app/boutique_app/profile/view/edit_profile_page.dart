import 'dart:io';
import '../route/profile_route.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/base/base.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../base/view/base_components/image_placeholder.dart';
import '../../../../base/view/base_components/custom_image_picker.dart';
import '../../../../base/view/base_components/auto_suggestion_textfield.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {


  CustomImagePicker customImagePicker = CustomImagePicker();



  List<String> suggestions = ["Female","Male"];

  final FocusNode nameFocus = FocusNode();
  final FocusNode userTypeFocus = FocusNode();
  final FocusNode bodFocus = FocusNode();
  final FocusNode genderFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();



  File? file;
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

  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          height: 80.sp,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  radius: 100,
                  onTap: () {
                    ProfileRoute.goToProfilePage(context);
                  },
                  btnColor: kPrimaryColor,
                  btnText: "Update",
                ),
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

                  name: dateTime != null ? dateTime?.formatCommonDate() : "DOB"
              ),
              SizedBox(height: 15.sp,),
              CustomAutoSearchTextField(
                headerText: "Gender",
                focusNode: genderFocus,
                maxLine: 1,
                suggestions: suggestions.map((e) => SearchFieldListItem<String>(e, child: searchChild(e))).toList(),
                // controller: ,
                hint: "Gender",
                textInputAction: TextInputAction.next,
                onSearchTextChanged: (p0) {
                  final filter = suggestions
                      .where((element) =>
                      element.toLowerCase().contains(p0.toLowerCase()))
                      .toList();
                  return filter
                      .map((e) =>
                      SearchFieldListItem<String>(e, child: searchChild(e)))
                      .toList();
                },
                // focusNode: areaFocus,
                suffixIcon: Padding(
                  padding:  EdgeInsets.only(right: 10.sp),
                  child: Icon(Icons.arrow_drop_down),
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
