import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

// state notifier provider
final permissionsProvider =
    StateNotifierProvider<PermissionsNotifier, PermisisonsState>((ref) {
  return PermissionsNotifier();
});

class PermissionsNotifier extends StateNotifier<PermisisonsState> {
  Future<void> checkPermissions() async {
    final permissionsArray = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.locationAlways.status,
      Permission.location.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsArray[0],
      location: permissionsArray[4],
      locationAlways: permissionsArray[3],
      locationWhenInUse: permissionsArray[5],
      photoLibrary: permissionsArray[1],
      sensors: permissionsArray[2],
    );
  }

  openSettingsScreen() {
    openAppSettings();
  }

  void _checkPermissionState(PermissionStatus status) {
    if (status == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }

  requestCameraAccess() async {
    final status = await Permission.camera.request();

    state = state.copyWith(camera: status);

    _checkPermissionState(status);
  }

  requestPhotosAccess() async {
    final status = await Permission.photos.request();

    state = state.copyWith(photoLibrary: status);
    _checkPermissionState(status);
  }

  requestSensorsAccess() async {
    final status = await Permission.sensors.request();

    state = state.copyWith(sensors: status);

    _checkPermissionState(status);
  }

  requestLocationAccess() async {
    final status = await Permission.location.request();

    state = state.copyWith(location: status);

    _checkPermissionState(status);
  }

  PermissionsNotifier() : super(PermisisonsState());
}

class PermisisonsState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  bool get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  bool get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  bool get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  bool get locationGranted {
    return location == PermissionStatus.granted;
  }

  bool get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  bool get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermisisonsState(
      {this.camera = PermissionStatus.denied,
      this.photoLibrary = PermissionStatus.denied,
      this.sensors = PermissionStatus.denied,
      this.location = PermissionStatus.denied,
      this.locationAlways = PermissionStatus.denied,
      this.locationWhenInUse = PermissionStatus.denied});

  PermisisonsState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) {
    return PermisisonsState(
        camera: camera ?? this.camera,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors);
  }
}
