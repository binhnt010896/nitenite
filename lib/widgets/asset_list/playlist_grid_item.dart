import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/helpers/image.dart';

class PlaylistGridItem extends StatelessWidget {

  final String title;
  final String image;
  final VoidCallback onPressed;

  const PlaylistGridItem({Key? key, required this.title, required this.image, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width/2,
      width: size.width,
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Opacity(
                  opacity: 0.8,
                  child: getNetworkImage(image, width: size.width/2, height: size.width, fit: BoxFit.cover),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: App.theme.colors.primary.withOpacity(0.5),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              alignment: Alignment.center,
              child: Text(title, style: App.theme.styles.subTitle2.copyWith(color: App.theme.colors.text2), textAlign: TextAlign.center)
            ),
          ],
        ),
      ),
    );
  }
}
