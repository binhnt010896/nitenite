import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/widgets/appbars/tab_appbar.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/widgets/asset_list/asset_horizontal_list_tile.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key}) : super(key: key);

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {

  final PlayingController _playingController = Get.put(PlayingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: TabAppBar(
        title: "Stories",
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
