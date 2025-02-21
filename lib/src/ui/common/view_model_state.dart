import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/loading_consumer.dart';
import 'package:yet_another_fitness_tracker/src/ui/common/view_model.dart';

abstract class ViewModelState<T extends StatefulWidget, V extends ViewModel>
    extends State<T> {
  V get viewModel => Provider.of<V>(context);

  V get statelessViewModel => Provider.of<V>(context, listen: false);

  SingleChildStatelessWidget viewModelConsumer({
    Key? key,
    required Widget Function(BuildContext context, V value, Widget? child)
        builder,
    Widget? child,
  }) =>
      Consumer<V>(key: key, builder: builder, child: child);
}

abstract class LoadableViewModelState<T extends StatefulWidget,
    V extends LoadableViewModel> extends ViewModelState<T, V> {
  @override
  SingleChildStatelessWidget viewModelConsumer({
    Key? key,
    required Widget Function(BuildContext context, V value, Widget? child)
        builder,
    Widget? child,
  }) =>
      LoadingConsumer<V>(key: key, builder: builder, child: child);
}
