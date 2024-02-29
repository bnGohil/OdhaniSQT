import 'package:flutter/rendering.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

mixin CustomDecoration on Decoration{

  static Decoration get detailDecoration => BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
      image: const DecorationImage(image: AssetImage("assets/images/graphics/card_back_ground.png"),fit: BoxFit.fill)
  );

  static Decoration get detailsCornerDecoration => BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15.sp),
        bottomRight: Radius.circular(15.sp),
      ),
      color: Color(0xffF6DAE1),

  );

}