
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {Key key, this.currentTab, this.onSelectTab, this.animationController})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final AnimationController animationController;

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Remove temporary because of iOS bug navigation bar
    // return SizedBox(
    //     height: UIHelper.bottomNavigationBarHeight,
    //     child:
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        currentIndex: widget.currentTab.index,
        onTap: (index) => {
          // if (widget.currentTab.index != 3 && index == 3) { //For case click notification but notification list isn't reloaded
          //   _unreadNotificationBloc.fetchData()
          // },
          widget.onSelectTab(TabItem.values[index]),
        },
        items: _imageBottomBar() );
  }


  List<BottomNavigationBarItem> _imageBottomBar() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Trang chủ',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.map),
        label: 'Home',
      ),
    ];
  }


}
