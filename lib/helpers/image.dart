import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transparent_image/transparent_image.dart';

const SVG = "SVG";
const RENDERED = "RENDERED";

// Get Network Image
getNetworkImage(String src, {
  String type = RENDERED,
  double? height,
  double? width,
  BoxFit? fit,
}) {
  switch (type) {
    case RENDERED:
      return CachedNetworkImage(
        cacheKey: src,
        key: UniqueKey(),
        imageUrl: src,
        height: height,
        width: width,
        fit: fit,
        cacheManager: CacheManager(
          Config(
            src,
            stalePeriod: Duration(days: 1)
          )
        ),
        placeholder: (context, url) => getLoading(height: height, width: width),
        errorWidget: (context, url, error) => getErrorImage(size: height),
      );
    case SVG:
      return SvgPicture.network(
        src,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (context) {
          return getLoading(height: height, width: width);
        },
      );
    default:
      return Image.network(src);
  }
}

// Get spinning loading image
getLoading({
  double? height,
  double? width
}) => Container(
  color: Colors.white,
  child: Image.asset("assets/images/loading.gif", height: height, width: width),
);

// Get onError image
getErrorImage({
  double? size,
}) => Icon(Icons.image_not_supported_outlined, size: size);