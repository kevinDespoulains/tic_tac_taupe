import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/core/audio/app_audio_player.dart';
import 'package:tic_tac_taupe/core/local_storage/app_local_storage.dart';

part 'dependencies_injection.g.dart';

@riverpod
AppLocalStorage appLocalStorage(Ref ref) {
  return const AppLocalStorage();
}

@riverpod
AppAudioPlayer appAudioPlayer(Ref ref) {
  return AppAudioPlayer();
}
