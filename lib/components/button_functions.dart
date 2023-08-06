import 'dart:io';
import 'package:file_picker/file_picker.dart';
class Button_functions
{
   String? path;
   // bool fabvisible=false;
  Future<String?> onPress() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
       path = result.files.single.path;
      if (path != null) {
        File file = File(path!);
        // Rest of your code with the 'file' object
      } else {
        // Handle the case when the path is null
        path = 'Luke-Bergs-Bliss.mp3';
      }
    } else {
      // User canceled the picker or no file was selected
      path = null;
    }
    // Source source=path as Source;

    // await audioPlayer.play(DeviceFileSource(path!));
    // setState(() {
    //   if(path!=null)
    //     fabvisible=true;
    // });
    print(path);
    return path;
  }
}