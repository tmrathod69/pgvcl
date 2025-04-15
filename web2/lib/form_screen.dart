import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget
{
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _submitForm() async
  {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try
    {
      final name = Uri.encodeComponent(_nameController.text.trim());
      final price = Uri.encodeComponent(_priceController.text.trim());
      final des = Uri.encodeComponent(_descController.text.trim());

      print(name);
      print(price);
      print(des);

      final rawUrl ='https://prakrutitech.buzz/Fluttertestapi/productinsert.php?product_name=$name&product_price=$price&product_description=$des';
      print(rawUrl);
      final url = Uri.parse('https://api.allorigins.win/raw?url=${Uri.encodeComponent(rawUrl)}');

      final response = await http.get(url);

      if(response.statusCode==200)
      {
        if (response.body.trim() == '0') {
          _showMessage('⚠️ All fields are required!');
        } else {
          _showMessage('✅ Product submitted successfully!');
          _formKey.currentState!.reset();
        }

      }
      else
      {
        _showMessage('❌ Server error: ${response.statusCode}');
      }

    }
    catch(e)
    {
      print(e);
    }
    finally
    {
      setState(() => _isSubmitting = false);
    }


  }

  // Future<void> _submitForm() async {
  //   if (!_formKey.currentState!.validate()) return;
  //
  //   setState(() => _isSubmitting = true);
  //
  //   try {
  //     final name = Uri.encodeComponent(_nameController.text.trim());
  //     final price = Uri.encodeComponent(_priceController.text.trim());
  //     final desc = Uri.encodeComponent(_descController.text.trim());
  //
  //     final rawUrl =
  //         'https://prakrutitech.buzz/Fluttertestapi/productinsert.php?product_name=$name&product_price=$price&product_description=$desc';
  //
  //     final url = Uri.parse('https://api.allorigins.win/raw?url=${Uri.encodeComponent(rawUrl)}');
  //
  //     final response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       if (response.body.trim() == '0') {
  //         _showMessage('⚠️ All fields are required!');
  //       } else {
  //         _showMessage('✅ Product submitted successfully!');
  //         _formKey.currentState!.reset();
  //       }
  //     } else {
  //       _showMessage('❌ Server error: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     _showMessage('❌ Submission failed: $e');
  //   } finally {
  //     setState(() => _isSubmitting = false);
  //   }
  // }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter product name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter product price' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Product Description'),
                maxLines: 3,
                validator: (value) =>
                value == null || value.isEmpty ? 'Enter description' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Submit Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
