// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe_game_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TicTacToeGameStateNotifier)
const ticTacToeGameStateProvider = TicTacToeGameStateNotifierProvider._();

final class TicTacToeGameStateNotifierProvider
    extends $NotifierProvider<TicTacToeGameStateNotifier, TicTacToeGame> {
  const TicTacToeGameStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticTacToeGameStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticTacToeGameStateNotifierHash();

  @$internal
  @override
  TicTacToeGameStateNotifier create() => TicTacToeGameStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicTacToeGame value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicTacToeGame>(value),
    );
  }
}

String _$ticTacToeGameStateNotifierHash() =>
    r'f282f158051b6c7b5525cda0d34b2b9bf96972ab';

abstract class _$TicTacToeGameStateNotifier extends $Notifier<TicTacToeGame> {
  TicTacToeGame build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TicTacToeGame, TicTacToeGame>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TicTacToeGame, TicTacToeGame>,
              TicTacToeGame,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
