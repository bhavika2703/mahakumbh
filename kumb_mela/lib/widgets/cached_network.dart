import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../Utility/constant.dart';
import '../utility/add_ons.dart';

class WidgetCachedNetwork extends StatelessWidget {
  final String? url;
  final String urlPrefix;
  final double size;
  final BoxFit? fit;
  final String? placeHolderPath;
  final bool showProgress;

  const WidgetCachedNetwork(
      {super.key, this.url, this.urlPrefix = "", required this.size, this.fit, this.placeHolderPath, this.showProgress = true});

  @override
  Widget build(BuildContext context) {
    if (checkNull(url)) {
      return CachedNetworkImage(
        height: size,
        width: size,
        imageUrl: "$urlPrefix$url",
        fit: fit ?? BoxFit.cover,
        errorWidget: (context, url, error) {
          return Image.asset(
            placeHolderPath ?? Assets.icUserPlaceHolder,
            height: size,
            width: size,
          );
        },
      );
    } else {
      return Image.asset(
        placeHolderPath ?? Assets.icUserPlaceHolder,
        height: size,
        width: size,
      );
    }
  }
}
