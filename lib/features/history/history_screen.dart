import 'package:flutter/material.dart';
import 'package:photobooth_mini/l10n/app_localizations.dart';

class HistoryTabPage extends StatelessWidget {
  const HistoryTabPage({super.key});

  static const Key bodyKey = Key('tab-body-history');

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      key: bodyKey,
      child: Text(l10n.historyTabTitle),
    );
  }
}
