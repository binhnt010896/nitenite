import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitenite/configs/config.dart';
import 'package:nitenite/helpers/utils.dart';
import 'package:nitenite/widgets/appbars/tab_appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: TabAppBar(
        title: "Profile",
      ),
      extendBodyBehindAppBar: false,
      body: CupertinoTheme(
        data: CupertinoThemeData(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // CupertinoListTile(
              //   leading: CircleAvatar(
              //     child: Image.asset("assets/images/google_logo.png"),
              //   ),
              //   leadingSize: 36,
              //   title: Text("Thanh-Binh", style: App.theme.styles.body1.copyWith(color: App.theme.colors.text2)),
              //   subtitle: Text("thanhbinhpro96@gmail.com", style: App.theme.styles.body4.copyWith(color: App.theme.colors.text2.withOpacity(0.7))),
              // ),
              CupertinoListSection.insetGrouped(
                header: Text('Login / Register', style: App.theme.styles.subTitle2.copyWith(color: App.theme.colors.text2)),
                backgroundColor: Colors.transparent,
                children: <CupertinoListTile>[
                  CupertinoListTile.notched(
                    title: const Text('With Google'),
                    leading: Image.asset("assets/images/google_logo.png"),
                    leadingSize: 24,
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                  CupertinoListTile.notched(
                    title: const Text('With Facebook'),
                    leading: Image.asset("assets/images/facebook_logo.png"),
                    leadingSize: 24,
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                ],
              ),
              CupertinoListSection.insetGrouped(
                header: Text('Personalization', style: App.theme.styles.subTitle2.copyWith(color: App.theme.colors.text2)),
                backgroundColor: Colors.transparent,
                children: <CupertinoListTile>[
                  CupertinoListTile.notched(
                    title: const Text('Change App Background'),
                    leading: Icon(Icons.format_paint),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                ],
              ),
              CupertinoListSection.insetGrouped(
                header: Text('About', style: App.theme.styles.subTitle2.copyWith(color: App.theme.colors.text2)),
                backgroundColor: Colors.transparent,
                children: <CupertinoListTile>[
                  CupertinoListTile.notched(
                    title: const Text('Privacy Policy'),
                    leading: Icon(Icons.policy),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                  CupertinoListTile.notched(
                    title: const Text('Contact Support'),
                    leading: Icon(Icons.contact_support),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                  CupertinoListTile.notched(
                    title: const Text('About Developer'),
                    leading: Icon(Icons.person),
                    trailing: const CupertinoListTileChevron(),
                    onTap: () {

                    }
                  ),
                ],
              ),
              SizedBox(height: 180)
            ],
          ),
        ),
      ),
    );
  }

  Widget _nonAuthScreen() => Column(
    children: [
      FlutterLogo(size: MediaQuery.of(context).size.width*0.4),
      SizedBox(height: 24),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 16),
              Text("Login to sync your favourite playlists across devices.", style: App.theme.styles.subTitle6),
              SizedBox(height: 16),
              _signInButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google_logo.png", height: 24),
                      SizedBox(width: 24),
                      Text("Sign in with Google"),
                    ],
                  ),
                  onPressed: () => debugPrint("ahoho")
              ),
              _signInButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/facebook_logo.png", height: 24),
                      SizedBox(width: 24),
                      Text("Sign in with Facebook"),
                    ],
                  ),
                  onPressed: () => debugPrint("ahoho")
              ),
            ],
          ),
        ),
      ),
    ],
  );

  Widget _signInButton({required Widget child, required Function onPressed}) => Container(
    padding: EdgeInsets.only(bottom: 16),
    width: MediaQuery.of(context).size.width*0.8,
    child: MaterialButton(
      color: App.theme.colors.background,
      padding: EdgeInsets.symmetric(vertical: 12),
      onPressed: () => onPressed(),
      child: child,
    ),
  );
}
