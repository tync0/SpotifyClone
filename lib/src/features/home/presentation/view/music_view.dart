import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/src/features/home/presentation/provider/music_provider.dart';
import 'package:spotify/src/features/home/presentation/widget/music_image.dart';
import 'package:spotify/src/features/home/presentation/widget/music_title.dart';
import 'package:spotify/src/shared/widget/custom_icon.dart';
import 'package:spotify/src/utils/contants/text_style.dart';
import 'package:spotify/src/utils/extension/mediaquery_extension.dart';
import '../widget/music_appbar.dart';
import '../widget/music_footer_icon.dart';

@RoutePage()
class MusicView extends StatefulWidget {
  const MusicView({super.key});

  @override
  State<MusicView> createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.2, 0.4, 0.6, 0.9],
          colors: [
            Colors.blueGrey.shade700,
            Colors.blueGrey.shade800,
            Colors.blueGrey.shade900,
            Colors.black12,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        const MusicViewTitle(),
                        const SizedBox(height: 10),
                        Consumer<MusicManager>(
                          builder: (context, value, child) {
                            Duration? current = value.current;
                            Duration? total = value.total;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 3,
                                    overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 13,
                                    ),
                                    trackShape: RectangularSliderTrackShape(),
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 4,
                                    ),
                                  ),
                                  child: Slider(
                                    onChanged: (valuee) async {
                                      Duration position = Duration(
                                        seconds: valuee.toInt(),
                                      );
                                      value.musicSeek(position);
                                    },
                                    value: current!.inSeconds.toDouble(),
                                    min: 0,
                                    max: total!.inSeconds.toDouble(),
                                    activeColor: Colors.white,
                                    inactiveColor: Colors.grey[700],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        formatTime(current),
                                        style: ConstantTextStyle.smallTextStyle!
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        formatTime(total),
                                        style: ConstantTextStyle.smallTextStyle!
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomIcon(
                        iconData: Icons.skip_previous,
                        size: 48,
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Consumer<MusicManager>(
                          builder: (context, value, child) {
                            return GestureDetector(
                              //update state
                              onTap: () async {
                                if (value.playing) {
                                  value.changeState();
                                  value.pauseMusic();
                                } else {
                                  value.changeState();
                                  value.playMusic();
                                }
                              },
                              child: value.playing
                                  ? const CustomIcon(
                                      iconData: Icons.pause,
                                      color: Colors.black,
                                    )
                                  : const CustomIcon(
                                      iconData: Icons.play_arrow,
                                      color: Colors.black,
                                    ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      const CustomIcon(
                        iconData: Icons.skip_next,
                        size: 48,
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  const MusicFooterIconSet()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  String minutes = duration.inMinutes.remainder(60).toString();
  String seconds = twoDigits(duration.inSeconds.remainder(60));
  return [
    minutes,
    seconds,
  ].join(':');
}
