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
