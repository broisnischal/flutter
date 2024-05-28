// Entry Point for Monitoring Isolate
import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

@pragma('vm:entry-point')
onMonitoringServiceStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Map<String, ApplicationData> monitoredApplicationSet = {};

  // Stop this background service
  _registerListener(service);

  // Map<String, UsageInfo> previousUsageSession =
  //     await getCurrentUsageStats(monitoredApplicationSet);
  // _startTimer(databaseService, monitoredApplicationSet, previousUsageSession);
}

_registerListener(ServiceInstance service) {
  service.on('onMonitoring').listen((event) {
    service.stopSelf();
  });
}
