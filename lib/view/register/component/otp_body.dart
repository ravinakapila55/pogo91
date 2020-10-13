import 'package:flutter/material.dart';
import 'package:pogo91/component/otp/pin_code_fields.dart';
import 'package:pogo91/component/otp/pin_theme.dart';
import 'package:pogo91/view/register/component/background.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/constants.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              margin: const EdgeInsets.fromLTRB(15.0, 84.0, 15.0, 0),
              child: Image.asset(
                kOTPMessage,
                width: 140,
                height: 140,
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(15.0, 54.0, 15.0, 0),
              child: Text(
                Constants.VERIFY_ACCOUNT,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'LatoRegular'),
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(15.0, 24.0, 15.0, 0),
              child: Text(
                Constants.VERIFY_MESSAGE,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'LatoRegular'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 54, left: 20, right: 20),
              child: PinCodeTextField(
                appContext: context,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                length: 4,
                obscureText: false,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeColor: greyOTPBorderColor,
                    activeFillColor: greyOTPBorderColor,
                    inactiveColor: greyOTPBorderColor,
                    selectedColor: greyOTPBorderColor),
                backgroundColor: Colors.white,
                enableActiveFill: false,
                onCompleted: (v) {
                  onCompletedVerifyOtp(context);
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(15.0, 44.0, 15.0, 0),
              child: Text(
                Constants.VERIFY_DIDNT_GET_CODE,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'LatoRegular'),
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0),
              child: Text(
                Constants.RESEND,
                style: TextStyle(
                    fontSize: 16,
                    color: Constants.yellow,
                    fontFamily: 'LatoRegular'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCompletedVerifyOtp(BuildContext context) {
    Navigator.pushNamed(context, NAV_SAVE_USER_INFO);
  }
}
