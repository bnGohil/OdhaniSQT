import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double? height;
  final Widget? leading;
  final Widget? action;
  final String? title;
  const CustomAppbar({super.key, this.height, this.leading, this.title, this.action});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
        child: Row(
          children: [
            if(leading != null)
              Container(
                padding: EdgeInsets.all(14.sp),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: kBorderColor),
                ),
                child: leading,
              ),
            if(title != null)
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
            Container(
              padding: EdgeInsets.all(14.sp),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: kBorderColor),
              ),
              child: action,
            ),

          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 0);
}