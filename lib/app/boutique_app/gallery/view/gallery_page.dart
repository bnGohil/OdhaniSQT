import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odhani_design_sqt/base/base.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_button.dart';
import 'package:odhani_design_sqt/base/view/base_components/custom_image_picker.dart';
import 'package:odhani_design_sqt/utils/utils.dart';

import '../../../../utils/common_utils/custom_app_bar.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();

}




class _GalleryPageState extends State<GalleryPage> {

  List<File> imageFile = [];


  CustomImagePicker customImagePicker = CustomImagePicker();


  bool isIMageLoading = false;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    customImagePicker.onMultiSelectFile = (value){



      setState(() {

        for (var element in value) {

          imageFile.add(File(element.path));

        }

      });

    };


    customImagePicker.onError = (error){

      setState(() {

        Toaster.showMessage(context, msg: error);


      });

    };

    customImagePicker.onLoading = (loading){

     setState(() {

       isIMageLoading = loading;

     });

    };


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        height: 100.sp,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SizedBox(
            height: 24.sp,
            width: 24.sp,
            child: ImageUtil.iconImageClass.backArrowIcon,
          ),
        ),
        title: "Gallery",
        action: GestureDetector(
            onTap: () {

            },
            child: ImageUtil.iconImageClass.notificationIcon),
      ),
      body: isIMageLoading ?
      Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      ):
      GridView.builder(
        itemCount: imageFile.length,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5.sp,mainAxisSpacing: 5.sp),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24.sp),
                          height: 350.sp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              image: DecorationImage(image: FileImage(imageFile[index]),fit: BoxFit.fill)
                            ),

                        ),
                        SizedBox(height: 25.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                IconButton.outlined(
                                  onPressed: (){},
                                  style: ButtonStyle(
                                            side: MaterialStateProperty.all(
                                              BorderSide(
                                                  width: 1,
                                                  color: Colors.white),
                                            ),
                                          ),
                                  color: Colors.white,
                                  icon:Icon(Icons.share,size: 32.sp,),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.white,
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      BorderSide(
                                          width: 1,
                                          color: Colors.white),
                                    ),
                                  ),
                                  icon:Icon(Icons.close,size: 32.sp,),
                                ),
                                // Text("Close",style: CustomTextStyle.whiteBoldFont20Style,)
                              ],
                            ),

                          ],
                        )
                      ],
                    )
                  );
                },);

              },
              child: Stack(
                children: [

                  Container(
                    margin: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.sp),
                      image: DecorationImage(image: FileImage(imageFile[index]),fit: BoxFit.cover),
                      border: Border.all(color: kBorderColor)
                    ),

                  ),

                  Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            imageFile.remove(imageFile[index]);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: kBlackColor,width: 1.sp),
                            shape: BoxShape.circle
                          ),
                          child: Icon(Icons.close,size: 20.sp,color: kBlackColor,),),
                      ))

                ],
              ),
            );
          },),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
            height: 60.sp,
            child: CustomButton(
              onTap: () {
                customImagePicker.bottomMultiple(context);
              },
              radius: 100.sp,
              btnColor: kPrimaryColor,
              btnText: "Add Images",

            )
        ),
      ),
    );
  }
}
