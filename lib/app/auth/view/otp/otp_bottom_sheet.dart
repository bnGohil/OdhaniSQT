
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../../../base/base.dart';
import '../../../../base/view/base_components/custom_button.dart';
import '../../../../utils/utils.dart';
import '../../route/auth_route/auth_route.dart';

class OtpBottomSheet extends StatefulWidget {
  final String? emailId;
  final bool? isRegister;
  final int? otp;

   const OtpBottomSheet({super.key,this.emailId,this.otp,this.isRegister});

  @override
  State<OtpBottomSheet> createState() => _OtpBottomSheetState();
}

class _OtpBottomSheetState extends State<OtpBottomSheet> {

  int? otp;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async{
      // final authProvider = context.read<AuthProvider>();

      if(widget.isRegister == false){

        setState(() {
          if(widget.otp != null){
            otpController.text = widget.otp.toString();
          }
        });

        context.read<OtpTimer>().startTimer();

      }else{
        try {
          // await authProvider.sendOtp(otpWithOutAuthReqModel: OtpWithOutAuthReqModel(mobileNo: widget.emailId));
          // final otp = (authProvider.sendOtpResponse.data?.data?.otp ?? 0).toString();
          // otpController.text = otp;
          context.read<OtpTimer>().startTimer();
        } catch (e) {
          Navigator.pop(context);
          Toaster.showMessage(context, msg: e.toString(),isError: true);
        }
      }



    });
}

@override
  void dispose() {
    // context.read<OtpTimer>().stopTimer();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final otpTimerCheck = context.watch<OtpTimer>();


    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45.sp),topRight: Radius.circular(45.sp)),
          color: const Color(0xffFFFFFF),
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.sp),

              Text("Enter OTP",style: CustomTextStyle.blackBoldFont20Style),

              SizedBox(height: 20.sp),

              Text("Please enter four digit code sent \nto your Email Address ${widget.emailId ?? "your@gmail.com"}",textAlign: TextAlign.center,style: CustomTextStyle.mainTextColorRegularFont16Style),

              SizedBox(height: 40.sp),

              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4 ?? 0, (index) {
                      var myValue = (otpController.text.isNotEmpty && otpController.text.length >= index + 1)
                          ? otpController.text[index]
                          : "";
                      return Container(
                        height: 54.sp,
                        width: 54.sp,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.sp,color: const Color(0xffCCCCCC)),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text(myValue ?? "",style: CustomTextStyle.blackBoldFont18Style.copyWith(
                              fontWeight: FontWeight.w400
                          )),
                        ),
                      );
                    }),
                  ),
                  TextFormField(
                    autofillHints: [
                      AutofillHints.oneTimeCode,
                    ],
                    controller: otpController,
                    style: const TextStyle(color: Colors.transparent),
                    cursorColor: Colors.transparent,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(4)
                    ],
                    onChanged: (value) {
                      // if(value.isNotEmpty){
                      //   widget.onChange?.call(value);
                      // }
                      setState(() {});
                    },
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      counterText: '',
                      hoverColor: Colors.transparent,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusColor: Colors.transparent,
                      fillColor: Colors.transparent,
                      filled: false,
                      focusedBorder: InputBorder.none,
                      alignLabelWithHint: false,
                      focusedErrorBorder: InputBorder.none,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                  )
                ],
              ),

              SizedBox(height: 20.sp),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                      text: "Didn’t receive code ? ",
                      style: CustomTextStyle.blackRegularFont16Style.copyWith(
                        fontWeight: FontWeight.w300
                      ),
                      children: [
                        TextSpan(
                            text: "Resend",
                            recognizer: TapGestureRecognizer()..onTap = () async{
                              // final authProvider = context.read<AuthProvider>();
                              //
                              // if(otpTimerCheck.isTimer == false){
                              //   context.read<OtpTimer>().startTimer();
                              //
                              //   await authProvider.sendOtp(otpWithOutAuthReqModel: OtpWithOutAuthReqModel(mobileNo: widget.emailId));
                              //
                              // }else{
                              //   print("else part");
                              // }

                            } ,
                            style: CustomTextStyle.blackRegularFont16Style.copyWith(
                             color: otpTimerCheck.isTimer == true? Colors.grey.withOpacity(0.5) : kPrimaryColor,decoration: TextDecoration.underline
                            )
                        )
                      ]
                    )),
                    if(otpTimerCheck.isTimer)
                    ValueListenableBuilder(valueListenable: timerValueNotifier,
                      builder: (context, value, child) {
                        return Text("${(value.inMinutes.toString()).padLeft(2,"0")}:${(value.inSeconds.toString()).padLeft(2,"0")}",style: CustomTextStyle.blackRegularFont16Style);
                      },),

                  ],
                ),
              ),
              SizedBox(height: 30.sp),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: CustomButton(
                  isLoading: false,
                 btnColor: kPrimaryColor,
                  btnText: "Verify Otp",
                  onTap: (){
                    AuthRoute.goToChangePassword(context);
                  },
                  circleShape: true,
                  // isLoading: verifyOtpLoading,
                  textStyle: CustomTextStyle.whiteBoldFont18Style,
                ),
              ),
              SizedBox(height: 60.sp),
            ],
          ),
        ),
      ),
    );
  }
}
