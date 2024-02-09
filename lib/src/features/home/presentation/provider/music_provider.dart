import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicManager extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool playing = false;
  Duration? total = Duration.zero;
  Duration? current = Duration.zero;
  MusicManager();

  Future<void> init(String music) async {
    print("in playing audio $music");
    await _player.setUrl(music);
    _player.positionStream.listen(
      (event) {
        current = event;
        notifyListeners();
      },
    );
    _player.durationStream.listen(
      (event) {
        total = event;
        notifyListeners();
      },
    );
  }

  Future<void> playMusic() async {
    await _player.play();
  }

  Future<void> pauseMusic() async {
    await _player.pause();
  }

  Future<void> musicDispose() async {
    _player.dispose();
  }

  Future<void> musicSeek(Duration position) async {
    await _player.seek(position);
  }

  void changeState() {
    playing = !playing;
    notifyListeners();
  }
}
