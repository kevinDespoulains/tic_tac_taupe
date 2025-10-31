// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mole_dialogs_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MoleDialogsStateNotifier)
const moleDialogsStateProvider = MoleDialogsStateNotifierProvider._();

final class MoleDialogsStateNotifierProvider
    extends $NotifierProvider<MoleDialogsStateNotifier, String?> {
  const MoleDialogsStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'moleDialogsStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$moleDialogsStateNotifierHash();

  @$internal
  @override
  MoleDialogsStateNotifier create() => MoleDialogsStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$moleDialogsStateNotifierHash() =>
    r'c3d85123abc18dce7f669f5615997f0445007250';

abstract class _$MoleDialogsStateNotifier extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
