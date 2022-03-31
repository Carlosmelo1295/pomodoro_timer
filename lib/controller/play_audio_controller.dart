import 'package:audioplayers/audioplayers.dart';

class ControllerAudioPlay {
  final AudioCache audio = AudioCache();

  void playAudio() {
    audio.play(
      'apito.wav',
    );
  }
}
