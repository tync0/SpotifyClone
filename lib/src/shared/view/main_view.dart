import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/shared/widget/svg_picture.dart';

import '../../utils/contants/svg_const.dart';

@RoutePage()
class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          SearchRoute(),
          LibraryRoute(),
        ],
        extendBody: true,
        bottomNavigationBuilder: (_, tabsRouter) {
          return Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
            ),
            child: Container(
              color: Colors.black.withOpacity(0.5),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BottomNavigationBar(
                backgroundColor: Colors.black.withOpacity(0.5),
                unselectedItemColor: Colors.grey[600],
                selectedItemColor: Colors.white,
                elevation: 25,
                type: BottomNavigationBarType.fixed,
                unselectedFontSize: 13,
                selectedFontSize: 13,
                currentIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: svgPicture(SvgConst.home),
                    activeIcon: svgPicture(SvgConst.homeFilled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: svgPicture(SvgConst.search),
                    activeIcon: svgPicture(SvgConst.searchFilled),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: svgPicture(SvgConst.library),
                    activeIcon: svgPicture(SvgConst.libraryFilled),
                    label: 'Library',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Padding svgPicture(String assetName) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: SvgPic(
      assetsName: assetName,
      size: 25,
    ),
  );
}
