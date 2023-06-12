import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/controllers/root_controller.dart';
import 'package:nitenite/helpers/utils.dart';
import 'package:nitenite/screens/audio/audio_screen.dart';
import 'package:nitenite/screens/home/home_screen.dart';
import 'package:nitenite/screens/profile/profile_screen.dart';
import 'package:nitenite/screens/stories/stories_screen.dart';
import 'package:nitenite/widgets/playing/playing_now_widget.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {

  final RootController _rootController = Get.put(RootController());
  late AnimationController _backgroundAnimationController;
  late Animation<Offset> _offset;

  @override
  void initState() {
    _backgroundAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this
    );
    _offset = Tween<Offset>(begin: Offset.zero, end: Offset.zero)
        .animate(_backgroundAnimationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      extendBody: true,
      body: Stack(
          fit: StackFit.expand,
          children: [
            SlideTransition(
              position: _offset,
              child: FractionallySizedBox(
                widthFactor: 3.5,
                child: Image.asset("assets/images/background2.png", fit: BoxFit.cover),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: buildGradient(App.theme.colors.primary),
              ),
            ),
            PageView(
              controller: _rootController.tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                AudioListScreen(),
                StoriesScreen(),
                ProfileScreen(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            navigationBarTheme: NavigationBarTheme.of(context).copyWith(
              indicatorColor: App.theme.colors.secondary.withOpacity(0.5),
              labelTextStyle: MaterialStatePropertyAll(App.theme.styles.body5.copyWith(color: App.theme.colors.secondary))
            ),
          ),
          child: NavigationBar(
            selectedIndex: _rootController.getCurrentTab(),
            elevation: 0,
            onDestinationSelected: (index) {
              if (index != _rootController.tabIndex.value) {
                _backgroundAnimationController.reset();
                _offset = Tween<Offset>(
                    begin: Offset(_rootController.tabIndex.value*(-.25), 0),
                    end: Offset(index*(-.25), 0)
                ).animate(_backgroundAnimationController);
                _backgroundAnimationController.forward();
              }
              _rootController.selectTab(index);
            },
            animationDuration: Duration(milliseconds: 500),
            backgroundColor: App.theme.colors.bottomBar.withOpacity(0.7),
            destinations: [
              _bottomNavigationBarItem(0, icon: Icons.home, label: "Home"),
              _bottomNavigationBarItem(1, icon: Icons.music_note, label: "Music & Sound"),
              _bottomNavigationBarItem(2, icon: Icons.surround_sound, label: "Stories"),
              _bottomNavigationBarItem(3, icon: Icons.person, label: "Profile")
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: PlayingNowWidget(parentContext: context),
      ),
    );
  }

  NavigationDestination _bottomNavigationBarItem(int index, {required IconData icon, required String label}) {
    return NavigationDestination(
      icon: Badge(
        isLabelVisible: false,
        child: Icon(icon, color: App.theme.colors.secondary.withOpacity(0.5))
      ),
      label: label,
      selectedIcon: Icon(icon, color: App.theme.colors.secondary),
    );
  }
}