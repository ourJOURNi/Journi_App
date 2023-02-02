import '../global-styles.dart';
import 'package:image_picker/image_picker.dart';

final ImagePicker picker = ImagePicker();

// File? image;

Future<XFile> proPicGallery() async {
  print('Attempting to get user Sign Up Profile Picture');
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  if(image == null) return XFile('');
  return image;
} 

Future<XFile>  proPicCamera() async {
  print('Attempting to get user Sign Up Profile Picture');
  final image = await ImagePicker().pickImage(source: ImageSource.camera);
  if(image == null) return XFile('');
  return image;
} 