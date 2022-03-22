import 'package:flutter/material.dart';
import 'package:pal_widgets/services/element_finder.dart';

import 'anchored/anchor_model.dart';
import 'anchored/anchored_helper_widget.dart';
import 'services/overlay_helper.dart';

class _HelperOrchestratorScope extends InheritedWidget {
  final HelperOrchestratorState _helperOrchestratorState;

  const _HelperOrchestratorScope({
    Key? key,
    required Widget child,
    required HelperOrchestratorState helperOrchestratorState,
  })  : _helperOrchestratorState = helperOrchestratorState,
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_HelperOrchestratorScope old) =>
      _helperOrchestratorState != old._helperOrchestratorState;
}

/// Manages Pal widgets to display an [Overlay] over your pages
/// this will allow you to register widgets and show [AnchoredHelper] and others
