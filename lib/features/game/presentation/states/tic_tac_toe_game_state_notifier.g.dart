// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe_game_state_notifier.dart';

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
    r'8e550fe13e56e96b25e3a2d855ab206c6db43859';

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
