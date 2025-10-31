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

String _$ticTacToeBotAiHash() => r'58e8d73ddbcc658048ea0a1ae2f1f4f4bf690f44';

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
