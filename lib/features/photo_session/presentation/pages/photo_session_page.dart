import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photobooth_mini/l10n/app_localizations.dart';

import '../../../../../app/locale/locale_controller.dart';
import '../../../../../di/injection.dart';
import '../cubit/photo_session_cubit.dart';
import '../cubit/photo_session_state.dart';

class PhotoSessionPage extends StatefulWidget {
  const PhotoSessionPage({super.key});

  @override
  State<PhotoSessionPage> createState() => _PhotoSessionPageState();
}

class _PhotoSessionPageState extends State<PhotoSessionPage> {
  @override
  void initState() {
    super.initState();
    context.read<PhotoSessionCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeController = sl<LocaleController>();
    final isVietnamese = localeController.locale.languageCode == 'vi';

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.photoSessionTitle),
        actions: <Widget>[
          TextButton(
            onPressed: localeController.toggleLocale,
            child: Text(isVietnamese ? l10n.switchToEnglish : l10n.switchToVietnamese),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<PhotoSessionCubit, PhotoSessionState>(
          builder: (BuildContext context, PhotoSessionState state) {
            if (state.status == PhotoSessionStatus.loading) {
              return const CircularProgressIndicator();
            }

            if (state.status == PhotoSessionStatus.failure) {
              return Text(state.errorMessage ?? l10n.unexpectedError);
            }

            if (state.status == PhotoSessionStatus.success && state.session != null) {
              final session = state.session!;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    session.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.sessionIdLabel(session.id)),
                  Text(l10n.shotsPlannedLabel(session.shotCount)),
                ],
              );
            }

            return Text(l10n.loadingSession);
          },
        ),
      ),
    );
  }
}
