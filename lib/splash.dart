import 'package:flutter/material.dart';
import 'package:pogo91/util/preferences.dart';
import 'package:pogo91/utils/images.dart';
import 'package:pogo91/utils/strings.dart';

class Splash extends StatefulWidget {
  Splash_ createState() => Splash_();
}

class Splash_ extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        Preferences preferences = Preferences();
        preferences.showTutorialScreen().then((value) {
          if (value == null || !value) {
            Navigator.pop(context);
            preferences.setTutorialVisible();
            Navigator.pushNamed(context, NAV_TUTORIAL_SCREEN);
          } else {
            Navigator.pop(context);
            Navigator.pushNamed(context, NAV_HOME_SCREEN);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Image.asset(icSplash, width: 100, height: 100),
    );
  }
}
