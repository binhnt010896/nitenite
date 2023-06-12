import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';

class AppbarButton extends StatelessWidget {
  const AppbarButton({Key? key, required this.icon, required this.onPress}) : super(key: key);

  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: App.theme.colors.appBar, width: 2),
        ),
        margin: EdgeInsets.only(left: 16, right: 0, top: 8, bottom: 8),
        child: icon
      ),
    );
  }
}
