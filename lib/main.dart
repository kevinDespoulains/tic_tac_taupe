import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_taupe/features/navigation/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const _TicTacTaupeApp());
}

class _TicTacTaupeApp extends ConsumerWidget {
  const _TicTacTaupeApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'Tic Tac Taupe',
    );
  }
}
