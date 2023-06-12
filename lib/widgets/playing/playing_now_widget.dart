import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/helpers/image.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/screens/home/playing_now_screen.dart';

class PlayingNowWidget extends StatefulWidget {
  const PlayingNowWidget({Key? key, this.parentContext}) : super(key: key);

  final BuildContext? parentContext;

  @override
  State<PlayingNowWidget> createState() => _PlayingNowWidgetState();
}

class _PlayingNowWidgetState extends State<PlayingNowWidget> with TickerProviderStateMixin {

  late final AnimationController _spinningDiscController = AnimationController(
    duration: const Duration(seconds: 8),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _spinningDiscAnimation = CurvedAnimation(
    parent: _spinningDiscController,
    curve: Curves.linear,
  );

  final PlayingController _playingController = Get.put(PlayingController());

  @override
  dispose() {
    _spinningDiscController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
          onVerticalDragUpdate: (events) {
            if (events.localPosition.dy > 50) {
              _playingController.hideNowPlaying();
            }
          },
          child: PhysicalModel(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            color: App.theme.colors.bottomBar.withOpacity(0.95),
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16)
              ),
              child: ListTile(
                title: Text(_playingController.currentPlayListName.value),
                subtitle: Text("${_playingController.getNowPlayingData(Type.SOUND).length} Sound(s) and ${_playingController.getNowPlayingData(Type.MUSIC).length} Music"),
                leading: RotationTransition(
                  turns: _spinningDiscAnimation,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(56),
                    child: getNetworkImage(
                        "https://images.unsplash.com/photo-1539667547529-84c607280d20?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1461&q=80",
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                visualDensity: VisualDensity(vertical: 3),
                trailing: IconButton(
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
                        color: App.theme.colors.secondary
                    )
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: widget.parentContext ?? context,
                    isScrollControlled: true,
                    backgroundColor: App.theme.colors.primary,
                    enableDrag: false,
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height*0.9,
                      child: PlayingNowScreen(),
                    )
                  );
                },
              ),
            ),
          ),
        ),
    ),
    );
  }
}
