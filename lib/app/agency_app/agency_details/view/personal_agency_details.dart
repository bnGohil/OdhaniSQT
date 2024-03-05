import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/theme/custom_decocarion.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../../utils/utils.dart';
import '../../../boutique_app/personal/route/personal_route.dart';

class PersonalAgencyDetails extends StatefulWidget {
  const PersonalAgencyDetails({super.key});

  @override
  State<PersonalAgencyDetails> createState() => _PersonalAgencyDetailsState();
}

class _PersonalAgencyDetailsState extends State<PersonalAgencyDetails> {
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
        title: "Personal Detail",
        action: GestureDetector(
            onTap: () {

            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
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
                        child: Image.asset("assets/images/dummy_img/boutique_profile_image.png",fit: BoxFit.cover,)),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Abc Agency",style: CustomTextStyle.semiBoldRegularFont20Style,),
                      Text("Agency",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 14.sp),)
                    ],
                  )),
                  SizedBox(width: 10.sp,),
                  GestureDetector(
                      onTap: () {
                        PersonalRoute.goToEditPersonalDetailsPage(context);
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
                    Text("PAN No.",style: CustomTextStyle.regularFont16Style),
                    Text("DJPLJ0000A",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("GST No.",style: CustomTextStyle.regularFont16Style),
                    Text("24DHNKS0000A1ZB",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mobile No.",style: CustomTextStyle.regularFont16Style),
                    Text("+91 79521 20252",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product type",style: CustomTextStyle.regularFont16Style),
                    Text("Choli, kurti",style: CustomTextStyle.mediumFont18Style)
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Website URL",style: CustomTextStyle.regularFont16Style),
                    Text("odhani.com",style: CustomTextStyle.mediumFont18Style.copyWith(color: Color(0xff0050EC)))
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("WhatsApp No.",style: CustomTextStyle.regularFont16Style),
                    Text("+91 79* *** *52",style: CustomTextStyle.mediumFont18Style.copyWith(color: Color(0xff0050EC)))
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Facebook Profile",style: CustomTextStyle.regularFont16Style),
                    Text("msng.link/o?odhni_05=fb",style: CustomTextStyle.mediumFont18Style.copyWith(color: Color(0xff0050EC)))
                  ],
                ),
              ),
              SizedBox(height: 10.sp),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.sp),
                decoration: CustomDecoration.detailDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Instagram Profile",style: CustomTextStyle.regularFont16Style),
                    Text("msng.link/o?odhni24=ig",style: CustomTextStyle.mediumFont18Style.copyWith(color: Color(0xff0050EC)))
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}