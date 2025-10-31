import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/core/local_storage/app_local_storage.dart';

part 'dependencies_injection.g.dart';

@riverpod
AppLocalStorage appLocalStorage(Ref ref) {
  return const AppLocalStorage();
}
