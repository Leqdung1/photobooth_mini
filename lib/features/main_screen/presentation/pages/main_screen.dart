import 'package:flutter/material.dart';
import 'package:photobooth_mini/l10n/app_localizations.dart';

import 'custom_tab_page.dart';
import '../../../history/history_screen.dart';
import '../../../home/home_screen.dart';
import '../../../setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _tabs = <Widget>[
    const HomeTabPage(),
    const CustomTabPage(),
    const HistoryTabPage(),
    const SettingTabPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined, key: Key('tab-home')),
            activeIcon: const Icon(Icons.home),
            label: l10n.homeTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.tune_outlined, key: Key('tab-custom')),
            activeIcon: const Icon(Icons.tune),
            label: l10n.customTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history_outlined, key: Key('tab-history')),
            activeIcon: const Icon(Icons.history),
            label: l10n.historyTabLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_outlined, key: Key('tab-setting')),
            activeIcon: const Icon(Icons.settings),
            label: l10n.settingTabLabel,
          ),
        ],
      ),
    );
  }
}
