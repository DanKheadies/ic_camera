import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Cameras with ChangeNotifier {
  List<CameraDescription> _cameras = [];
  late CameraDescription _usedCamera;

  List<CameraDescription> get cameras {
    return [..._cameras];
  }

  CameraDescription get usedCamera {
    return _usedCamera;
  }

  Future<void> fetchAndSetCamera() async {
    await getCameras();
    getLastCamera();
  }

  CameraDescription getLastCamera() {
    _usedCamera = _cameras[1];
    return _usedCamera;
  }

  Future<List<CameraDescription>> getCameras() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    _cameras = cameras.toList();
    return _cameras;
  }
}
