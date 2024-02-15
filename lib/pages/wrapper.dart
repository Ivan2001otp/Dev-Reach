import 'package:code_dev_reach/pages/home.dart';
import 'package:code_dev_reach/pages/profile.dart';
import 'package:code_dev_reach/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Constant/file.url.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperPageState();
}

class _WrapperPageState extends State<Wrapper> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final _buildBody = const <Widget>[
    HomePage(),
    SettingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white54,
      body: _buildBody[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Constant.homeIcon),
              label: 'Home',
              activeIcon: SvgPicture.asset(
                Constant.homeIcon,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Constant.settingsIcon,
                height: 28,
                width: 28,
              ),
              label: 'Setting',
              activeIcon: SvgPicture.asset(
                Constant.settingsIcon,
                height: 28,
                width: 28,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Constant.profileIcon),
              label: 'Profile',
              activeIcon: SvgPicture.asset(
                Constant.profileIcon,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            )
          ]),
    );
  }
}
