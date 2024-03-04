import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../base/base.dart';
import '../../../../base/view/base_components/custom_button.dart';



class MultiSelectChipOrder extends StatefulWidget {
  // final Function(List<TagData> selectedChoices)? onSelectionChanged;
  // final List<ServiceType>? selectedList;
  final List<String>? selectedList;
  final List<String>? apiList;
  MultiSelectChipOrder({Key? key,
    // this.onSelectionChanged,
     this.selectedList, this.apiList
  }) : super(key: key);

  @override
  _MultiSelectChipOrderState createState() {
    return _MultiSelectChipOrderState();
  }
}

class _MultiSelectChipOrderState extends State<MultiSelectChipOrder> {
  // List<ServiceType> selectedChoices = [];
  List<String> selectedChoices = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{

      setState(() {
        selectedChoices = widget.selectedList ?? [];
      });

      // final getTagProvider = context.read<AuthProvider>();
      //
      // await getTagProvider.getTag(getTagReqModel: GetTagReqModel(term: GetTermType.cuisinType.value));

    });
  }

  @override
  Widget build(BuildContext context) {

    print(widget.selectedList?.length);

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Material"),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(height: 20.sp),

                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Category Type", style: CustomTextStyle.blackBoldFont18Style)
                  ),

                  SizedBox(height: 20.sp),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      runSpacing: 8,
                      spacing: 5,
                      children: _buildChoiceList(mainList: widget.apiList ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom:  50.sp,right: 20.sp ,left: 20.sp),
                  child: CustomButton(
                    btnText: "Save",
                    onTap: (){
                      setState(() {

                        try {
                          if(selectedChoices.isEmpty) {
                            throw "Please select Your Tag";
                          }

                          Navigator.pop(context,selectedChoices);

                        } catch (e) {
                          Toaster.showMessage(context, msg: e.toString());
                        }

                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildChoiceList({List<String>? mainList}) {
    // final getTagProvider = context.watch<AuthProvider>();

    // final getTagRes = getTagProvider.getTagResponse.data?.data?.terms ?? [];
    //
    // final getTagLoader = getTagProvider.getTagResponse.state == Status.LOADING;

    //
    // if(getTagLoader) {
    //
    //   return List.generate(5, (index) {
    //     return const SkeletonView(
    //       isLoading: true,
    //       radius: 10,
    //       child: SizedBox(
    //         height: 30,
    //         width: 80,
    //       ),
    //     );
    //   });
    //
    // }

    return mainList?.map((item) {

      // final isSelected = selectedChoices.map((e) => e.value ?? "").contains(item.value) == true;
      final isSelected = selectedChoices.map((e) => e ?? "").contains(item) == true;

      return Container(
          padding: const EdgeInsets.all(2.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(40.sp),
            onTap: (){
              setState(() {
                if(isSelected) {
                  selectedChoices.removeWhere((element) => element == item);
                } else {
                  // selectedChoices.add(ServiceType(termId: item.termId, termCode: item.termCode,value: item.value));
                  selectedChoices.add(item);
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 8.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.sp),
                color: isSelected ? kPrimaryColor : Color(0xffF3f3f3),
              ),

              child: Text(item ?? "",
                style: CustomTextStyle.regularFont14Style.copyWith(
                    color: isSelected  ? kWhiteColor : kBlackColor,
                    fontSize: 14.sp,
                    fontWeight: isSelected  ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
          )

      );
    }).toList();
  }
}