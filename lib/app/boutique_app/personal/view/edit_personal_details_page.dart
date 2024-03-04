import 'dart:io';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../base/base.dart';
import '../../../../base/view/base_components/custom_auto_suggestion_textfield.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../base/view/base_components/custom_image_picker.dart';
import '../../../../base/view/base_components/image_placeholder.dart';
import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/common_utils/custom_chipe_widget.dart';
import '../../notification/route/notification_route.dart';
import '../domian/personal_user_chip_model.dart';

class EditPersonalDetailsPage extends StatefulWidget {
  const EditPersonalDetailsPage({super.key});

  @override
  State<EditPersonalDetailsPage> createState() => _EditPersonalDetailsPageState();
}

class _EditPersonalDetailsPageState extends State<EditPersonalDetailsPage> {

  CustomImagePicker customImagePicker = CustomImagePicker();



  List<PersonalChipData> updateTimeList = [

    // PersonalChipData(text: "Choli"),

  ];

  List<PersonalChipData> apiList = [
    PersonalChipData(text: "Choli"),
    PersonalChipData(text: "Kurti"),
  ];


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 70.sp,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: "Personal Detail",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: SingleChildScrollView(
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
              SizedBox(height: 10.sp,),
              Text("Upload Company Logo",style: CustomTextStyle.semiBoldFont14Style,),
              SizedBox(height: 30.sp,),
              CustomAutoSearchTextField(
                headerText: "Company Name",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Company Name",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "Registration No.",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Registration No.",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "PAN No.",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "PAN No.",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "GST No.",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "GST No.",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "Mobile No.",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Mobile No.",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              Text("Product Type",style: CustomTextStyle.mediumFont18Style,),
              SizedBox(height: 5.sp,),
              CustomChipeWidget(
                list: updateTimeList,
                apiList: apiList,
                hintText: "Product Type",
              ),
              SizedBox(height: 10.sp),
              CustomAutoSearchTextField(
                headerText: "Website URL",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Website URL",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "Whatsapp No.",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Whatsapp No.",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "Facebook Profile",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Facebook Profile",
                textInputAction: TextInputAction.next,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),
              CustomAutoSearchTextField(
                headerText: "Instagram Profile",
                maxLine: 1,
                suggestions: [],
                // controller: ,
                hint: "Instagram Profile",
                textInputAction: TextInputAction.done,
                // suffixIcon: Padding(
                //   padding:  EdgeInsets.only(right: 10.sp),
                //   child: Icon(Icons.arrow_drop_down),
                // ),
              ),
              SizedBox(height: 10.sp,),

            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 100.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      btnColor: kLightWhiteColor,
                      radius: 100.sp,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      textStyle: CustomTextStyle.mediumFont18Style,
                      btnText: "Cancel",
                      isBoxShadow: false,
                    ),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(
                    child: CustomButton(
                      radius: 100.sp,
                      btnText: "Save",
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
