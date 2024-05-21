import 'package:flutter/material.dart';

import '../../../theme/padding.dart';
import '../utility/cached_network.dart';

class WidgetUserImage extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final Future? future;
  final EdgeInsets? padding;

  const WidgetUserImage({Key? key, required this.imageUrl, this.size, this.future, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kEdgeInsetsSymmetricHV(h: 2, v: 2),
      child: ClipRRect(
        borderRadius: kBorderRadius(50),
        child: WidgetCachedImage(

          // urlPrefix: EcaApis.imagePrefix,
          url: imageUrl,
          width: kSize(size ?? 13),
        ),
      ),
    );
  }
}
