import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicManager {
  static const url =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
  late AudioPlayer _audioPlayer;
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      total: Duration.zero,
    ),
  );
  ValueNotifier<bool> isPlaying = ValueNotifier<bool>(false);
  MusicManager() {
    _init();
  }
  void _init() async {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen(
      (event) {
        isPlaying.value = event == PlayerState.playing;
      },
    );
    //control position
    _audioPlayer.onPositionChanged.listen(
      (position) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: position,
          total: oldState.total,
        );
      },
    );
    //control duration
    _audioPlayer.onDurationChanged.listen(
      (totalDuration) {
        final oldState = progressNotifier.value;
        progressNotifier.value = ProgressBarState(
          current: oldState.current,
          total: totalDuration,
        );
      },
    );
  }

  void play() {
    _audioPlayer.play(UrlSource(url));
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void disponse() {
    _audioPlayer.dispose();
  }
}

class ProgressBarState {
  final Duration current;
  final Duration total;
  ProgressBarState({
    required this.current,
    required this.total,
  });
}
