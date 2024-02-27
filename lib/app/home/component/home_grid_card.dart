import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odhani_design_sqt/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../base/view/base_components/skeleton_loading.dart';
import '../domian/home_grid_model.dart';


class HomeGridCardView extends StatelessWidget {
  const HomeGridCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.sp),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5.sp,
              childAspectRatio: 1.8,
              mainAxisSpacing: 5.sp),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final gridData = HomeInfoCardModel.gridList[index];
            return InkWell(
              onTap: () {

              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2.3,
                padding: EdgeInsets.only(left: 15.sp),
                decoration:  BoxDecoration(
                  image: const DecorationImage(image: AssetImage("assets/images/graphics/back_ground.png"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                      topLeft: index == 0 ? Radius.circular(15.sp) : Radius.zero,
                      topRight: index == 1 ? Radius.circular(15.sp) : Radius.zero,
                       bottomLeft: index == 2 ? Radius.circular(15.sp) : Radius.zero,
                      bottomRight: index == 3 ? Radius.circular(15.sp) : Radius.zero,
                    ),
                    // borderRadius: BorderRadius.circular(10.sp),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SkeletonView(
                      isLoading: false,
                        borderRadius: BorderRadius.circular(12.sp),
                        skeletonBody: SizedBox(
                          height: 45.sp,
                          width: 120.sp,
                        ),
                        child: Text("${gridData.cardNumber}",style: CustomTextStyle.boldFont30Style.copyWith(color: kBlackColor))),

                    SizedBox(
                       height: 5.sp,
                    ),

                    SkeletonView(
                      isLoading: false,
                        borderRadius: BorderRadius.circular(12.sp),
                        skeletonBody: Container(
                          height: 20.sp,
                          width: 80.sp,
                        ),
                        child: Text("${gridData.cardText}",style: CustomTextStyle.lightFont16Style)),

                  ],
                ),
              ),
            );
          },itemCount: HomeInfoCardModel.gridList.length,
          shrinkWrap: true),
    );
  }
}
