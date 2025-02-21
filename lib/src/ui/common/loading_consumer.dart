import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/loadable.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/loading_widget.dart';

class LoadingConsumer<T extends Loadable> extends SingleChildStatelessWidget {
  const LoadingConsumer({
    super.key,
    required this.builder,
    super.child,
  });

  final Widget Function(
    BuildContext context,
    T value,
    Widget? child,
  ) builder;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    var loadable = Provider.of<T>(context);
    if (loadable.loading) {
      return const LoadingWidget();
    } else {
      return builder(context, loadable, child);
    }
  }
}
