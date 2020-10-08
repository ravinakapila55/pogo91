import 'package:pogo91/utils/images.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel
      .setDesc("Discover the best offer from the neighbour stores around you");
  sliderModel.setTitle("Discover");
  sliderModel.setImageAssetPath(icIllustraction3);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.");
  sliderModel.setTitle("Pay");
  sliderModel.setImageAssetPath(icIllustraction3);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Earn rewards on every purchase. Redeem points on the store, gift voucher and much more.");
  sliderModel.setTitle("Earn Rewards");
  sliderModel.setImageAssetPath(icIllustraction3);
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
