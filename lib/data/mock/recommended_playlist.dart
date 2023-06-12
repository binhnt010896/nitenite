import 'package:nitenite/data/mock/music_list.dart';
import 'package:nitenite/data/mock/sound_list.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/models/playlist.dart';

final mockRecommendedPlaylists = [
  Playlist(
      name: "By The Beach",
      image: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
      items: [
        Asset.fromJson(mockMusicList[8]),
        Asset.fromJson(mockSoundList[8]),
        Asset.fromJson(mockSoundList[10]),
        Asset.fromJson(mockSoundList[14]),
      ]
  ),
  Playlist(
      name: "A Walk In The Woods",
      image: "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
      items: [
        Asset.fromJson(mockMusicList[5]),
        Asset.fromJson(mockSoundList[0]),
        Asset.fromJson(mockSoundList[1]),
        Asset.fromJson(mockSoundList[17]),
      ]
  ),
  Playlist(
      name: "The Valley Of Tranquility",
      image: "https://images.unsplash.com/photo-1659735898324-7314e6f00490?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
      items: [
        Asset.fromJson(mockMusicList[7]),
        Asset.fromJson(mockSoundList[0]),
        Asset.fromJson(mockSoundList[13]),
        Asset.fromJson(mockSoundList[15]),
        Asset.fromJson(mockSoundList[17]),
      ]
  ),
  Playlist(
      name: "Rainy Night",
      image: "https://images.unsplash.com/photo-1518182170546-07661fd94144?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
      items: [
        Asset.fromJson(mockMusicList[4]),
        Asset.fromJson(mockSoundList[3]),
        Asset.fromJson(mockSoundList[7]),
        Asset.fromJson(mockSoundList[11]),
      ]
  ),
  Playlist(
      name: "A Coffee Shop",
      image: "https://images.unsplash.com/photo-1445116572660-236099ec97a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
      items: [
        Asset.fromJson(mockMusicList[1]),
        Asset.fromJson(mockSoundList[2]),
        Asset.fromJson(mockSoundList[5]),
        Asset.fromJson(mockSoundList[6]),
        Asset.fromJson(mockSoundList[16]),
      ]
  ),
];
