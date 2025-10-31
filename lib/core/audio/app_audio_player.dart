import 'package:audioplayers/audioplayers.dart';

class AppAudioPlayer {
  /// Plays a sound effect.
  Future<void> play(
    String soundEffect, {
    bool? loop,
    Duration? duration,
  }) async {
    final player = AudioPlayer();

    if (loop ?? false) {
      await player.setReleaseMode(ReleaseMode.loop);
    }

    if (duration != null) {
      Future.delayed(duration, player.stop);
    }

    return player.play(AssetSource(soundEffect));
  }

  /// Loads a sound effect into memory for faster playback.
  /// Use [AppLoadedAudioPlayer] to play the loaded sound effect.
  AppLoadedAudioPlayer loadAsset(String soundEffect) {
    final player = AudioPlayer();
    player.setSource(AssetSource(soundEffect));

    return AppLoadedAudioPlayer._(player: player);
  }
}

class AppLoadedAudioPlayer {
  const AppLoadedAudioPlayer._({
    required AudioPlayer player,
  }) : _player = player;

  final AudioPlayer _player;

  void play({
    Duration? start,
    Duration? duration,
  }) {
    _player.seek(start ?? Duration.zero);
    _player.resume();

    if (duration != null) {
      Future.delayed(duration, _player.stop);
    }
  }
}
