import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/features/home/presentation/widget/home_tags.dart';
import 'package:spotify/src/features/home/presentation/widget/listened_mix.dart';
import 'package:spotify/src/features/home/presentation/widget/shows_mix.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';
import '../widget/home_appbar.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 73,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 25),
              const Row(
                children: [
                  HomeTag(title: 'Music'),
                  SizedBox(width: 8),
                  HomeTag(title: 'Podcast & Shows'),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: context.mediaQueryWidth,
                height: context.dynamicHeight(0.23),
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 1),
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 6,
                    mainAxisExtent: context.dynamicHeight(0.071),
                  ),
                  itemBuilder: (context, index) {
                    return const ListenedMix();
                  },
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Your shows',
                style: ConstantTextStyle.largeTextStyle,
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: context.dynamicHeight(0.25),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const ShowsMix();
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
