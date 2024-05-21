import 'package:flutter/material.dart';

import '../../colors/light_colors.dart';
import '../../theme/padding.dart';
import '../Utility/constant.dart';
import '../utility/add_ons.dart';
import 'cached_network.dart';

class GetCircleAvatar extends StatelessWidget {
  final String? urlPrefix;
  final String? imageUrl;
  final double padding;
  final double? size;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;
  final String? placeHolderPath;
  final Color? bgColor;
  final BoxShape? shape;
  final Future? futureImageUrl;

  const GetCircleAvatar({
    Key? key,
    this.imageUrl,
    this.padding = 2,
    this.size,
    this.urlPrefix,
    this.borderRadius,
    this.border,
    this.placeHolderPath,
    this.bgColor,
    this.futureImageUrl,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kEdgeInsetsAll(padding),
      child: Container(
        decoration: BoxDecoration(
          border: border,
          color: bgColor ?? kGreyColor3,
          shape: shape ?? BoxShape.circle,
        ),
        child: ClipRRect(borderRadius: borderRadius ?? kBorderRadius(70), child: _widgetImage()),
      ),
    );
  }

  Widget _widgetImage() {
    if (futureImageUrl != null) {
      return FutureBuilder(
        future: futureImageUrl!,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data);
            return ClipRRect(
              borderRadius: kBorderRadius(60),
              child: _widgetCacheImage(snapshot.data),
            );
          }
          return SizedBox(
            width: kSize(size ?? 13),
            height: kSize(size ?? 13),
          );
        },
      );
    }
    return _widgetCacheImage(checkNull(imageUrl) ? imageUrl : null);
  }

  Widget _widgetCacheImage(url) {
    return WidgetCachedNetwork(
      urlPrefix: urlPrefix ?? "",
      url: url,
      size: kSize(size ?? 15),
      placeHolderPath: placeHolderPath ?? Assets.icUserPlaceHolder,
    );
  }
}
