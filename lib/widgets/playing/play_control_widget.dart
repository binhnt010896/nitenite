import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';

class PlayControlWidget extends StatefulWidget {
  const PlayControlWidget({Key? key}) : super(key: key);

  @override
  State<PlayControlWidget> createState() => _PlayControlWidgetState();
}

class _PlayControlWidgetState extends State<PlayControlWidget> with TickerProviderStateMixin {
  final PlayingController _playingController = Get.put(PlayingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: PhysicalModel(
          elevation: 5,
          color: App.theme.colors.background,
          borderRadius: BorderRadius.circular(16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 70,
              width: double.infinity,
              color: App.theme.colors.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.timer, size: 28, color: App.theme.colors.button4),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_playingController.isPlaying.value) {
                        _playingController.animationController(this).reverse();
                      } else {
                        _playingController.animationController(this).forward();
                      }
                      _playingController.playPause(!_playingController.isPlaying.value);
                    },
                    icon: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _playingController.animationController(this),
                        size: 32,
                        color: App.theme.colors.button4
                    )
                  ),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(Icons.playlist_add, size: 28, color: App.theme.colors.button4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
