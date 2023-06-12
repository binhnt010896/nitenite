import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String? get bannerADUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8633321514198585/4055650720";
    }
    if (Platform.isIOS) {
      return "ca-app-pub-8633321514198585/5437284656";
    }
    return null;
  }

  static final BannerAdListener bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => print("Ad loaded ${ad.responseInfo?.responseExtras.toString()}"),
    onAdFailedToLoad: (ad, error) => print("Ad failed ${error.message}"),
    onAdOpened: (ad) => print("Ad opened ${ad.responseInfo?.responseExtras.toString()}"),
  );
}