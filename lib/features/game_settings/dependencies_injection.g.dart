// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameSettingsRepository)
const gameSettingsRepositoryProvider = GameSettingsRepositoryProvider._();

final class GameSettingsRepositoryProvider
    extends
        $FunctionalProvider<
          GameSettingsRepository,
          GameSettingsRepository,
          GameSettingsRepository
        >
    with $Provider<GameSettingsRepository> {
  const GameSettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameSettingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameSettingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<GameSettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GameSettingsRepository create(Ref ref) {
    return gameSettingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameSettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameSettingsRepository>(value),
    );
  }
}

String _$gameSettingsRepositoryHash() =>
    r'2072e2fc916c27b210325998ba62437518eaa278';
