import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../notification/route/notification_route.dart';
import '../../../../base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/utils/common_utils/custom_app_bar.dart';
import 'package:odhani_design_sqt/app/job/component/job_detail_custom_view.dart';

class SubJobOrderDetails extends StatefulWidget {
  const SubJobOrderDetails({super.key});

  @override
  State<SubJobOrderDetails> createState() => _SubJobOrderDetailsState();
}

class _SubJobOrderDetailsState extends State<SubJobOrderDetails> {


  List<CustomJobDetailsModel> subJobDetailsModelList = [];

  void removeServiceCard({CustomJobDetailsModel? customJobDetailsModel }) {
    setState(() {
      subJobDetailsModelList.remove(customJobDetailsModel);
    });
  }

  void addServiceCard() {
    setState(() {
      subJobDetailsModelList.add(CustomJobDetailsModel());
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
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
          title: "Sub Job Details",
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
                  if(subJobDetailsModelList.isEmpty)
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

                  if(subJobDetailsModelList.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 10.sp),
                        itemCount: subJobDetailsModelList.length ?? 0,
                        itemBuilder: (context, index) {
                          return JobDetailCustomView(
                            onTap: (){
                              removeServiceCard(customJobDetailsModel: subJobDetailsModelList[index]);
                              setState(() {

                              });
                            },
                          );
                        },),
                    ),
                ],
              ),
            ),

            if(subJobDetailsModelList.isNotEmpty)
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
          child: subJobDetailsModelList.isNotEmpty
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
