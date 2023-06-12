import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/helpers/image.dart';
import 'package:nitenite/models/asset.dart';

class PlayingTileWidget extends StatefulWidget {
  const PlayingTileWidget({Key? key, required this.item, required this.index, required this.animation, required this.onRemove}) : super(key: key);

  final Asset item;
  final int index;
  final ValueChanged<int> onRemove;
  final Animation<double> animation;

  @override
  State<PlayingTileWidget> createState() => _PlayingTileWidgetState();
}

class _PlayingTileWidgetState extends State<PlayingTileWidget> {

  final PlayingController _playingController = Get.put(PlayingController());

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      key: ValueKey(widget.item.image),
      sizeFactor: widget.animation,
      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(widget.item.name),
        ),
        leading: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: getNetworkImage(
                  widget.item.image,
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outlined, color: App.theme.colors.error),
          onPressed: () {
            widget.onRemove(widget.index);
          },
        ),
        visualDensity: VisualDensity(vertical: 4),
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        subtitle: Slider.adaptive(
          value: widget.item.volume ?? 0.5,
          max: 1,
          min: 0,
          activeColor: App.theme.colors.secondary,
          onChanged: (value) {
            _playingController.setVolumeSingleAudio(widget.item, value);
          },
        ),
      ),
    );
  }
}
