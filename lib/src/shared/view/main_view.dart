import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/config/router/app_router.dart';
import 'package:spotify/src/shared/widget/svg_picture.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';

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
      body: AutoTabsRouter(
        routes: const [
          HomeRoute(),
          SearchRoute(),
          LibraryRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: SafeArea(
              child: child,
            ),
            bottomNavigationBar: Container(
              height: context.dynamicHeight(0.1),
              width: context.mediaQueryWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.5],
                  colors: [
                    Colors.transparent,
                    Colors.black54,
                  ],
                ),
              ),
              padding: const EdgeInsets.only(
                left: 48,
                right: 48,
                top: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomItem(
                    fieldName: 'Home',
                    svgPic: SvgConst.home,
                    isActive: 0 == tabsRouter.activeIndex,
                    svgPicActive: SvgConst.homeFilled,
                    onTap: () => tabsRouter.setActiveIndex(0),
                  ),
                  BottomItem(
                    fieldName: 'Search',
                    svgPic: SvgConst.search,
                    isActive: 1 == tabsRouter.activeIndex,
                    svgPicActive: SvgConst.searchFilled,
                    onTap: () => tabsRouter.setActiveIndex(1),
                  ),
                  BottomItem(
                    fieldName: 'Library',
                    svgPic: SvgConst.library,
                    isActive: 2 == tabsRouter.activeIndex,
                    svgPicActive: SvgConst.libraryFilled,
                    onTap: () => tabsRouter.setActiveIndex(2),
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

class BottomItem extends StatelessWidget {
  final String svgPic, svgPicActive, fieldName;
  final bool isActive;
  final void Function()? onTap;
  const BottomItem({
    super.key,
    required this.fieldName,
    required this.svgPic,
    required this.svgPicActive,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SvgPic(
              assetsName: isActive ? svgPicActive : svgPic,
              size: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            fieldName,
            style: ConstantTextStyle.smallTextStyle!.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
/*
BottomNavigationBar(
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
              )
*/
