import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nitenite/screens/home/playing_now_screen.dart';
import 'package:nitenite/screens/root.dart';
import 'package:page_route_animator/page_route_animator.dart';

class ScreenRouter {
  Function buildPageRoute(RouteSettings settings) =>
      (Widget child, {fullScreen = false}) => CupertinoPageRoute(
    fullscreenDialog: fullScreen,
    builder: (_) => child,
    settings: settings,
  );

  Function buildAnimatedPageRoute(RouteSettings settings) =>
      (Widget child, {fullScreen = false}) => PageRouteAnimator(
    fullscreenDialog: fullScreen,
    child: child,
    settings: settings,
    routeAnimation: RouteAnimation.bottomToTop,
  );

  Route<dynamic> generateRoute(RouteSettings settings) {
    Function route = buildPageRoute(settings);
    Function animatedRoute = buildAnimatedPageRoute(settings);
    Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/':
        return route(RootScreen());
      case 'playing_now':
        return animatedRoute(PlayingNowScreen());
      default:
        return unknownRoute(settings);
    }
  }

  Route<dynamic> unknownRoute(RouteSettings settings) {
    var unknownRouteText = "No such screen for ${settings.name}";
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(unknownRouteText),
              Padding(padding: const EdgeInsets.all(10.0)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextButton(
                  child: Text("Back"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}