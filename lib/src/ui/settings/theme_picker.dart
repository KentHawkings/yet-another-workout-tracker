import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/src/extensions/theme_mode_extensions.dart';
class ThemePicker extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode?> onChanged;

  const ThemePicker(
      {super.key, required this.themeMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ThemeMode.values.length,
      itemBuilder: (context, index) {
        ThemeMode mode = ThemeMode.values[index];
        return RadioListTile(
          title: Text(mode.localizedString(context)),
          value: mode,
          groupValue: themeMode,
          onChanged: onChanged,
        );
      },
    );
  }
}
