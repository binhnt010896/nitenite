import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/data/mock/music_list.dart';
import 'package:nitenite/data/mock/now_playing_list.dart';
import 'package:nitenite/data/mock/sound_list.dart';
import 'package:nitenite/helpers/utils.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/models/playlist.dart';

const CURRENT_PLAYLIST_NAME = "Unsaved Playlist";

class PlayingController extends GetxController {

  /// Variables
  var nowPlayingWidgetOffset = Offset(0, 0).obs;
  var nowPlaying = mockNowPlayingList.map((e) => Asset.fromJson(e)).obs;

  var allMusic = mockMusicList.map((e) => Asset.fromJson(e)).obs;
  var allSounds = mockSoundList.map((e) => Asset.fromJson(e)).obs;

  var isPlaying = false.obs;
  var currentPlayListName = CURRENT_PLAYLIST_NAME.obs;
  final audioPlayer = AudioPlayer();

  /// Methods
  /// Play or pause current audios
  playPause(bool shouldPlay) {
    for (Asset  audio in nowPlaying.value) {
      if (shouldPlay) {
        audio.player.resume();
      } else {
        audio.player.pause();
      }
    }
    isPlaying(shouldPlay);
    isPlaying.refresh();
  }

  /// Turn up or down the volume of a single  audio
  setVolumeSingleAudio(Asset item, double newVolume) {
    if (nowPlaying.value.where((e) => e.id == item.id).isNotEmpty) {
      nowPlaying.update((list) {
        list?.firstWhere((e) => e.id == item.id).volume = newVolume;
      });
      item.player.setVolume(newVolume);
    }
  }

  getItemById(String id) => nowPlaying.value.firstWhere((item) => item.id == id);

  hideNowPlaying() => nowPlayingWidgetOffset(Offset(0, 5));
  showNowPlaying() => nowPlayingWidgetOffset(Offset(0, 0));

  List<Asset> getNowPlayingData([Type? type]) {
    if (type != null) {
      return nowPlaying.value.where((asset) => asset.type == type).toList();
    }
    return nowPlaying.value.toList();
  }

  isInCurrentPlaylist(Asset item) => nowPlaying.value.map((e) => e.id).contains(item.id);
  addToCurrentPlaylist(Asset item) {
    int maxPlayingAsset = getMaxPlayingAsset(item.type);
    if (getNowPlayingData(item.type).length >= maxPlayingAsset) {
      showToast("You have reached the maximum amount of ${getAssetTypeString(item.type)} allowed in one playlist.");
      return;
    }
    nowPlaying([...nowPlaying.value, item]);
    currentPlayListName(CURRENT_PLAYLIST_NAME);
    playPause(true);
  }

  Asset removeFromCurrentPlaylist(Asset item) {
    var _tempPlayingSound = nowPlaying.value.toList();
    _tempPlayingSound.removeWhere((e) => e.id == item.id);
    nowPlaying(_tempPlayingSound);
    item.player.stop();
    if (nowPlaying.value.isEmpty) {
      playPause(false);
    }
    currentPlayListName(CURRENT_PLAYLIST_NAME);
    return item;
  }

  getMaxPlayingAsset(Type type) {
   if (type == Type.MUSIC) return MAX_PLAYING_MUSIC;
   if (type == Type.SOUND) return MAX_PLAYING_SOUND;
   return 0;
  }

  getAllData(Type type) {
    if (type == Type.SOUND) return allSounds.value;
    if (type == Type.MUSIC) return allMusic.value;
  }

  playPlaylist(Playlist _playlist) {
    playPause(false);
    nowPlaying(_playlist.items);
    currentPlayListName(_playlist.name);
    if (!isPlaying.value) {
      playPause(true);
    }
  }

  AnimationController animationController(TickerProvider tickerProvider) => AnimationController(
    duration: const Duration(milliseconds: 400),
    value: isPlaying.value ? 1 : 0,
    vsync: tickerProvider,
  );
}