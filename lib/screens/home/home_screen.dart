import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/playing_controller.dart';
import 'package:nitenite/data/mock/now_playing_list.dart';
import 'package:nitenite/data/mock/recommended_playlist.dart';
import 'package:nitenite/models/asset.dart';
import 'package:nitenite/models/playlist.dart';
import 'package:nitenite/repositories/services/admob_service.dart';
import 'package:nitenite/widgets/appbars/tab_appbar.dart';
import 'package:nitenite/widgets/asset_list/asset_grid_item.dart';
import 'package:nitenite/widgets/asset_list/asset_horizontal_list_tile.dart';
import 'package:nitenite/widgets/asset_list/playlist_grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    _createBannerAd();
  }

  _createBannerAd() {
    _bannerAd = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: AdMobService.bannerADUnitId!,
      listener: AdMobService.bannerAdListener,
      request: const AdRequest()
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    PlayingController _playingController = Get.put(PlayingController());
    return Scaffold(
      backgroundColor: App.theme.colors.primary.withOpacity(0.2),
      extendBodyBehindAppBar: true,
      appBar: TabAppBar(
        title: "Discover",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Padding top
            SizedBox(height: 90),
            /// Recommended Playlists
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 16),
              child: Text("Playlists you may like 😊", style: App.theme.styles.title4),
            ),
            SizedBox(
              height: 150,
              width: double.infinity,
              child: CarouselSlider(
                  items: [
                    for (Playlist _playlist in mockRecommendedPlaylists)
                      PlaylistGridItem(
                        title: _playlist.name,
                        image: _playlist.image,
                        onPressed: () {
                          _playingController.playPlaylist(_playlist);
                        }
                      ),
                  ],
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                  )
              )
            ),
            /// Most listened to
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
              child: Text("Most listened to", style: App.theme.styles.title4),
            ),
            HorizontalListTile(assetList: mockMostListenedTo.map((e) => Asset.fromJson(e)).toList()),
            _bannerAd == null ? Container() : Container(
              padding: EdgeInsets.only(top: 16),
              height: 68,
              child: AdWidget(ad: _bannerAd!),
            ),
            /// Padding bottom
            SizedBox(height: 180),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
