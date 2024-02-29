import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/app/profile/route/profile_route.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../utils/common_utils/custom_app_bar.dart';
import '../../notification/route/notification_route.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
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
        title: "Profile",
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
            children: [
              SizedBox(height: 20.sp),
              Row(
                children: [
                  SizedBox(
                    height: 80.sp,
                    width: 80.sp,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/images/dummy_img/image_1.png",fit: BoxFit.cover,)),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Kajal Patel",style: CustomTextStyle.semiBoldRegularFont20Style,),
                      Text("Boutique",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),)
                    ],
                  )),
                  SizedBox(width: 10.sp,),
                  GestureDetector(
                      onTap: () {
                        ProfileRoute.goToEditProfile(context);
                      },
                      child: SizedBox(width: 22.sp,height: 22.sp,child: ImageUtil.iconImageClass.profileEditIcon,))
                ],
              ),
              SizedBox(height: 20.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",style: CustomTextStyle.regularFont16Style),
                    Text("kajal@gmail.com",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("DOB",style: CustomTextStyle.regularFont16Style),
                          Text(DateTime.now().formatCommonDate(),style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16.sp,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.sp),
                      decoration: CustomDecoration.detailDecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Gender",style: CustomTextStyle.regularFont16Style),
                          Text("Female",style: CustomTextStyle.mediumFont18Style)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address",style: CustomTextStyle.regularFont16Style),
                    Text("34, shyam Enclave, Opp madhav Farm Ahmedabad Gujrat 382330",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
            ],
          ),
        ),
      ),
    );
  }
}
