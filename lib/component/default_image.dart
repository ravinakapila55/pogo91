import 'package:flutter/material.dart';
import 'package:pogo91/utils/images.dart';

class DefaultImage {
  Widget getImageTView(String imageUrl) {
    return Image.network(
      imageUrl,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
      frameBuilder: (ctx, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;

        return Stack(children: <Widget>[
          AnimatedOpacity(
              opacity: frame == null ? 0 : 1,
              duration: Duration(seconds: 1),
              child: frame != null ? child : null),
        ]);
      },
    );
  }

  Widget getImageView(String imageUrl) {
    print(imageUrl);
    if (imageUrl == null || imageUrl.length == 0) {
      return Image.asset(icProduct);
    } else {
      return FadeInImage(
        placeholder: AssetImage(icProduct),
        image: NetworkImage(imageUrl),
      );
    }
  }

  Widget getImage(String imageUrl, double widthSize, double heightSize) {
    if (imageUrl == null || imageUrl.length == 0) {
      return Image.asset(
        icProduct,
        width: widthSize,
        height: heightSize,
      );
    } else {
      return FadeInImage(
        width: widthSize,
        height: heightSize,
        placeholder: AssetImage(icProduct),
        image: NetworkImage(imageUrl),
      );
    }
  }
}
