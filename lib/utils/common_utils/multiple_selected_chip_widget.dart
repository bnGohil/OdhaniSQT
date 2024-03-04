import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../app/boutique_app/personal/domian/personal_user_chip_model.dart';
import 'custom_app_bar.dart';
class MultipleSelectedChipWidget extends StatefulWidget {
  final List<PersonalChipData>? list;
  final List<PersonalChipData>? apiList;
  final String? text;
  final Function(List<PersonalChipData>)? personalChipListDataOnTap;
  const MultipleSelectedChipWidget({super.key,this.list, this.text, this.apiList, this.personalChipListDataOnTap});

  @override
  State<MultipleSelectedChipWidget> createState() => _MultipleSelectedChipWidgetState();
}

class _MultipleSelectedChipWidgetState extends State<MultipleSelectedChipWidget> {

  List<PersonalChipData> selectedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {

      if(widget.list != null){

        selectedList = widget.list ?? [];

      }



    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: widget.text,

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
        child: Column(
          children: [
            Wrap(
              spacing: 10.sp,
              runSpacing: 5.sp,
              children: List.generate(widget.apiList?.length ?? 0, (index) {

                final isSelected = selectedList.map((e) => e.text ?? "").contains(widget.apiList?[index].text);

                return GestureDetector(
                onTap: () {


                  print("isSelected is ${isSelected}");

                  setState(() {

                    if(!isSelected){

                      selectedList.add(widget.apiList![index]);

                    }else{

                      selectedList.remove(widget.apiList![index]);
                    }

                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 10.sp),
                    decoration: BoxDecoration(
                      color: !isSelected ? kLightWhiteColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(25.sp)
                    ),
                    child: Text(widget.apiList?[index].text ?? "",style: CustomTextStyle.regularFont16Style.copyWith(
                      color: !isSelected ? kBlackColor : kWhiteColor,
                    ),)),
              );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: selectedList.isNotEmpty ?
      SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 60.sp,
          child: CustomButton(
            btnColor: kPrimaryColor,
            radius: 100,
            onTap: () {
              widget.personalChipListDataOnTap!(selectedList);
              Navigator.pop(context);
            },
            btnText: "Select ${widget.text}",
          ),
        ),
      ) : SizedBox.shrink()
    );
  }
}
