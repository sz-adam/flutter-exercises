import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/provider/theme_provider.dart';

class Home extends ConsumerWidget {
  final String username;

  const Home({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // A MediaQuery segítségével figyeljük az eszköz rendszer témáját
    final isSystemDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Figyeljük, hogy mi van a themeModeProvider-ben
    final themeMode = ref.watch(themeModeProvider);

    // A dark mode állapot eldöntése a felhasználó és rendszer alapján
    final isDarkMode = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && isSystemDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  isDarkMode ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Hello, $username!',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
