import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nitenite/helpers/image.dart';
import 'package:nitenite/models/asset.dart';

class HorizontalListTile extends StatefulWidget {

  final List<Asset> assetList;

  const HorizontalListTile({Key? key, required this.assetList}) : super(key: key);

  @override
  State<HorizontalListTile> createState() => _HorizontalListTileState();
}

class _HorizontalListTileState extends State<HorizontalListTile> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
        items: widget.assetList.where((e) => widget.assetList.indexOf(e) % 2 == 0).map((item) {
          return Column(
            children: [
              _buildItem(item),
              if (widget.assetList.indexOf(item)+1 < widget.assetList.length)
                _buildItem(widget.assetList[widget.assetList.indexOf(item)+1])
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItem(Asset item) {
    return SizedBox(
      height: 70,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: getNetworkImage(item.image, width: 60, height: 70, fit: BoxFit.cover),
        ),
        title: Text(item.name),
        subtitle: Text("100 plays"),
      ),
    );
  }
}
