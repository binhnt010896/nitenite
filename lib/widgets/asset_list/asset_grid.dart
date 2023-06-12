import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/asset_list/asset_grid_item.dart';

class AssetGrid extends StatefulWidget {

  final Type assetType;

  const AssetGrid({Key? key, required this.assetType}) : super(key: key);

  @override
  State<AssetGrid> createState() => _AssetGridState();
}

class _AssetGridState extends State<AssetGrid> with AutomaticKeepAliveClientMixin<AssetGrid> {

  final PlayingController _playingController = Get.put(PlayingController());

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery
        .of(context)
        .size;
    return Obx(() => SizedBox(
        height: size.height - 120,
        child: CustomScrollView(
          primary: false,
          cacheExtent: 9999,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  for (Asset item in _playingController.getAllData(widget.assetType))
                    AssetGridItem(asset: item),
                ],
              ),
            ),
            /// Padding bottom to avoid overflow
            SliverToBoxAdapter(
              child: SizedBox(height: 180),
            )
          ],
        ),
      )
    );
  }

  @override
  bool get wantKeepAlive => true;
}
