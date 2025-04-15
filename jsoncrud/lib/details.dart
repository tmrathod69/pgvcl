import 'package:crud/productview.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edit.dart';
class Details extends StatefulWidget
{
  // const Details({super.key});
  late List list;
  late int index;

  Details({required this.list,required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details>
{
  var a,b,c;
  TextEditingController a1 = TextEditingController();
  TextEditingController b1 = TextEditingController();
  TextEditingController c1 = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    a = widget.list[widget.index]["product_name"];
    b = widget.list[widget.index]["product_price"];
    c = widget.list[widget.index]["product_description"];

    a1 = TextEditingController(text: a);
    b1 = TextEditingController(text: b);
    c1 = TextEditingController(text: c);

    //print(a);
    //print(b);
    //print(c);
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Edit Data ${widget.index}"),),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            TextField
              (
              controller: a1,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Name'
              ),
            ),
            SizedBox(height: 10,),
            TextField
              (
              controller: b1,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Price'
              ),
            ),
            SizedBox(height: 10,),
            TextField
              (
              controller: c1,
              decoration: InputDecoration
                (
                  hintText: 'Enter Product Description'
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: ()
            {
              String d1 = a1.text.toString();
              String d2 = b1.text.toString();
              String d3 = c1.text.toString();

              updatedata(d1,d2,d3);

              // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductViewScreeen()));

            }, child: Text("Update Product"))
          ],
        ),
      ),
    );
  }

  void updatedata(String d1, String d2, String d3)
  {
    var url = Uri.parse("https://prakrutitech.buzz/Fluttertestapi/productupdate.php");
    http.post(url,body:
    {
      "id":widget.list[widget.index]['id'],
      "product_name":d1,
      "product_price":d2,
      "product_description":d3

    });

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductViewScreeen()));
  }
}