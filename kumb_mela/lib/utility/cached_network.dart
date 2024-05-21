import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utility/constant.dart';
import 'add_ons.dart';

class WidgetCachedImage extends StatelessWidget {
  final String? url;
  final String urlPrefix;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final String? placeHolderPath;
  final bool showProgress;

  const WidgetCachedImage({
    super.key,
    this.url,
    this.width,
    this.height,
    this.fit,
    this.placeHolderPath,
    this.showProgress = true,
    this.urlPrefix = "",
  });

  @override
  Widget build(BuildContext context) {
    if (checkNull(url)) {
      return CachedNetworkImage(
        height: width,
        width: height,
        imageUrl: "$urlPrefix$url",
        fit: fit ?? BoxFit.cover,
        progressIndicatorBuilder: showProgress
            ? (context, url, downloadProgress) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(value: downloadProgress.progress),
                  ],
                );
              }
            : null,
        errorWidget: (context, url, error) {
          return Image.asset(
            placeHolderPath ?? Assets.icUserPlaceHolder,
            height: height,
            width: width,
          );
        },
      );
    } else {
      return Image.asset(
        placeHolderPath ?? Assets.icUserPlaceHolder,
        height: width,
        width: width,
      );
    }
  }
}
