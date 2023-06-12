import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/helpers/image.dart';
import 'package:nitenite/models/asset.dart';

class AssetGridItem extends StatelessWidget {

  final Asset asset;

  const AssetGridItem({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayingController _playingController = Get.put(PlayingController());
    Size size = MediaQuery.of(context).size;
    return Obx(() => SizedBox(
      height: size.width/2,
      width: size.width/2,
      child: GestureDetector(
        onTap: () {
          if (_playingController.isInCurrentPlaylist(asset)) {
            _playingController.removeFromCurrentPlaylist(asset);
          } else {
            _playingController.addToCurrentPlaylist(asset);
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Opacity(
                opacity: 0.8,
                child: getNetworkImage(asset.image, width: size.width/2, height: size.width/2, fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: App.theme.colors.primary.withOpacity(0.5),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: Text(asset.name, style: App.theme.styles.subTitle2.copyWith(color: App.theme.colors.text2), textAlign: TextAlign.center,),
            ),
            if (_playingController.isInCurrentPlaylist(asset))
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.queue_music, color: App.theme.colors.success, size: 28),
              )
          ],
        ),
      ),
    ));
  }
}
