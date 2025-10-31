import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rive/rive.dart';
import 'package:tic_tac_taupe/core/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/i18n/localizations.dart';
import 'package:tic_tac_taupe/core/themes/assets/assets.dart';
import 'package:tic_tac_taupe/core/widgets/logic_loader/logic_loader.dart';
import 'package:tic_tac_taupe/features/navigation/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RiveNative.init();
  runApp(const ProviderScope(child: _TicTacTaupeApp()));
}

class _TicTacTaupeApp extends ConsumerWidget {
  const _TicTacTaupeApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LogicLoader(
      onLoad: (context) async {
        await ref.read(appAudioPlayerProvider).play(Assets.music, loop: true);
      },
      child: MaterialApp.router(
        routerConfig: ref.watch(goRouterProvider),
        debugShowCheckedModeBanner: false,
        title: AppLocalizations.appTitle,
      ),
    );
  }
}
