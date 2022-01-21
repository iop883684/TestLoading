
import 'package:flutter/material.dart';
import 'package:untitled2/RegisterScreen.dart';

import 'HomeScreen.dart';
import 'MainPage.dart';


class TabNavigatorRoutes {
  static const String root = '/';
  static const String more = '/more';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key key, this.navigatorKey, this.tabItem, this.action, }) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  final Function action;

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute<void>(builder: (context) => routeBuilders[routeSettings.name](context));
      },
    );
  }


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => _retrieveRoot(),
      TabNavigatorRoutes.more: (context) => _retrieveRoot()
    };
  }

  Widget _retrieveRoot() {
    switch(tabItem) {
      case TabItem.home: return HomeScreen();
      case TabItem.profile: return RegisterScreen();
      default: return HomeScreen();
    }
  }
}
