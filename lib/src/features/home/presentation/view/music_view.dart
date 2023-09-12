import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spotify/src/features/home/presentation/provider/music_manager.dart';
import 'package:spotify/src/features/home/presentation/widget/music_image.dart';
import 'package:spotify/src/features/home/presentation/widget/music_title.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import '../widget/music_appbar.dart';
import '../widget/music_footer_icon.dart';

@RoutePage()
class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  late final MusicManager _manager;
  @override
  void initState() {
    _manager = MusicManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 18,
            top: 18,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const MusicAppBar(),
                const SizedBox(height: 57),
                const MusicViewImage(),
                const SizedBox(height: 57),
                const MusicViewTitle(),
                const SizedBox(height: 10),
                // ValueListenableBuilder<ProgressBarState>(
                //   valueListenable: _manager.progressNotifier,
                //   builder: (context, value, child) => Slider(
                //     min: 0, //double.parse(value.buffered.toString()),
                //     max: double.parse(value.total.toString()),
                //     value: double.parse(value.current.toString()),
                //     onChanged: (value) {
                //       final position = Duration(seconds: value.toInt());
                //       _manager.seek(position);
                //     },
                //     activeColor: Colors.white,
                //     inactiveColor: Colors.grey[700],
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomIcon(
                      iconData: Icons.skip_previous,
                      size: 48,
                    ),
                    const SizedBox(width: 20),
                    ValueListenableBuilder<bool>(
                      valueListenable: _manager.isPlaying,
                      builder: (context, value, child) => Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: value == true
                            ? InkWell(
                                onTap: _manager.play,
                                child: const CustomIcon(
                                  iconData: Icons.pause,
                                  color: Colors.black,
                                ),
                              )
                            : InkWell(
                                onTap: _manager.pause,
                                child: const CustomIcon(
                                  iconData: Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    const CustomIcon(
                      iconData: Icons.skip_next,
                      size: 48,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const MusicFooterIconSet()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
