import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget
{
  late List list;
  late var id;

  EditProduct({required this.list,required this.id});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct>
{
  TextEditingController pname = TextEditingController();
  TextEditingController pprice = TextEditingController();
  TextEditingController pdes = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    pname =  widget.list[widget.id]['product_name'];
    // var b = widget.list[widget.id]['product_price'];
    //var c = widget.list[widget.id]['product_description'];

    print(pname);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Insert Data ${widget.id}"),),
      body: Center
        (
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

              //insertdata(d1,d2,d3);

              // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProductViewScreeen()));

            }, child: Text("Add Product"))
          ],
        ),
      ),
    );
  }
}