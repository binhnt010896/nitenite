import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const Bold = FontWeight.w700;
const SemiBold = FontWeight.w600;
const Medium = FontWeight.w500;
const Regular = FontWeight.w400;

class App {
  static late Themes theme;
}

class Themes {
  final Colours colors;
  final TextStyles styles = TextStyles();
  final String suffix;

  Themes({required this.colors, required this.suffix});

  SvgPicture getSvgAsset(String name,
      {double? width,
        double? height,
        Color? color,
        Alignment? alignment,
        Key? key,
        BoxFit fit = BoxFit.contain}) =>
      SvgPicture.asset(
        'assets/images/$name$suffix.svg',
        width: width,
        height: height,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        key: key,
        color: color,
      );
}

class Colours {
  final Color primary,
      secondary,
      surface,
      border,
      appBar,
      banner,
      card,
      modelSheet,
      bottomBar,
      background,
      background2,
      selectedItemBackground,
      error,
      pending,
      success,
      done,
      text1,
      text2,
      text3,
      text4,
      text5,
      disabled,
      divider,
      divider2,
      button1,
      button2,
      button3,
      button4,
      gradientStart1,
      gradientEnd1,
      separatorColor,
      shadow,
      green,
      selectedChip;

  Colours({
    required this.shadow,
    required this.primary,
    required this.secondary,
    required this.surface,
    required this.border,
    required this.banner,
    required this.divider2,
    required this.card,
    required this.modelSheet,
    required this.bottomBar,
    required this.appBar,
    required this.background,
    required this.background2,
    required this.selectedItemBackground,
    required this.error,
    required this.success,
    required this.done,
    required this.pending,
    required this.gradientStart1,
    required this.gradientEnd1,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.disabled,
    required this.button1,
    required this.button2,
    required this.button3,
    required this.button4,
    required this.divider,
    required this.separatorColor,
    required this.green,
    required this.selectedChip,
  });
}

class TextStyles {
  final TextStyle title1,
      title2,
      title3,
      title4,
      title5,
      title6,
      title7,
      subTitle1,
      subTitle2,
      subTitle3,
      subTitle4,
      subTitle5,
      subTitle6,
      subTitle7,
      subTitle8,
      body1,
      body2,
      body3,
      body4,
      body5,
      body6,
      body7,
      button1,
      button2,
      button3,
      button4,
      bottomLabel1;

  TextStyles({
    this.title1 = const TextStyle(fontWeight: Bold, fontSize: 34, height: 1.2),
    this.title2 = const TextStyle(fontWeight: Bold, fontSize: 24, height: 1.2),
    this.title3 = const TextStyle(fontWeight: Bold, fontSize: 22, height: 1.2),
    this.title4 = const TextStyle(fontWeight: Bold, fontSize: 20, height: 1.2),
    this.title5 = const TextStyle(fontWeight: Bold, fontSize: 18, height: 1.2),
    this.title6 = const TextStyle(fontWeight: Bold, fontSize: 14, height: 1.2),
    this.title7 = const TextStyle(fontWeight: Bold, fontSize: 12, height: 1.2),
    this.subTitle1 =
    const TextStyle(fontWeight: Medium, fontSize: 25, height: 1.2),
    this.subTitle2 =
    const TextStyle(fontWeight: Medium, fontSize: 20, height: 1.2),
    this.subTitle3 =
    const TextStyle(fontWeight: Medium, fontSize: 18, height: 1.2),
    this.subTitle4 =
    const TextStyle(fontWeight: Medium, fontSize: 17, height: 1.2),
    this.subTitle5 =
    const TextStyle(fontWeight: Medium, fontSize: 16, height: 1.2),
    this.subTitle6 =
    const TextStyle(fontWeight: Medium, fontSize: 15, height: 1.2),
    this.subTitle7 =
    const TextStyle(fontWeight: Medium, fontSize: 14, height: 1.2),
    this.subTitle8 =
    const TextStyle(fontWeight: Medium, fontSize: 12, height: 1.2),
    this.body1 =
    const TextStyle(fontWeight: Regular, fontSize: 17, height: 1.2),
    this.body2 =
    const TextStyle(fontWeight: Regular, fontSize: 16, height: 1.2),
    this.body3 =
    const TextStyle(fontWeight: Regular, fontSize: 15, height: 1.2),
    this.body4 =
    const TextStyle(fontWeight: Regular, fontSize: 14, height: 1.2),
    this.body5 =
    const TextStyle(fontWeight: Regular, fontSize: 12, height: 1.2),
    this.body6 =
    const TextStyle(fontWeight: Regular, fontSize: 10, height: 1.2),
    this.body7 = const TextStyle(fontWeight: Regular, fontSize: 9, height: 1.2),
    this.button1 =
    const TextStyle(fontWeight: SemiBold, fontSize: 16, height: 1.2),
    this.button2 =
    const TextStyle(fontWeight: SemiBold, fontSize: 14, height: 1.2),
    this.button3 =
    const TextStyle(fontWeight: SemiBold, fontSize: 11, height: 1.2),
    this.button4 =
    const TextStyle(fontWeight: SemiBold, fontSize: 11, height: 1.2),
    this.bottomLabel1 =
    const TextStyle(fontWeight: Regular, fontSize: 11, height: 1.2),
  });
}

final MAX_PLAYING_SOUND = 10;
final MAX_PLAYING_MUSIC = 1;