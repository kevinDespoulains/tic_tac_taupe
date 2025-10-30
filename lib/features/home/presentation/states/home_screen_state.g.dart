// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomeScreenStateNotifier)
const homeScreenStateProvider = HomeScreenStateNotifierProvider._();

final class HomeScreenStateNotifierProvider
    extends $NotifierProvider<HomeScreenStateNotifier, HomeScreenState> {
  const HomeScreenStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeScreenStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeScreenStateNotifierHash();

  @$internal
  @override
  HomeScreenStateNotifier create() => HomeScreenStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeScreenState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeScreenState>(value),
    );
  }
}

String _$homeScreenStateNotifierHash() =>
    r'379e0fe8d832e6b36f45e50e800f111530563cd6';

abstract class _$HomeScreenStateNotifier extends $Notifier<HomeScreenState> {
  HomeScreenState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeScreenState, HomeScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HomeScreenState, HomeScreenState>,
              HomeScreenState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
