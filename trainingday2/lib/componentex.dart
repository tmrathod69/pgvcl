import 'package:flutter/material.dart';

class CustomComponentsApp  extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
      home: MyComp(),
    );

  }
}
class MyComp extends StatelessWidget
{
  const MyComp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("My Component"),),
        body: Center
          (
          child: SingleChildScrollView
            (
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                SectionTitle(title: 'Custom Buttons',),
                CustomButtonSection(),
                Divider(),
                SectionTitle(title: 'Custom TextField',),
                CustomTextField(),
                Divider(),
                SectionTitle(title: 'Custom Card',),
                MyCard(),
                Divider(),
                SectionTitle(title: 'Custom Switch and Slider',),
                SliderandSwitch()
              ],
            ),
          ),
        )
    );
  }
}

class SectionTitle extends StatelessWidget
{
  String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context)
  {
    return Padding
      (
      padding: EdgeInsets.all(16.00),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
      ),);
  }
}
class CustomButtonSection extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Row
      (
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:
      [
        ElevatedButton(onPressed: ()
        {

        }, child: Text("Button 1"),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),),
        OutlinedButton(onPressed: ()
        {

        }, child: Text("Button 2"),
          style: OutlinedButton.styleFrom(
            primary: Colors.blue,
            side: BorderSide(color: Colors.blue, width: 2),
          ),),
        TextButton(onPressed: ()
        {

        }, child: Text("Button 3"), style: TextButton.styleFrom(primary: Colors.blue),)

      ],
    );
  }
}
class CustomTextField extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Column
      (
      children:
      [
        TextField
          (
          //obscureText: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration
            (
            labelText: 'Name',
            labelStyle: TextStyle(color: Colors.blue),
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

          ),
        )

      ],
    );
  }

}
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Column
      (
      //crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card Title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('This is a customizable card with an attractive UI.'),
                ],
              ),
            )),
        SizedBox(height: 16),
        Card(
          elevation: 5,
          color: Colors.blue.shade50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text('Card with Icon'),
            subtitle:Column
              (
              children:
              [
                Text('This card contains an icon for a modern look.'),
                //Text('This card contains an icon for a modern look.'),

              ],
            ),
            trailing: Icon(Icons.add),
          ),
        ),





      ],

    );
  }
}
class SliderandSwitch extends StatefulWidget {
  const SliderandSwitch({super.key});

  @override
  State<SliderandSwitch> createState() => _SliderandSwitchState();
}

class _SliderandSwitchState extends State<SliderandSwitch> {

  bool _isSwitched = false;
  double _sliderValue = 50;
  var gender = "male";


  @override
  Widget build(BuildContext context)
  {
    return Column
      (
      children:
      [

        Switch(value: _isSwitched,
            onChanged: (value)
            {
              setState(() {
                _isSwitched = value;

              });
            }),
        SizedBox(height: 16,),

        Slider(value: _sliderValue, onChanged: (value)
        {
          setState(() {

            _sliderValue=value;

          });
        },
          min: 0,
          max: 100,
        ),
        CheckboxListTile(value: true,
            onChanged: (value)
            {
              setState(() {

              });
            }),
        RadioListTile(
          title: Text('radio1'),
          value: gender,

          onChanged: (value)
          {
            setState(() {

              gender = value!;

            });
          }, groupValue: 'radio',

         )



      ],
    );
  }
}