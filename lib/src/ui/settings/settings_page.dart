import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:yet_another_fitness_tracker/src/data/local/shared_prefs.dart';
import 'package:yet_another_fitness_tracker/src/extensions/theme_mode_extensions.dart';
import 'package:yet_another_fitness_tracker/src/themer.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model_state.dart';
import 'package:yet_another_fitness_tracker/src/constants/dimens.dart';
import 'package:yet_another_fitness_tracker/generated/l10n.dart';
import 'package:yet_another_fitness_tracker/src/ui/settings/color_picker.dart';
import 'package:yet_another_fitness_tracker/src/ui/settings/settings_view_model.dart';
import 'package:yet_another_fitness_tracker/src/ui/settings/theme_picker.dart';
import 'package:yet_another_fitness_tracker/src/ui/settings/weight_measurement_picker.dart';

class SettingsPage extends StatefulWidget {
  static Widget build() {
    return MultiProvider(
      providers: [
        ProxyProvider2<Themer, SharedPrefs, SettingsViewModel>(
          update: (_, themer, prefs, previous) =>
              SettingsViewModel(themer, prefs),
        )
      ],
      child: const SettingsPage(),
    );
  }

  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ViewModelState<SettingsPage, SettingsViewModel>
    with AutomaticKeepAliveClientMixin {
  List<WidgetBuilder> get _listItems {
    return [
      (BuildContext context) {
        return _SettingsListItem(
          onTap: () {
            _showThemePicker(context);
          },
          title: Text(S.of(context).settingsTheme),
          trailing: Consumer<SettingsViewModel>(
            builder: (context, viewModel, _) {
              return Text(viewModel.themeMode.localizedString(context));
            },
          ),
        );
      },
      (BuildContext context) {
        return _SettingsListItem(
          onTap: () {
            _showColorPicker(context);
          },
          title: Text(
            S.of(context).settingsPrimaryColor,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          trailing: Padding(
            padding: const EdgeInsets.all(Dimens.spaceNormal),
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
                      offset: const Offset(1.0, 2.0),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      (BuildContext context) {
        return _SettingsListItem(
          title: Text(S.of(context).weightMeasurement),
          trailing: Consumer<SettingsViewModel>(
            builder: (context, viewModel, _) {
              return Text(viewModel.weightMeasurement.localizedString(context));
            },
          ),
          onTap: () {
            _showWeightMeasurementPicker(context);
          },
        );
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _listItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.spaceLarge,
                    top: Dimens.spaceLarge,
                    left: Dimens.spaceHuge,
                  ),
                  child: _listItems[index](context),
                );
              },
            ),
            InkWell(
              onTap: () {
                _showAboutDialog(context);
              },
              child: ListTile(
                title: Center(
                  child: Text(
                    S.of(context).settingsAbout,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  void _showThemePicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Provider.value(
          value: statelessViewModel,
          child: ThemePicker(
            themeMode: statelessViewModel.themeMode,
            onChanged: (value) {
              statelessViewModel.themeMode = value!;
            },
          ),
        );
      },
    );
  }

  void _showColorPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Provider.value(
          value: statelessViewModel,
          child: ColorPicker(
            selectedColor: statelessViewModel.primaryColor,
            onColorChanged: statelessViewModel.setPrimaryColor,
          ),
        );
      },
    );
  }

  void _showWeightMeasurementPicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return Provider.value(
          value: statelessViewModel,
          child: WeightMeasurementPicker(
            value: statelessViewModel.weightMeasurement,
            onChanged: (value) {
              statelessViewModel.setWeightMeasurement(value!);
            },
          ),
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    if (context.mounted) {
      showAboutDialog(
        context: context,
        applicationName: S.of(context).appTitle,
        applicationVersion: info.version,
      );
    }
  }
}

class _SettingsListItem extends StatelessWidget {
  final Widget title;
  final Widget? trailing;
  final GestureTapCallback onTap;

  const _SettingsListItem(
      {required this.onTap, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    var borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(Dimens.borderRadius),
      bottomLeft: Radius.circular(Dimens.borderRadius),
    );
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: ListTile(
          title: title,
          trailing: trailing,
        ),
      ),
    );
  }
}
