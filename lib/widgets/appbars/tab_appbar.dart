import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';

class TabAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TabAppBar({Key? key, this.bottom, this.title = "", this.actions = const []}) : super(key: key);

  final String title;
  final PreferredSize? bottom;
  final List<Widget> actions;

  @override
  State<TabAppBar> createState() => _TabAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 100);
}

class _TabAppBarState extends State<TabAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: AppBar(
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        actions: widget.actions,
        title: Text(widget.title, style: App.theme.styles.title1),
        bottom: widget.bottom,
      ),
    );
  }
}
