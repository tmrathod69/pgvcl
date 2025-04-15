import 'package:crud/productview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class DeleteProduct extends StatefulWidget
{

  var id;
  DeleteProduct({required this.id});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct>
{
  @override
  void initState()
  {

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("${widget.id}"),),
      body: Center
        (
        child: ElevatedButton
          (onPressed: ()
        {
          confirm();

        }, child: Text("Are you sure you want to delete?"),

        ),
      ),
    );
  }

  void confirm()async
  {
    var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/productdelete.php");
    var resp = await http.post(url,body:
    {
      "id":widget.id
    });

    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductViewScreeen()));

  }
}