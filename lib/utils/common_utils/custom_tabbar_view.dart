import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
class CustomTabBarView extends StatefulWidget {
  final List<String>? tabList;
  final Function(int)? callBackFun;
  const CustomTabBarView({super.key, this.tabList, this.callBackFun});

  @override
  State<CustomTabBarView> createState() => _CustomTabBarViewState();
}

class _CustomTabBarViewState extends State<CustomTabBarView> {

 int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          padding: EdgeInsets.all(5.sp),
          width: MediaQuery.of(context).size.width - 40.sp,
          decoration: const BoxDecoration(
            color: Color(0xffF4F4F4),
            borderRadius: BorderRadius.all(Radius.circular(100))
          ),
          child: Row(
            children: List.generate(widget.tabList?.length ?? 0, (index) {
              final selectedValue = selectedIndex == index;
              return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.callBackFun!(index);
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 11.sp),
                    alignment: Alignment.center,
                    decoration: selectedValue ?  BoxDecoration(
                      borderRadius: BorderRadius.circular(100.sp),
                      color: kPrimaryColor
                    ) : null,
                    child: Text(widget.tabList?[index] ?? "",style: CustomTextStyle.semiBoldRegularFont16Style.copyWith(
                      color: selectedValue ? kWhiteColor : kBlackColor,
                      fontWeight: selectedValue ? FontWeight.w600 : FontWeight.w400
                    ),)),
              ),
            );
            }),
          ),
        ),
      ),
    );
  }
}