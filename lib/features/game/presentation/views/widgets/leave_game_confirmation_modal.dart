import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_taupe/core/i18n/localizations.dart';
import 'package:tic_tac_taupe/core/themes/dependencies_injection.dart';
import 'package:tic_tac_taupe/core/widgets/button/app_button.dart';
import 'package:tic_tac_taupe/core/widgets/modal/app_modal.dart';
import 'package:tic_tac_taupe/core/widgets/text/app_text.dart';
import 'package:tic_tac_taupe/features/navigation/routes.dart';

class LeaveGameConfirmationModal extends StatelessWidget with ShowableAppModal {
  const LeaveGameConfirmationModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        _Title(),
        _Subtitle(),
        Row(
          spacing: 16,
          children: [
            Expanded(child: _LeaveButton()),
            Expanded(child: _CancelButton()),
          ],
        ),
      ],
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      AppLocalizations.leaveGameConfirmationTitle,
      style: textTheme.label1,
    );
  }
}

class _Subtitle extends ConsumerWidget {
  const _Subtitle();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = ref.watch(textThemeDataProvider);

    return AppText(
      AppLocalizations.leaveGameConfirmationSubtitle,
      style: textTheme.body,
    );
  }
}

class _LeaveButton extends StatelessWidget {
  const _LeaveButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      type: AppButtonType.negative,
      text: AppLocalizations.leaveGameLabel,
      onPressed: () {
        context.go(AppRoutes.home);
      },
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton();

  @override
  Widget build(BuildContext context) {
    return AppButton(
      type: AppButtonType.secondary,
      text: AppLocalizations.cancelLabel,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
