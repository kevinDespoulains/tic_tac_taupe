// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_settings_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the game settings.

@ProviderFor(GameSettingsNotifier)
const gameSettingsProvider = GameSettingsNotifierProvider._();

/// Provides the game settings.
final class GameSettingsNotifierProvider
    extends $AsyncNotifierProvider<GameSettingsNotifier, GameSettings> {
  /// Provides the game settings.
  const GameSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameSettingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameSettingsNotifierHash();

  @$internal
  @override
  GameSettingsNotifier create() => GameSettingsNotifier();
}

String _$gameSettingsNotifierHash() =>
    r'd6ef56b53b02d73f9b8509982cbe3d5765aa0f77';

/// Provides the game settings.

abstract class _$GameSettingsNotifier extends $AsyncNotifier<GameSettings> {
  FutureOr<GameSettings> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<GameSettings>, GameSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GameSettings>, GameSettings>,
              AsyncValue<GameSettings>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
