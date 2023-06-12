import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/configs/theme.dart';
import 'package:nitenite/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AAAAt3ppo-Q:APA91bGdD_5syD4RFUsZxsyD0nDIqhh4TVoVNfAzOm3Ek7JfIsH0UUQlXalLQWnBBWd0lIWdAEsntqkyW3sHhxiN1w0xrVXayZ1iKJcW6s6Xm2nG0kLVzdKOBQD_laH0nOc-HCfPpE1A",
          appId: "1:788032758756:ios:075319c57b42bd21a15df1",
          messagingSenderId: "788032758756",
          projectId: "nite-nite-6b069"
      )
  );

  runApp(const NiteNiteApp());
}

class NiteNiteApp extends StatelessWidget {
  const NiteNiteApp({super.key});

  @override
  Widget build(BuildContext context) {

    App.theme = mainTheme;
    var screenRouter = ScreenRouter();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: screenRouter.generateRoute,
      onUnknownRoute: screenRouter.unknownRoute,
      theme: themeData,
      initialRoute: '/',
    );
  }
}
