import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotity_clon_rebust_test/home/page.dart';

import '../credits/page.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      backgroundColor: Colors.black,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomePage(),
      Credits(),
    ];
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getAppBar() {
    if (pageIndex == 0) {
      return AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text("Explore", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
      );
    }else if (pageIndex == 1) {
      return AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Text("Credits", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        ),
      );
    }
  }

  Widget getFooter() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Colors.white.withOpacity(0.3),
        backgroundColor: Colors.black,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)
        )
      ),
      child: NavigationBar(
        selectedIndex: pageIndex,
        onDestinationSelected: (index) =>
          setState(() => this.pageIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            selectedIcon: Icon(
              Icons.info,
              color: Colors.white,
            ),
            label: "Credits",
          )
        ],
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

}
