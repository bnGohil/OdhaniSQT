import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_app_bar.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../notification/route/notification_route.dart';
import '../domian/chat_model.dart';
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {

    final isKeyBoardOpen = MediaQuery.of(context).viewInsets.bottom != 0;

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
        title: "Fashion Boutique",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      backgroundColor: kBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              padding: EdgeInsets.only(bottom: 50.sp,left: 20.sp,right: 20.sp),
              itemCount: DummyMessageModel.dummyMsgList.length,
              itemBuilder: (context, index) {
                final dummyMsgData = DummyMessageModel.dummyMsgList[index];
                final logUser = dummyMsgData.id != 1;
                return Align(
                    alignment: logUser ? Alignment.centerLeft : Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: logUser ? CrossAxisAlignment.start :   CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: logUser ? 125.sp : 0,left: logUser ? 0 : 125.sp),
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                color: logUser ? kLightGrayColor.withOpacity(0.16) : kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.sp),
                                    topRight: Radius.circular(10.sp),
                                    bottomLeft: !logUser ? Radius.circular(10.sp) : Radius.zero,
                                    bottomRight: logUser ? Radius.circular(10.sp) : Radius.zero

                                )
                            ),
                            child: Text(dummyMsgData.msg ?? "",style: CustomTextStyle.lightFont16Style.copyWith(
                                color: !logUser ? kWhiteColor : kBlackColor,fontWeight: FontWeight.w400
                            ),)),
                        SizedBox(height: 10.sp),
                        Text(dummyMsgData.day ?? "",style: CustomTextStyle.regularFont16Style.copyWith(fontSize: 12.sp,color: Color(0xffCCCCCC)),)
                      ],
                    ));
              },)),
            Padding(
              padding: EdgeInsets.only(bottom: !isKeyBoardOpen ? 30.sp : 0,right: 20.sp,left: 20.sp),
              child: TextFormField(
                // style: CustomTextStyle.primaryTextColorFont16W400,
                minLines: 1,
                maxLines: 3,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.sp,top: 10.sp,bottom: 10.sp),
                  hintText: "Type a message...",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(120.sp),
                      ),
                      child: Icon(Icons.send,color: kWhiteColor,size: 24.sp),
                    ),
                  ),
                  // hintStyle: CustomTextStyle.primaryTextColorFont16W400,
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(120.sp)),
                      borderSide: BorderSide(
                        width: 1,
                        color: kBorderColor,
                      )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(120.sp)),
                      borderSide: BorderSide(
                        width: 1,
                        color: kBorderColor,
                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(120.sp)),
                      borderSide: BorderSide(
                        width: 1,
                        color: kPrimaryColor.withOpacity(0.50),
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
