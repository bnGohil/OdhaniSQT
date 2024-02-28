import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../utils/utils.dart';





class CustomOtpWidget extends StatefulWidget {
  final int? countLength;
  final ValueChanged<String>? onChanged;
  final Function(String)? isOtpValue;
  bool isStop;
  String? otpValue;
  final TextEditingController? textEditingController;
  CustomOtpWidget(
      {Key? key,
        this.onChanged,
        this.isStop = false,
        this.textEditingController,
        this.otpValue,
        this.isOtpValue, this.countLength})
      : super(key: key);

  @override
  State<CustomOtpWidget> createState() => _CustomOtpWidgetState();
}

class _CustomOtpWidgetState extends State<CustomOtpWidget> {
  var count = 4, value = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(count, (index) {
              var myValue = (value.isNotEmpty && value.length >= index + 1)
                  ? value[index]
                  : "";
              if (widget.isStop == true) {
                myValue = "";
              }
              return Container(
                height: 54.sp,
                width: 54.sp,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.sp,color: const Color(0xffCCCCCC)),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text(myValue,style: CustomTextStyle.blackRegularFont16Style),
                ),
              );
            })),
        TextFormField(
          cursorColor: Colors.transparent,
          controller: widget.textEditingController,
          showCursor: false,
          inputFormatters: [LengthLimitingTextInputFormatter(6)],
          onTap: () {
            setState(() {
              TextSelection.fromPosition(TextPosition(offset: value.length));
            });
          },
          autofocus: false,
          onChanged: (value) {
            var storeValue = "";
            storeValue = value;
            if (storeValue.length <= count) {
              setState(() {
                this.value = storeValue;
              });
              widget.onChanged!.call(this.value);
            } else {
              setState(() {
                storeValue = "";
                this.value = "";
                widget.textEditingController!.text = "";
                // Toaster.showMessage(context,
                //     msg: "please enter valid otp", isError: true);
              });
              print("otp is else part");
            }
            if (value.length >= count) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
            widget.isStop = false;
            // widget.onChanged!.call(this.value);
          },
          style: const TextStyle(color: Colors.transparent),
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
        ),
      ],
    );
  }
}




class CustomOtpTextWidget extends StatefulWidget {
  final int? countLength;
  final String? otp;
  final Function(String)? onChange;
  const CustomOtpTextWidget({super.key, this.countLength, this.otp, this.onChange});

  @override
  State<CustomOtpTextWidget> createState() => _CustomOtpTextWidgetState();
}

class _CustomOtpTextWidgetState extends State<CustomOtpTextWidget> {
  TextEditingController otpController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.otp != null){
      otpController.text = widget.otp ?? "";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(widget.countLength ?? 0, (index) {
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
                child: Text(myValue ?? "",style: CustomTextStyle.blackRegularFont16Style),
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
          cursorColor: Colors.white,

          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.countLength)
          ],
          onChanged: (value) {
            if(value.isNotEmpty){
              widget.onChange?.call(value);
            }
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
    );
  }
}
