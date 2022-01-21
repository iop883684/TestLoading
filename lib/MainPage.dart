import 'dart:io';

import 'package:flutter/material.dart';

import 'Bottom.dart';
import 'NavigatorTab.dart';

enum TabItem { home, estimation, loan, notification, profile }

const Map<TabItem, String> tabName = {
  TabItem.home: 'tab_home',
  TabItem.estimation: 'tab_estimation',
  TabItem.loan: 'tab_loan',
  TabItem.notification: 'tab_notification',
  TabItem.profile: 'tab_profile',
};

Map<TabItem, GlobalKey<NavigatorState>> navKeys = {
  TabItem.home: GlobalKey<NavigatorState>(),
  TabItem.estimation: GlobalKey<NavigatorState>(),
  TabItem.loan: GlobalKey<NavigatorState>(),
  TabItem.notification: GlobalKey<NavigatorState>(),
  TabItem.profile: GlobalKey<NavigatorState>(),
};


class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);


  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {

  AnimationController _controller;
  PageController pageController;
  var _currentTab = TabItem.home;

  @override
  void initState() {
    super.initState();


    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    pageController = PageController(initialPage: 0);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      // initFcm();
      // getAppData().getAppParamInitial();

    });


  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      navKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      _onTabTapped(tabItem);
    }
  }

  void _onTabTapped(TabItem tabItem) {
    this.pageController.jumpToPage(tabItem.index);
  }


  @override
  void dispose() {
    _controller.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent,));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigation(currentTab: _currentTab, onSelectTab: _selectTab, animationController: _controller,),
      body: PageView(
        onPageChanged: _onPageChanged,
        controller: pageController,
        physics: NeverScrollableScrollPhysics(), // ClampingScrollPhysics(),
        children: [
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.profile),
        ],
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return TabNavigator(
      navigatorKey: navKeys[tabItem],
      tabItem: tabItem,
    );
  }



  void _onPageChanged(int page) {setState(() {this._currentTab = TabItem.values[page];});}


}
