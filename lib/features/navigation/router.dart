import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_taupe/features/game/presentation/views/game_screen.dart';
import 'package:tic_tac_taupe/features/home/presentation/views/home_screen.dart';
import 'package:tic_tac_taupe/features/navigation/routes.dart';

part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: [
      // Home route
      GoRoute(
        path: AppRoutes.home,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
      // Game route
      GoRoute(
        path: AppRoutes.game,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const GameScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}
