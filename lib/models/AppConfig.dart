import 'package:flutter/foundation.dart';

class AppConfig {
  final String backendUrl;
  final int orderStatusPollingPeriodInSeconds;

  AppConfig({
    @required this.backendUrl,
    this.orderStatusPollingPeriodInSeconds = 20,
  })  : assert(backendUrl != null),
        assert(orderStatusPollingPeriodInSeconds != null &&
            orderStatusPollingPeriodInSeconds > 0);

  AppConfig.debug()
      : this(
          backendUrl: "http://10.0.2.2:5000/",
          orderStatusPollingPeriodInSeconds: 2,
        );

  AppConfig.release()
      : this(
          backendUrl: "http://10.0.2.2:5000/",
        );
}
