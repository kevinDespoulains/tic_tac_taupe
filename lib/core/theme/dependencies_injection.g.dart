// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies_injection.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides the app's color theme data.

@ProviderFor(colorThemeData)
const colorThemeDataProvider = ColorThemeDataProvider._();

/// Provides the app's color theme data.

final class ColorThemeDataProvider
    extends
        $FunctionalProvider<
          AppColorThemeData,
          AppColorThemeData,
          AppColorThemeData
        >
    with $Provider<AppColorThemeData> {
  /// Provides the app's color theme data.
  const ColorThemeDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorThemeDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorThemeDataHash();

  @$internal
  @override
  $ProviderElement<AppColorThemeData> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppColorThemeData create(Ref ref) {
    return colorThemeData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppColorThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppColorThemeData>(value),
    );
  }
}

String _$colorThemeDataHash() => r'743fd23dd9704c9856a6f4b4f651d25de92776a3';

/// Provides the app's text theme data.

@ProviderFor(textThemeData)
const textThemeDataProvider = TextThemeDataProvider._();

/// Provides the app's text theme data.

final class TextThemeDataProvider
    extends
        $FunctionalProvider<
          AppTextThemeData,
          AppTextThemeData,
          AppTextThemeData
        >
    with $Provider<AppTextThemeData> {
  /// Provides the app's text theme data.
  const TextThemeDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'textThemeDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$textThemeDataHash();

  @$internal
  @override
  $ProviderElement<AppTextThemeData> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppTextThemeData create(Ref ref) {
    return textThemeData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTextThemeData value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTextThemeData>(value),
    );
  }
}

String _$textThemeDataHash() => r'66280e81c709a4a3531bff3217fa4a0855bba94a';
