import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../../base/view/base_components/custom_button.dart';
import '../../../../../utils/common_utils/custom_app_bar.dart';
import '../../../notification/route/notification_route.dart';
import '../../component/odrer_detail_custom_view.dart';

class CreateSubOrderDetails extends StatefulWidget {
  const CreateSubOrderDetails({super.key});

  @override
  State<CreateSubOrderDetails> createState() => _CreateSubOrderDetailsState();
}

class _CreateSubOrderDetailsState extends State<CreateSubOrderDetails> {
  List<CustomOrderDetailsModel> subOrderDetailsModelList = [];

  void removeServiceCard({CustomOrderDetailsModel? customOrderDetailsModel }) {
    setState(() {
      subOrderDetailsModelList.remove(customOrderDetailsModel);
    });
  }

  void addServiceCard() {
    setState(() {
      subOrderDetailsModelList.add(CustomOrderDetailsModel());
    });
  }

  @override
  Widget build(BuildContext context) {
    print("${subOrderDetailsModelList.length} ====  check this SsubOrderDetailsModelListub");
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: "Sub Order Details",
        action: GestureDetector(
            onTap: () {
              NotificationRoute.goToNotification(context);
            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),

      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(subOrderDetailsModelList.isEmpty)
                InkWell(
                  onTap: (){
                    addServiceCard();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8.sp)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height:20.sp,
                          width: 20.sp,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(2.sp)
                          ),
                          child: const CustomSvgPictures.asset("${iconPath}/add.svg",color: Colors.white,),
                        ),

                        SizedBox(width: 15.sp),

                        Text("Add Details",style: CustomTextStyle.mainColorMediumFont16Style,),
                      ],
                    ),
                  ),
                ),
          
                if(subOrderDetailsModelList.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    itemCount: subOrderDetailsModelList.length ?? 0,
                    itemBuilder: (context, index) {
                    return OrderDetailsCustomView(
                      onTap: (){
                        removeServiceCard(customOrderDetailsModel: subOrderDetailsModelList[index]);
                        setState(() {
          
                        });
                      },
                    );
                  },),
                ),
              ],
            ),
          ),

          if(subOrderDetailsModelList.isNotEmpty)
          Positioned(
            bottom: 50.sp,
            right: 30.sp,

            child: FloatingActionButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70.sp)),
              elevation: 0.0,
              foregroundColor: kPrimaryColor,
              backgroundColor: kBlackColor,
              onPressed: (){
                addServiceCard();

              },
              child: Icon(Icons.add,color: kWhiteColor,),
            ),
          )
        ],
      ),


      bottomNavigationBar: SafeArea(
        child: subOrderDetailsModelList.isNotEmpty
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          height: 70.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      btnColor: kLightWhiteColor,
                      radius: 100.sp,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      textStyle: CustomTextStyle.mediumFont18Style,
                      btnText:"Previous",
                      isBoxShadow: false,
                    ),
                  ),
                  SizedBox(width: 10.sp,),
                  Expanded(
                    child: CustomButton(
                      isBoxShadow: false,
                      radius: 100.sp,
                      btnText: "Save",
                      onTap: () {
                        // ChatRoute.goToChatPage(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
            :  SizedBox(),
      )
    );
  }
}
