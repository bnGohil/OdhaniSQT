import 'dart:io';
import 'custom_image_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../domin/asset/asset_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import '../../../../base/view/base_components/custom_image_view.dart';

class MultiSelectionImage extends StatefulWidget {
  List<File>? imageFileList;

  List<AssetModel>? apiImgList;

  final Function(List<File>)? imageFileDataTap;

  final Function(int)? deleteImageOnTap;

  final int? maxImgCount;

  // final GestureTapCallback? deleteImageOnTap;

  final String? headerText;
   MultiSelectionImage({super.key ,this.maxImgCount ,this.imageFileList,this.headerText,this.imageFileDataTap,this.apiImgList,this.deleteImageOnTap});

  @override
  State<MultiSelectionImage> createState() => _MultiSelectionImageState();
}

class _MultiSelectionImageState extends State<MultiSelectionImage> {

  final ImagePicker imagePicker = ImagePicker();

  List<File> imageFileList = [];

  CustomImagePicker customImagePicker = CustomImagePicker();

  int maxImgCount = 1;

  // File? file;

  @override
  void initState() {
    super.initState();
    customImagePicker.onFile = (value){
      setState(() {
        // file = File(value[0]);
        widget.imageFileList?.add(File(value[0]));
      });
    };

    customImagePicker.onLoading = (value){
      setState(() {});
    };

    customImagePicker.onError = (error){
      setState(() {

      });
    };





    // customImagePicker.onMultiSelectFile = (val) {
    //   setState(() {
    //
    //     for (var element in val) {
    //
    //       widget.imageFileList?.add(File(element.path));
    //
    //       widget.imageFileDataTap!(imageFileList);
    //     }
    //   });
    // };
  }


  @override
  Widget build(BuildContext context) {

    print("${widget.apiImgList}");

    final imgLimitCalculated = (widget.maxImgCount ?? 1) - (widget.apiImgList?.length ?? 0);

    print("imgLimitCalculated $imgLimitCalculated");
    print("imageFileList.length ${imageFileList.length}");

    final canUploadMore = imgLimitCalculated > (widget.imageFileList?.length ?? 0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.centerLeft,
            child: Text("${widget.headerText}",style: CustomTextStyle.blackBoldFont18Style.copyWith(fontSize: 18.sp,fontWeight: FontWeight.w500))),

        // SizedBox(height: 5.sp),

        Wrap(
          alignment: WrapAlignment.start,
          spacing: 0.sp,
          runSpacing: 10.sp,
          runAlignment:  WrapAlignment.start,
          children:

            (widget.apiImgList?.map<Widget>((e) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,right: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      // child: Container(
                      //     height: 80.sp,
                      //     width: 80.sp,
                      //     decoration: BoxDecoration(
                      //         color: kPrimaryColor.withOpacity(0.40),
                      //         borderRadius: BorderRadius.circular(8.sp)
                      //     ),
                      //     child: Image.network(e.imagePahUrl ?? '',
                      //       fit: BoxFit.fill,
                      //     )
                      // ),
                      child : ClipRRect(
                        borderRadius: BorderRadius.circular(5.sp),
                        child: Container(
                          height: 80.sp,
                          width: 80.sp,
                          child: CustomImageView(
                            uri:  e.imagePahUrl ?? "",
                            placeholder: Container(
                                alignment: Alignment.center,
                                color: kWhiteColor,
                                child: Padding(
                                    padding:  EdgeInsets.all(15.sp),
                                    child: ImageUtil.logo.appLogo
                                )
                            ), //show progress  while loading image,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: InkWell(
                      // onTap: widget.deleteImageOnTap,
                      onTap: (){
                        setState(() {
                          widget.deleteImageOnTap!(e.assetId ?? 0) ;
                        });
                      },
                      child: SizedBox(
                        height: 40.sp,
                        width:40.sp,
                        child: Center(
                          child: Container(
                              height: 30.sp,
                              width: 30.sp,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black12
                              ),
                              child: Icon(Icons.delete,color: Colors.red,size: 20.sp,)),
                        ),
                      ),
                    ),
                  )

                ],
              );
            }).toList() ?? [])

          +

                (widget.imageFileList?.map<Widget>((e) {
                  return Stack(
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(top: 15,right: 15),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                              height: 80.sp,
                              width: 80.sp,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.40),
                                  borderRadius: BorderRadius.circular(8.sp)
                              ),
                              child: Image.file(e,fit: BoxFit.fill,)),
                        ),
                      ),

                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              // Api call
                              widget.imageFileList?.removeWhere((element) {
                                print("element.path ${element.path}");
                                print("e.path ${e.path}");

                                return e.hashCode == element.hashCode;
                              });
                              // widget.imageFileDataTap! (widget.imageFileList ?? []) ;
                            });
                          },
                          child: SizedBox(
                            height: 40.sp,
                            width:40.sp,
                            child: Center(
                              child: Container(
                                  height: 30.sp,
                                  width: 30.sp,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12
                                  ),
                                  child: Icon(Icons.delete,color: Colors.red,size: 20.sp,)),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }).toList() ?? [])

          +

          [
            if(canUploadMore)
            Padding(
              padding: const EdgeInsets.only(top: 15,right: 15),
              child: InkWell(
                onTap: (){
                  customImagePicker.bottom(context);
                },
                child: Container(
                  height: 80.sp,
                  width: 80.sp,
                  padding: EdgeInsets.all(25.sp),
                  decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(8.sp)
                  ),
                  child: SvgPicture.asset("$iconPath/add.svg",color: kPrimaryColor),
                ),
              ),
            )
          ],

        ),

      ],
    );
  }
}
