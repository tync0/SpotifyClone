import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:spotify/src/features/home/presentation/provider/provider.dart';
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
  final AudioPlayer _player = AudioPlayer();
  final double _sliderValue = 0;

  // late final MusicManager _manager;
  @override
  void initState() {
    setUrl();
    super.initState();
  }

  @override
  void dispose() {
    _player.stop();
    _player.dispose();
    super.dispose();
  }

  void setUrl() async {
    await _player.setAsset('assets/la.lacon.mp3');
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
                Slider(
                  onChanged: (value) {},
                  value: _sliderValue,
                  min: 0,
                  max: 3,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey[700],
                ),
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
                      child: Consumer<Button>(
                        builder: (context, value, child) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () async {
                              if (value.playing) {
                                value.changeState();
                                await _player.pause();
                              } else {
                                value.changeState();
                                await _player.play();
                              }
                              // Update the playing state
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
