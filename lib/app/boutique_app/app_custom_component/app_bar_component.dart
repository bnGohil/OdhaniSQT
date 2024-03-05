import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
class AppBarComponent extends StatelessWidget {
  final Widget? action;
  final Widget? leading;
  final String? title;
  final GestureTapCallback? actionOnTap;
  final GestureTapCallback? leadingOnTap;
  const AppBarComponent({super.key, this.action, this.actionOnTap, this.leadingOnTap, this.leading, this.title});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [

        GestureDetector(
          onTap: leadingOnTap,
          child: Container(
            padding: EdgeInsets.all(14.sp),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBorderColor),
            ),
            child: SizedBox(
                height: 24.sp,
                width: 24.sp,
                child: leading ?? ImageUtil.iconImageClass.backArrowIcon),
          ),
        ),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.sp),
            child: Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: kLightWhiteColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: kBorderColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(title ?? "",style: CustomTextStyle.mediumFont18Style.copyWith(
                        color: kBlackColor
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
        if(action != null)
        GestureDetector(
          onTap: actionOnTap,
          child: Container(
            padding: EdgeInsets.all(14.sp),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: kBorderColor),
            ),
            child: SizedBox(
                height: 24.sp,
                width: 24.sp,
                child: action),
          ),
        )

      ],
    );
  }
}
