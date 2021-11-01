// import 'package:bottom_nav_bar/persistent-tab-view.dart';

import 'package:cowin_1/common/config/colors_config.dart';
import 'package:cowin_1/common/config/texts_config.dart';
import 'package:cowin_1/common/constants/tools.dart';
import 'package:cowin_1/views/chat/chat_screen.dart';
import 'package:cowin_1/views/healthcare/healthcare_screen.dart';
import 'package:cowin_1/views/login/profile_screen.dart';
import 'package:cowin_1/views/map/map_screen.dart';
import 'package:cowin_1/views/news/news_screen.dart';
import 'package:cowin_1/views/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/flutter_template.dart';

import 'home/home_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<MainScreen> {
  int currentTab = 0;
  List<Widget> _options = <Widget>[
    HomePage(),
    NewsScreen(),
    HealthCareScreen(),
    MapScreen(),
    PersonalScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 0
            ? SvgPicture.asset(
                Tools().getIcon("home.svg"),
                color: cwColor5,
              )
            : SvgPicture.asset(
                Tools().getIcon("home.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: cwColor5,
        title: ('Home'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 1
            ? SvgPicture.asset(
                Tools().getIcon("news.svg"),
                color: cwColor5,
              )
            : SvgPicture.asset(
                Tools().getIcon("news.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: cwColor5,
        title: ('News'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: SvgPicture.asset(
          Tools().getIcon("healthcare.svg"),
          color: cwColor2,
        ),
        activeColorPrimary: cwColor5,
        title: ('Healthcare'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 3
            ? SvgPicture.asset(
                Tools().getIcon("map.svg"),
                color: cwColor5,
              )
            : SvgPicture.asset(
                Tools().getIcon("map.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: cwColor5,
        title: ('Map'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 4
            ? SvgPicture.asset(
                Tools().getIcon("profile.svg"),
                color: cwColor5,
              )
            : SvgPicture.asset(
                Tools().getIcon("profile.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: cwColor5,
        title: ('Profile'),
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        this.context,
        controller: _controller,
        screens: _options,
        navBarHeight: 95.h,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style19,
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          child: Center(
            child: Icon(Icons.chat,color: cwColor2,),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
        ),
      ),
    );
  }
}
