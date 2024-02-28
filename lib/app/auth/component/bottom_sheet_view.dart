import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class BottomSheetView extends StatefulWidget {
  final Widget? headerText;
  final Widget? bottomSheetBody;
  const BottomSheetView({Key? key,this.headerText,this.bottomSheetBody}) : super(key: key);

  @override
  _BottomSheetViewState createState() {
    return _BottomSheetViewState();
  }
}

class _BottomSheetViewState extends State<BottomSheetView> {
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
    final bool isKeyboard = MediaQuery.of(context).viewInsets.bottom!=0;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ImageUtil.imageClass.authBgImage,

          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 600),
              // height: !isKeyboard ? MediaQuery.of(context).size.height / 1.5 : MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(45.sp))
              ),
              child:  Column(
                children: [
                  SizedBox(height: !isKeyboard ? 25.sp : MediaQuery.of(context).padding.top + 20.sp ),

                  widget.bottomSheetBody ?? Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}