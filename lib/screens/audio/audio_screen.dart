import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/screens/audio/music_screen.dart';
import 'package:nitenite/screens/audio/sound_screen.dart';
import 'package:nitenite/widgets/appbars/tab_appbar.dart';

class AudioListScreen extends StatefulWidget {
  const AudioListScreen({Key? key}) : super(key: key);

  @override
  State<AudioListScreen> createState() => _AudioListScreenState();
}

class _AudioListScreenState extends State<AudioListScreen> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabAppBar(
        title: "Browse",
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: TabBar(
            controller: _tabController,
            labelStyle: App.theme.styles.subTitle2,
            labelColor: App.theme.colors.text2,
            labelPadding: EdgeInsets.symmetric(vertical: 8),
            unselectedLabelColor: App.theme.colors.disabled,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            indicatorColor: App.theme.colors.text2,
            tabs: [
              Text("Sounds"),
              Text("Music"),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      body: TabBarView(
        controller: _tabController,
        children: [
          SoundScreen(),
          MusicScreen(),
        ],
      ),
    );
  }
}
