import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tic_tac_taupe/features/game_settings/domain/game_settings.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required GameSettings gameSettings,
  }) = _HomeScreenState;
}
