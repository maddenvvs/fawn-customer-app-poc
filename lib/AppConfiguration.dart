import 'package:flutter/foundation.dart';

class AppConfiguration {
  final String backendUrl;
  final bool showPerformanceOverlay;
  final bool showSemanticsDebugger;
  final bool debugShowMaterialGrid;
  final int orderStatusPollingPeriodInSeconds;

  AppConfiguration({
    @required this.backendUrl,
    @required this.showPerformanceOverlay,
    @required this.showSemanticsDebugger,
    @required this.debugShowMaterialGrid,
    @required this.orderStatusPollingPeriodInSeconds,
  })  : assert(backendUrl != null),
        assert(showPerformanceOverlay != null),
        assert(showSemanticsDebugger != null),
        assert(debugShowMaterialGrid != null),
        assert(orderStatusPollingPeriodInSeconds != null &&
            orderStatusPollingPeriodInSeconds > 0);
}
