import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

var userCamera = CameraController(
    const CameraDescription(
      lensDirection: CameraLensDirection.front,
      name: "",
      sensorOrientation: 0,
    ), 
    ResolutionPreset.max, 
    imageFormatGroup: ImageFormatGroup.yuv420
  );

getCamera() async {
  print("Getting Camera");
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  userCamera = CameraController(
    firstCamera, 
    ResolutionPreset.max, 
    imageFormatGroup: ImageFormatGroup.yuv420
  );
  await userCamera.initialize();
  // userCamera.startVideoRecording();

  print(firstCamera);
  print("\n");
}