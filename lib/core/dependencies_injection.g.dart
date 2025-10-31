// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appLocalStorage)
const appLocalStorageProvider = AppLocalStorageProvider._();

final class AppLocalStorageProvider
    extends
        $FunctionalProvider<AppLocalStorage, AppLocalStorage, AppLocalStorage>
    with $Provider<AppLocalStorage> {
  const AppLocalStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocalStorageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocalStorageHash();

  @$internal
  @override
  $ProviderElement<AppLocalStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLocalStorage create(Ref ref) {
    return appLocalStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLocalStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLocalStorage>(value),
    );
  }
}

String _$appLocalStorageHash() => r'de57e52fe028b25e87823e93ee043589246e931e';
