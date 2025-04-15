import 'package:crud/productview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget
{
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct>
{
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();


  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Insert Data"),),
      body: SingleChildScrollView
        (
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextField
              (
              controller: pname,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Name'
              ),
            ),
            SizedBox(height: 10,),
            TextField
              (
              controller: pprice,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Price'
              ),
            ),
            SizedBox(height: 10,),
            TextField
              (
              controller: pdes,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Description'
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              String d1 = pname.text.toString();
              String d2 = pprice.text.toString();
              String d3 = pdes.text.toString();

              insertdata(d1,d2,d3);

              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductViewScreeen()));

            }, child: Text("Add Product"))
          ],
        ),
      ),
    );
  }

  void insertdata(String d1, String d2, String d3)
  {
    var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/productinsert.php");

    var resp = http.post(url,body:
    {
      "product_name" : d1,
      "product_price" : d2,
      "product_description" :d3
    });
    print(resp);
  }
}