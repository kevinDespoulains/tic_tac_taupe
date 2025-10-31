// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ticTacToeBotAi)
const ticTacToeBotAiProvider = TicTacToeBotAiProvider._();

final class TicTacToeBotAiProvider
    extends $FunctionalProvider<TicTacToeBotAi, TicTacToeBotAi, TicTacToeBotAi>
    with $Provider<TicTacToeBotAi> {
  const TicTacToeBotAiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticTacToeBotAiProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticTacToeBotAiHash();

  @$internal
  @override
  $ProviderElement<TicTacToeBotAi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TicTacToeBotAi create(Ref ref) {
    return ticTacToeBotAi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicTacToeBotAi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicTacToeBotAi>(value),
    );
  }
}

String _$ticTacToeBotAiHash() => r'6379031b8fdae83b527f952e54b6cfecfd4c7356';

@ProviderFor(ticTacToeGameRepository)
const ticTacToeGameRepositoryProvider = TicTacToeGameRepositoryProvider._();

final class TicTacToeGameRepositoryProvider
    extends
        $FunctionalProvider<
          TicTacToeGameRepository,
          TicTacToeGameRepository,
          TicTacToeGameRepository
        >
    with $Provider<TicTacToeGameRepository> {
  const TicTacToeGameRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticTacToeGameRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticTacToeGameRepositoryHash();

  @$internal
  @override
  $ProviderElement<TicTacToeGameRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TicTacToeGameRepository create(Ref ref) {
    return ticTacToeGameRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicTacToeGameRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicTacToeGameRepository>(value),
    );
  }
}

String _$ticTacToeGameRepositoryHash() =>
    r'51e6257011c8b3ba877cb6ca4b667b1a1c31bc48';

@ProviderFor(ticTacToeGameStateNotifier)
const ticTacToeGameStateProvider = TicTacToeGameStateNotifierProvider._();

final class TicTacToeGameStateNotifierProvider
    extends
        $FunctionalProvider<
          TicTacToeGameStateNotifier,
          TicTacToeGameStateNotifier,
          TicTacToeGameStateNotifier
        >
    with $Provider<TicTacToeGameStateNotifier> {
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
  $ProviderElement<TicTacToeGameStateNotifier> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TicTacToeGameStateNotifier create(Ref ref) {
    return ticTacToeGameStateNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TicTacToeGameStateNotifier value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TicTacToeGameStateNotifier>(value),
    );
  }
}

String _$ticTacToeGameStateNotifierHash() =>
    r'39f7bf8263fa3982bf50645f7551954524767855';
