import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/buttons/appbar_button.dart';
import 'package:nitenite/widgets/playing/playing_now_section_widget.dart';

class PlayingNowScreen extends StatefulWidget {
  const PlayingNowScreen({Key? key}) : super(key: key);

  @override
  State<PlayingNowScreen> createState() => _PlayingNowScreenState();
}

class _PlayingNowScreenState extends State<PlayingNowScreen> {

  final PlayingController _playingController = Get.put(PlayingController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        buildHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: _playingController.getNowPlayingData().isNotEmpty ? Column(
              children: [
                NowPlayingSectionWidget(assetType: Type.SOUND, maxPlaying: MAX_PLAYING_SOUND),
                NowPlayingSectionWidget(assetType: Type.MUSIC, maxPlaying: MAX_PLAYING_MUSIC),
              ],
            ) : SizedBox(
              height: MediaQuery.of(context).size.height/1.5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.filter_list_off, size: 120, color: App.theme.colors.primary),
                    SizedBox(height: 16),
                    Text("You're not selecting any sound.\nPlease add some music and sound to the playlist.", textAlign: TextAlign.center, style: App.theme.styles.subTitle7),
                    SizedBox(height: 16),
                    MaterialButton(
                      color: App.theme.colors.primary,
                      padding: EdgeInsets.symmetric(horizontal: 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: () => Get.back(),
                      child: Text("Add sounds", style: App.theme.styles.button2.copyWith(color: App.theme.colors.text2)),
                    )
                  ],
                ),
              ),
            )),
        ),
      ],
    ),
    );
  }

  Widget buildHeader() {
    return ListTile(
      title: Center(child: Text(_playingController.currentPlayListName.value ?? "-")),
      horizontalTitleGap: -24,
      leading: AppbarButton(
        icon: Icon(Icons.keyboard_arrow_down_outlined, color: App.theme.colors.appBar),
        onPress: () => Get.back(),
      ),
    );
  }
}
