import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/widgets/buttons/appbar_button.dart';

class DetailAppBar extends StatefulWidget implements PreferredSizeWidget {
  const DetailAppBar({Key? key, this.actions, this.title = ""}) : super(key: key);

  final String title;
  final List<Widget>? actions;

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();

  @override
  Size get preferredSize => Size(double.infinity, 70);
}

class _DetailAppBarState extends State<DetailAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 70),
      child: AppBar(
        elevation: 0,
        title: Text(widget.title, style: App.theme.styles.title5.copyWith(color: App.theme.colors.appBar)),
        backgroundColor: Colors.transparent,
        leading: AppbarButton(
          icon: Icon(Icons.arrow_back_rounded, color: App.theme.colors.appBar),
          onPress: () => Navigator.pop(context),
        ),
        actions: widget.actions ?? [],
      ),
    );
  }
}
