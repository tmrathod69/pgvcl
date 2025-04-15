import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imgsync/api_service.dart';

import 'connectivity_helper.dart';
import 'dbhelper.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(home:UploadPage());
  }
}

class UploadPage extends StatefulWidget
{
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
{
  final TextEditingController _nameController = TextEditingController();
  File? _image;
  final picker = ImagePicker();
  final dbHelper = DBHelper();

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Upload Image"),),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children:
            [

              TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Category Name")),

              const SizedBox(height: 10),

              _image == null
                  ? const Text("No image selected")
                  : Image.file(_image!, height: 150),

              ElevatedButton(onPressed: _pickImage, child: const Text("Pick Image")),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: _savedata, child: const Text("Save")),
            ],
          ),
        ),

      );
  }

  Future<void> _pickImage()async
  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {

      if (pickedFile != null) _image = File(pickedFile.path);

    });
  }

  Future<void> _savedata() async {
    if (_nameController.text.isEmpty || _image == null) return;
    bool online = await ConnectivityHelper.isOnline();
    if (online) {
      final request = http.MultipartRequest('POST', Uri.parse(APIService.insertUrl));
      request.fields['name'] = _nameController.text;
      request.files.add(await http.MultipartFile.fromPath('url', _image!.path));
      final res = await request.send();
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uploaded online")));
      }
    } else {
      await dbHelper.insertCategory(_nameController.text, _image!.path, isSynced: false);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Saved offline")));
    }
    _nameController.clear();
    setState(() => _image = null);
  }

}
