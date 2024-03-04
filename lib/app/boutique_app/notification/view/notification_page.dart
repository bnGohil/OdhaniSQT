import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';
import '../domian/dummy/notification_data.dart';
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
        title: "Notification",
        action: ImageUtil.iconImageClass.notificationIcon,
      ),
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          itemBuilder: (context, index) {
        final notificationData = NotificationData.notificationData[index];
        return Padding(
          padding: EdgeInsets.all(5.sp),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
               width: 35.sp,
               height: 35.sp,
               child: Image.asset(notificationData.profilePic ?? ""),
             ),
            SizedBox(width: 5.sp,),
            Expanded(child: Text.rich(TextSpan(
              children: [
                TextSpan(text: notificationData.agency,style: CustomTextStyle.mediumFont18Style,children: [
                  TextSpan(text: notificationData.agencyDescription,style: CustomTextStyle.regularFont18Style.copyWith(color: kTextSecondaryColor))
                ]),
              ]
            )))
          ],
                ),
        );
      },
          separatorBuilder: (context, index) => Divider(),
          itemCount: NotificationData.notificationData.length),
    );
  }
}
