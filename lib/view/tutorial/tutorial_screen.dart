import 'package:flutter/material.dart';
import 'package:pogo91/component/custom_component/button.dart';
import 'package:pogo91/component/custom_component/normal_text_field.dart';
import 'package:pogo91/component/custom_component/text_field_bold.dart';
import 'package:pogo91/component/custom_component/text_field_regular.dart';
import 'package:pogo91/model/tutorial_model.dart';
import 'package:pogo91/utils/box_decoration/circle_yellow_widget.dart';
import 'package:pogo91/utils/box_decoration/yellow_solid_shadow_50.dart';
import 'package:pogo91/utils/colors.dart';
import 'package:pogo91/utils/strings.dart';

class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreen createState() => _TutorialScreen();
}

class _TutorialScreen extends State<TutorialScreen> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 6.0 : 6.0,
      width: isCurrentPage ? 20.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? yellow : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: <Widget>[
                  SlideTile(
                    imagePath: mySLides[0].getImageAssetPath(),
                    title: mySLides[0].getTitle(),
                    desc: mySLides[0].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[1].getImageAssetPath(),
                    title: mySLides[1].getTitle(),
                    desc: mySLides[1].getDesc(),
                  ),
                  SlideTile(
                    imagePath: mySLides[2].getImageAssetPath(),
                    title: mySLides[2].getTitle(),
                    desc: mySLides[2].getDesc(),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 100),
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    i == slideIndex
                        ? _buildPageIndicator(true)
                        : _buildPageIndicator(false),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          color: Colors.white,
          child: slideIndex != 2
              ? Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          controller.animateToPage(2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          child: NormalTextField(
                            label: skip,
                            textSize: 15,
                            textColor: Colors.black,
                          ),
                        ),
                      ),
                      nextButton(),
                    ],
                  ),
                )
              : ButtonRegular(
                  label: "Get Started",
                  onPressedButton: () => onClickHomeScreen(context),
                  decoration: YellowSolidShadow50().getDecoration(),
                ),
        ),
      ),
    );
  }

  void onClickHomeScreen(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, NAV_HOME_SCREEN);
  }

  Widget nextButton() {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(slideIndex + 1,
            duration: Duration(milliseconds: 300), curve: Curves.linear);
      },
      child: Container(
          width: 120,
          height: 50,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          decoration: YellowSolidShadow50().getDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NormalTextField(
                label: "Next",
                textSize: 16,
                textColor: Colors.white,
              ),
              Container(
                decoration: CircleYellowDecoration().getRoundedWidget(),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
              )
            ],
          )),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 180,
          ),
          SizedBox(
            height: 30,
          ),
          TextFieldBold(
            marginTop: 0,
            textAligment: Alignment.center,
            label: title,
            textSize: 16,
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldRegular(
            marginTop: 0,
            textAlign: TextAlign.center,
            textAligment: Alignment.centerRight,
            label: desc,
            textSize: 16,
          )
        ],
      ),
    );
  }
}
