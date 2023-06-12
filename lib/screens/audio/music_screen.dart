import 'package:flutter/material.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/asset_list/asset_grid.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssetGrid(assetType: Type.MUSIC)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
