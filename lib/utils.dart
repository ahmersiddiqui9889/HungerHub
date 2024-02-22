import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  print("picking image");
  final ImagePicker _imagePicker = ImagePicker();
  print("inside select image");
  XFile? _file = await _imagePicker.pickImage(source: source);
  if(_file != null) {
    return await _file.readAsBytes();
  }
  print("No Images Selected");
}