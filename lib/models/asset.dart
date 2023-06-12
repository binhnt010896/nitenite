import 'package:audioplayers/audioplayers.dart';

enum Type {
  SOUND,
  MUSIC
}
/// Constants
const SOUND = 'sound';
const MUSIC = 'music';

class Asset {
  final String id;
  final String name;
  final String image;
  late double? volume;
  final double defaultVolume;
  final String url;
  final AudioPlayer player;
  final Type type;

  Asset({
    required this.id,
    required this.name,
    required this.image,
    required this.volume,
    required this.defaultVolume,
    required this.url,
    required this.player,
    required this.type
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    final player = AudioPlayer(playerId: json['id']);
    player.setSourceUrl(json['url']);
    player.setVolume(json['defaultVolume']);
    player.setPlayerMode(PlayerMode.mediaPlayer);
    player.setReleaseMode(ReleaseMode.loop);

    return Asset(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      volume: (json['volume'] as num?)?.toDouble(),
      defaultVolume: (json['defaultVolume'] as num).toDouble(),
      url: json['url'] as String,
      player: player,
      type: json['type'] == MUSIC ? Type.MUSIC : Type.SOUND
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'image': image,
    'volume': volume,
    'defaultVolume': defaultVolume,
    'url': url,
  };

  updateVolume(double newVolume) {
    volume = newVolume;
  }
}