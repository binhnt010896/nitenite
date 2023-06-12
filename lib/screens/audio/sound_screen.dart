import 'package:flutter/material.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/asset_list/asset_grid.dart';

class SoundScreen extends StatefulWidget {
  const SoundScreen({Key? key}) : super(key: key);

  @override
  State<SoundScreen> createState() => _SoundScreenState();
}

class _SoundScreenState extends State<SoundScreen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AssetGrid(assetType: Type.SOUND)
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
