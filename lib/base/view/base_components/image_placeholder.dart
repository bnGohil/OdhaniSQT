import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class ImagePlaceHolder extends StatelessWidget {
  final Widget? child;
  final bool? isLoading;
  const ImagePlaceHolder({super.key,this.child, this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

       Positioned(bottom: 0,left: 0,right: 0,top: 0,child: Container(
         height: 184.sp,
         decoration: BoxDecoration(
            color: kTextFiledFillColor,
             borderRadius: BorderRadius.circular(100),
         ),
         padding: EdgeInsets.all(2.sp),
         child: child ??
             Container(
               height: 182.sp,
           padding: EdgeInsets.all(25.sp),
           decoration: BoxDecoration(
             border: Border.all(color: kLightGrayColor.withOpacity(0.2)),
               borderRadius: BorderRadius.circular(100)
           ),
           child: ClipRRect(
               borderRadius: BorderRadius.circular(100),
               child: ImageUtil.iconImageClass.sProfileIcon
           ),
         ),
       )),

        if(isLoading == true)
          const Positioned(bottom: 0,left: 0,right: 0,top: 0,child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),

          )),

        Positioned(
          bottom: 5.sp,right: 5.sp,
          child: Container(
            height: 32.sp,
            width: 32.sp,
            decoration: BoxDecoration(
              border: Border.all(color: kWhiteColor,width: 2),
              color: kBlackColor,
              shape: BoxShape.circle
            ),
              padding: EdgeInsets.all(3.sp),
              child:CustomSvgPictures.asset("$iconPath/add.svg", fit: BoxFit.cover,color: Colors.white,)
          ),)
      ],
    );
  }
}
