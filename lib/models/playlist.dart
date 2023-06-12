import 'package:nitenite/models/asset.dart';

class Playlist {
  final String name;
  final String image;
  final List<Asset> items;

  Playlist({
    this.name = "Unsaved Playlist",
    this.image = "https://images.unsplash.com/photo-1448697138198-9aa6d0d84bf4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8",
    this.items = const <Asset>[]
  });
}