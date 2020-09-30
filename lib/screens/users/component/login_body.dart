import 'package:flutter/material.dart';
import 'package:pogo91/screens/users/component/background.dart';
import 'package:pogo91/screens/users/otp.dart';
import 'package:pogo91/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new Container(
              margin: const EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0),
              child: Text(
                Constants.WELCOME_POGO91,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'LatoBold'),
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              padding: const EdgeInsets.only(
                  left: 15, bottom: 11, top: 11, right: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Constants.login_border_grey),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Country Code",
                    style: TextStyle(
                        fontSize: 12,
                        color: Constants.login_grey,
                        fontFamily: 'LatoRegular'),
                  ),
                  Text(
                    "India (+91)",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'LatoRegular'),
                  )
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              width: double.infinity,
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Constants.login_border_grey),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                      onChanged: null,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      )),
                ],
              ),
            ),
            new Container(
              margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Text(
                Constants.WELCOME_LOGIN_MSG,
                style: TextStyle(
                    fontSize: 10,
                    color: Constants.login_grey,
                    fontFamily: 'LatoRegular'),
              ),
            ),
            new Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              decoration: BoxDecoration(
                  color: Constants.yellow,
                  border: Border.all(color: Constants.yellow),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: MaterialButton(
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => OTP()))
                },
                elevation: 0.0,
                child: Text(
                  "Log In",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Constants.login_button_blue,
                      fontFamily: 'LatoRegular'),
                ),
                color: Constants.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
