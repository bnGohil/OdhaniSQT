import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/common_utils/multiple_selected_chip_widget.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../app/boutique_app/personal/domian/personal_user_chip_model.dart';

class CustomChipeWidget extends StatefulWidget {
  final List<PersonalChipData>? list;
  final List<PersonalChipData>? apiList;
  final String? hintText;
  const CustomChipeWidget({super.key, this.list, this.hintText, this.apiList});

  @override
  State<CustomChipeWidget> createState() => _CustomChipeWidgetState();
}

class _CustomChipeWidgetState extends State<CustomChipeWidget> {



  List<PersonalChipData> list = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {

      if(widget.list != null){

        list = widget.list ?? [];

      }


    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MultipleSelectedChipWidget(list: list,
          text: widget.hintText,
        apiList: widget.apiList,
          personalChipListDataOnTap: (p0) {
            setState(() {
              list = p0;
            });
          },
        ),));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 5.sp,horizontal: 10.sp),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(10.sp),
          border: Border.all(color: kBorderColor),
        ),
        child : Row(
          children: [
            if(list.isNotEmpty)
              Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(list.length ?? 0, (index) {
                    list[index].index ??= 0;
                    list[index].index = index;
                    return chip(personalChipData: list[index]);
                  }),
                ),
              ),
            )
            else
              Expanded(child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.sp),
                child: Text(widget.hintText ?? "",style: TextStyle(fontSize: 16.sp, color: Colors.grey,fontWeight: FontWeight.w500),),
              )),
            SizedBox(
                width: 24.sp,
                height: 24.sp,
                child: ImageUtil.iconImageClass.dropDownIcon)
          ],
        )
      ),
    );
  }

  Widget chip({PersonalChipData? personalChipData}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.sp),
      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 5.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: Color(0xffF4F4F4),
      ),
      child: Row(
        children: [
          Text(personalChipData?.text ?? "",style: CustomTextStyle.regularFont14Style.copyWith(color: kBlackColor),),
          GestureDetector(
              onTap: () {
                setState(() {
                  list.removeWhere((element) => element.index == personalChipData?.index);
                });
              },
              child: Icon(Icons.close,color: kBlackColor,size: 20.sp,))
        ],
      ),
    );
  }
}
