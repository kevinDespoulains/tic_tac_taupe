// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies_injection.dart';

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
    extends $NotifierProvider<GameSettingsNotifier, GameSettings> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameSettings>(value),
    );
  }
}

String _$gameSettingsNotifierHash() =>
    r'd2407aaa33f4f771c85bcb245afd43dafdb0f501';

/// Provides the game settings.

abstract class _$GameSettingsNotifier extends $Notifier<GameSettings> {
  GameSettings build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GameSettings, GameSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameSettings, GameSettings>,
              GameSettings,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
