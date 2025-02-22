// import 'package:bottom_nav_bar/persistent-tab-view.dart';

import 'package:cowin_1/common/config/colors_config.dart';
import 'package:cowin_1/common/config/texts_config.dart';
import 'package:cowin_1/common/constants/tools.dart';
import 'package:cowin_1/view_models/app/app_provider.dart';
import 'package:cowin_1/views/map/map_screen.dart';
import 'package:cowin_1/views/profile/profile_screen.dart';
import 'package:cowin_1/views/vaccination/vaccination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modules/flutter_modules.dart';

import 'chat/chatbot_screen.dart';
import 'home/home_screen.dart';
import 'news/news_remake/screen_news.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  List<Widget> _options = <Widget>[
    HomePage(),
    NewRemakeScreen(),
    //HealthCareScreen(),
    DataCovidScreen(),
    MapScreen(),
    PersonalScreen(),
    //DataCovidScreen(),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 0
            ? SvgPicture.asset(
                Tools().getIcon("home.svg"),
                color: primaryColor,
              )
            : SvgPicture.asset(
                Tools().getIcon("home.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: primaryColor,
        title: ('Home'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 1
            ? SvgPicture.asset(
                Tools().getIcon("news.svg"),
                color: primaryColor,
              )
            : SvgPicture.asset(
                Tools().getIcon("news.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: primaryColor,
        title: ('News'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: SvgPicture.asset(
          Tools().getIcon("healthcare.svg"),
          color: cwColor2,
        ),
        activeColorPrimary: primaryColor,
        title: ('statistical'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 3
            ? SvgPicture.asset(
                Tools().getIcon("map.svg"),
                color: primaryColor,
              )
            : SvgPicture.asset(
                Tools().getIcon("map.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: primaryColor,
        title: ('Map'),
      ),
      PersistentBottomNavBarItem(
        textStyle: kText14Normal_4,
        icon: _controller.index == 4
            ? SvgPicture.asset(
                Tools().getIcon("profile.svg"),
                color: primaryColor,
              )
            : SvgPicture.asset(
                Tools().getIcon("profile.svg"),
                color: cwColor4,
              ),
        activeColorPrimary: primaryColor,
        title: ('Profile'),
      ),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  @override
  void initState() {
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
    var appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: PersistentTabView(
        this.context,
        controller: _controller,
        screens: _options,
        navBarHeight: 95.h,
        hideNavigationBar: appProvider.hideNavBar,
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
        child: _controller.index != 3 || appProvider.hideNavBar
            ? FloatingActionButton(
              backgroundColor: primaryColor,
                child: Center(
                  child: Icon(
                    Icons.chat,
                    color: cwColor2,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatBotScreen()));
                },
              )
            : Container(),
      ),
    );
  }
}
