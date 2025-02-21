import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';

class ColorPicker extends StatelessWidget {
  final ValueChanged<Color> onColorChanged;
  final Color selectedColor;

  const ColorPicker(
      {super.key, required this.selectedColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.spaceLarge),
      child: BlockPicker(
        pickerColor: selectedColor,
        onColorChanged: onColorChanged,
        layoutBuilder: (context, List<Color> colors, PickerItem child) {
          Orientation orientation = MediaQuery.of(context).orientation;

          return GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: orientation == Orientation.portrait ? 5 : 6,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            children: colors.map((Color color) => child(color)).toList(),
          );
        },
      ),
    );
  }
}
