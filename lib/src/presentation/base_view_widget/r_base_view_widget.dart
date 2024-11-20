import 'package:flutter/foundation.dart';
import 'package:rok_base_core/src/presentation/base_view_model/r_base_view_model.dart';
import 'package:stacked/stacked.dart';

abstract class RBaseViewWidget<M extends RBaseViewModel> extends StackedView<M> {
  const RBaseViewWidget({super.key});

  @protected
  void loadArguments() {}

  @override
  void onViewModelReady(viewModel) {
    super.onViewModelReady(viewModel);
    loadArguments();
    viewModel.initBase();
  }

  @override
  void onDispose(viewModel) {
    viewModel.disposeBase();
    super.onDispose(viewModel);
  }
}
