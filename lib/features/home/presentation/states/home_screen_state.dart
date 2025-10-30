import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/home/domain/models/home_screen_state.dart';

part 'home_screen_state.g.dart';

@riverpod
class HomeScreenStateNotifier extends _$HomeScreenStateNotifier {
  @override
  HomeScreenState build() {
    return const HomeScreenState(
      botDifficulty: BotDifficulty.medium,
    );
  }

  void setBotDifficulty(BotDifficulty difficulty) {
    state = state.copyWith(botDifficulty: difficulty);
  }
}
