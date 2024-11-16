import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class FilePickerProvider extends ChangeNotifier {
  Uint8List? filebytes;
  String? pickedname;
  String? imagepath;

  Uint8List? get fileBytes => filebytes;
  String? get fileName => pickedname;
  String? get fileUrl => imagepath;

  pickImage() {
    if (html.window.navigator.platform != 'MacIntel') {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files!.isEmpty) return;

        final reader = html.FileReader();
        reader.readAsDataUrl(files[0]);
        reader.onLoadEnd.listen((e) {
          imagepath = reader.result as String;
          pickedname = files[0].name;
          notifyListeners();
        });
      });
    } else {
      FilePicker.platform.pickFiles(type: FileType.image).then((result) {
        if (result != null) {
          final file = result.files.first;
          pickedname = file.name;
          filebytes = file.bytes;
          notifyListeners();
        }
      });
    }
  }

  void reset() {
    filebytes = null;
    pickedname = null;
    imagepath = null;
    notifyListeners();
  }
}
