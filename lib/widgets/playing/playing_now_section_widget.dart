import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/playing/playing_tile_widget.dart';

class NowPlayingSectionWidget extends StatefulWidget {
  final Type assetType;
  final int maxPlaying;
  const NowPlayingSectionWidget({Key? key, required this.assetType, required this.maxPlaying}) : super(key: key);

  @override
  State<NowPlayingSectionWidget> createState() => _NowPlayingSectionWidgetState();
}

class _NowPlayingSectionWidgetState extends State<NowPlayingSectionWidget> {

  final PlayingController _playingController = Get.put(PlayingController());
  final listKeys = {
    MUSIC:  GlobalKey<AnimatedListState>(),
    SOUND: GlobalKey<AnimatedListState>(),
  };
  late Map initalListLength;

  @override
  void initState() {
    initalListLength = {
      Type.MUSIC: _playingController.getNowPlayingData(widget.assetType).length,
      Type.SOUND: _playingController.getNowPlayingData(widget.assetType).length
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_playingController.getNowPlayingData(widget.assetType).isEmpty) return Container();
    return Obx(() => Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 16),
            child: Text("${widget.assetType.toString().toUpperCase()}: ${_playingController.getNowPlayingData(widget.assetType).length}/${widget.maxPlaying}"),
          ),
          AnimatedList(
            key: listKeys[widget.assetType],
            shrinkWrap: true,
            initialItemCount: initalListLength[widget.assetType],
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index, animation) {
              return PlayingTileWidget(
                animation: animation,
                index: index,
                onRemove: (_index) {
                  final _removedItem = _playingController.removeFromCurrentPlaylist(_playingController.getNowPlayingData(widget.assetType)[_index]);
                  listKeys[widget.assetType]?.currentState?.removeItem(
                      _index,
                    (context, animation) => PlayingTileWidget(
                      item: _removedItem,
                      index: _index,
                      animation: animation,
                      onRemove: (i) {},
                    )
                  );
                },
                item: _playingController.getNowPlayingData(widget.assetType)[index]
              );
            },
          )
        ],
      ),
    ));
  }
}
