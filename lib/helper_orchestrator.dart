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
/// Pal onboarding widgets
class HelperOrchestrator extends StatefulWidget {
  final Widget child;

  const HelperOrchestrator({Key? key, required this.child}) : super(key: key);

  /// If there is no [HelperOrchestrator] in scope
  ///
  /// See also:
  ///
  ///  * [maybeOf], which is a similar function but will return null instead of
  ///    throwing if there is no [HelperOrchestrator] ancestor.
  static HelperOrchestratorState of(BuildContext context) {
    assert(debugCheckHasScaffoldMessenger(context));

    final _HelperOrchestratorScope scope =
        context.dependOnInheritedWidgetOfExactType<_HelperOrchestratorScope>()!;
    return scope._helperOrchestratorState;
  }

  /// The state from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Will return null if a [HelperOrchestrator] is not found in the given context.
  ///
  /// See also:
  ///
  ///  * [of], which is a similar function, except that it will throw an
  ///    exception if a [HelperOrchestrator] is not found in the given context.
  static HelperOrchestratorState? maybeOf(BuildContext? context) {
    if (context == null) {
      return null;
    }
    final _HelperOrchestratorScope? scope =
        context.dependOnInheritedWidgetOfExactType<_HelperOrchestratorScope>();
    return scope?._helperOrchestratorState;
  }

  @override
  HelperOrchestratorState createState() => HelperOrchestratorState();
}

/// State for [HelperOrchestrator]
///
/// Can display an helper as overlay above a child using
/// the current [BuildContext] and [HelperOrchestrator.of]
class HelperOrchestratorState extends State<HelperOrchestrator> {
  final Map<String, Key> keys = {};
