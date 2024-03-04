import 'package:flutter/material.dart';
import '../../../../../utils/utils.dart';
import 'multi_select_chip_order.dart';
class ChipTextField extends StatefulWidget {
  // List<ServiceType>? selectedList;
  List<String>? selectedList;
  List<String>? apiList;
  String? headerText;
  // final Function(List<TagData>)? onTapSelectedList;
  ChipTextField({Key? key,this.selectedList, this.apiList ,this.headerText }) : super(key: key);

  @override
  _ChipTextFieldState createState() {
    return _ChipTextFieldState();
  }
}

class _ChipTextFieldState extends State<ChipTextField> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("${widget.selectedList.toString()} == check this seleted List");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(widget.headerText ?? "Product Category",style: CustomTextStyle.blackMediumFont16Style.copyWith(fontSize: 18.sp),),

        SizedBox(height: 10.sp),

        InkWell(
          onTap: () async{

            final selectedData = await Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> MultiSelectChipOrder(
                  selectedList: widget.selectedList,
                  apiList: widget.apiList,
                ))
            );

            if(selectedData != null) {
              setState(() {
                widget.selectedList = selectedData;
                print(widget.selectedList);
              });
            }

          },
          child: Container(
              width: double.infinity,

              decoration: BoxDecoration(
                color: kWhiteColor,
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(8.sp)
              ),

              padding: EdgeInsets.only(right: 0,left: 5.sp,top: 2.sp,bottom: 2.sp),

              child: Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(

                      scrollDirection: Axis.horizontal,

                      child: Row(
                        children: (widget.selectedList?.isEmpty ==  true)

                            ? [Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.sp),

                            child: Text("Select Category",style: CustomTextStyle.blackBoldFont16Style.copyWith(fontWeight: FontWeight.w500, color: Colors.grey),))]

                            :List.generate(widget.selectedList?.length ?? 0, (index) {

                          return Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.sp),
                            child: chip(index: index),
                          );

                        }),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        height: 30.sp,width: 30.sp,
                        child: Icon(Icons.chevron_right,)),
                  ),
                ],
              )
          ),
        ),
      ],
    );
  }

  Widget chip({int? index}){
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.sp)
      ),

      margin: EdgeInsets.only(right: 10.sp),

      padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 5.sp),
      child: Row(
        children: [
          Text( widget.selectedList == []
              ?  "Select Category"
              // : "${widget.selectedList?[index ?? 0].value}",
              : "${widget.selectedList?[index ?? 0]}",

              style: CustomTextStyle.mainTextColorRegularFont16Style
          ),

          SizedBox(width: 4.sp),

          InkWell(
              onTap: (){
                widget.selectedList?.removeAt(index ?? 0);
                setState(() {

                });
              },
              child: Icon(Icons.close,size: 20.sp,))
        ],
      ),
    );
  }
}