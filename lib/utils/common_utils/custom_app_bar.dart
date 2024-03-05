import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double? height;
  final Widget? leading;
  final Widget? action;
  final GestureTapCallback? onTap;
  final Widget? actionWidget;
  final String? title;
  const CustomAppbar({super.key, this.height, this.leading, this.title, this.action, this.actionWidget, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
        child: Row(
          children: [
            GestureDetector(
              onTap:() {
                if(leading != null){

                  onTap?.call();

                }else{

                  Navigator.pop(context);

                }
              },
              child: Container(
                  padding: EdgeInsets.all(12.sp),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kBorderColor),
                  ),
                  child: SizedBox(
                      width: 24.sp,
                      height: 24.sp,
                      child: leading ?? ImageUtil.iconImageClass.backArrowIcon),
                ),
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
            // if(action != null)
            actionWidget != null
                ? Container(
              child: actionWidget,
            )
                : SizedBox(),
            if(action != null)
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(14.sp),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kBorderColor),
                  ),
                  child: action,
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.only(right: 8.sp,top: 2.sp),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor
                      ),
                      height: 7.sp,
                      width: 7.sp,
                    ),
                  ),
                )

              ],
            )

          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height ?? 0);
}
