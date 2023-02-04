import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

proPicGallery() async {

  // Get Image from Image Pick
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image == null) return XFile('');

  // Crop Image File 
  final croppedFile = await ImageCropper()
    .cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 100.0, 
        ratioY: 100.0,
      ),
      uiSettings: [
        IOSUiSettings(
          title: 'Start cropping by touching the screen',
          resetButtonHidden: true,
          aspectRatioPickerButtonHidden: true,
          rotateButtonsHidden: true,
          aspectRatioLockEnabled: true
        ),
       AndroidUiSettings(
         lockAspectRatio: true,
         initAspectRatio: CropAspectRatioPreset.square,
         hideBottomControls: true
       ) 
      ]
    );

  if(croppedFile == null) return XFile(''); 

  return File(croppedFile.path);
} 

proPicCamera() async {
  print('Attempting to get user Sign Up Profile Picture');
  final image = await ImagePicker().pickImage(source: ImageSource.camera);


  if(image == null) return XFile('');

  // Crop Image File 
  final croppedFile = await ImageCropper()
    .cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(
        ratioX: 100.0, 
        ratioY: 100.0,
      ),
      uiSettings: [
        IOSUiSettings(
          title: 'Start cropping by touching the screen',
          resetButtonHidden: true,
          aspectRatioPickerButtonHidden: true,
          rotateButtonsHidden: true,
          aspectRatioLockEnabled: true
        ),
       AndroidUiSettings(
         lockAspectRatio: true,
         initAspectRatio: CropAspectRatioPreset.square,
         hideBottomControls: true
       ) 
      ]
    );

  if(croppedFile == null) return XFile(''); 
  return File(croppedFile.path);
} 