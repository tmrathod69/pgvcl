import 'package:flutter/material.dart';

class Task extends StatefulWidget
{
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("My Task",style: TextStyle(fontSize: 30.00,fontWeight: FontWeight.bold),),),
      body: Center
        (
        child: Column
          (
          children:
          [
            ProfileScreen(),
            LikeCounter(),
            MoodToggle(),
            Footer()




          ],

        ),
      ),
    );
  }
}
class ProfileScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    return Container
      (
      color: Colors.blue.shade50,
      padding:EdgeInsets.all(16.00),
      child: Row
        (
        children:
        [

          CircleAvatar(radius:40,backgroundImage:AssetImage('images/a.jpg'),),
          SizedBox(width: 20,),
          Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
            [
              Text("PGVCL",style: TextStyle(fontSize: 25.00,fontWeight: FontWeight.bold),),
              Text("Flutter Developer",style: TextStyle(fontSize: 20.00),)


            ],
          )
        ],
      ),

    );
  }
}
class LikeCounter extends StatefulWidget
{
  const LikeCounter({super.key});

  @override
  State<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends State<LikeCounter>
{
  int likes = 0;
  @override
  Widget build(BuildContext context)
  {
    return Padding
      (
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column
        (
        children:
        [
          Text('Likes: $likes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ElevatedButton(onPressed: ()
          {
            setState(() {

              likes++;

            });

          }, child: Text("Click Here"))
        ],
      ),

    );
  }
}
class MoodToggle extends StatefulWidget
{
  const MoodToggle({super.key});

  @override
  State<MoodToggle> createState() => _MoodToggleState();
}

class _MoodToggleState extends State<MoodToggle>
{
  bool _isHappy = true;

  @override
  Widget build(BuildContext context) {
    return Column
      (
      children:
      [
        Text("Current Mood:"),
        Text(
          _isHappy ? '😊 Happy' : '😔 Sad',
          style: TextStyle(fontSize: 24),
        ),
        TextButton(onPressed: ()
        {

          moodchange();

        }, child: Text("Change Mood"))

      ],
    );
  }

  moodchange()
  {
    setState(() {

      _isHappy = !_isHappy;

    });

  }
}
class Footer extends StatelessWidget
{
  const Footer({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Center
      (
      child: Text("Powered By Flutter",style: TextStyle(fontSize: 30.00),),
    );
  }
}