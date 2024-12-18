import 'package:workmanager/workmanager.dart';

const fetchBackgroundTaskKey =
    "com.bryanochoa.miscelanous.fetch-background-pokemon";
const fetchPeriodicBackgroundTaskKey =
    "com.bryanochoa.miscelanous.fetch-background-pokemon";

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackgroundTaskKey:
        print("fetch bacground key");
        break;

      case fetchPeriodicBackgroundTaskKey:
        print("fetch periodic bacground key");
        break;

      case Workmanager.iOSBackgroundTask:
        print("ios work manager");
        break;
    }

    return true;
    // print(
    //     "Native:  called background task: $task"); //simpleTask will be emitted here.
    // return Future.value(true);
  });
}
