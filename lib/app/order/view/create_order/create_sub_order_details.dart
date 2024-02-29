import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../../../notification/route/notification_route.dart';

class CreateSubOrderDetails extends StatefulWidget {
  const CreateSubOrderDetails({super.key});

  @override
  State<CreateSubOrderDetails> createState() => _CreateSubOrderDetailsState();
}

class _CreateSubOrderDetailsState extends State<CreateSubOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: "Sub Order Details",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 15.sp),
              margin: EdgeInsets.symmetric(horizontal: 20.sp),

              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.sp)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height:50.sp,
                    width: 50.sp,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(8.sp)
                    ),
                    child: const CustomSvgPictures.asset("${iconPath}/add.svg",color: Colors.white,),
                  ),
              
                  SizedBox(width: 8.sp),
              
                  Text("Add Details",style: CustomTextStyle.mainColorMediumFont16Style,),
                ],
              ),
            ),
            
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Container();
              },),
            )
          ],
        ),
      ),
    );
  }
}
