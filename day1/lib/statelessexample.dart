import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// App Root (Stateless Widget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless & Stateful Widgets',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProfileScreen(),
    );
  }
}

// Profile Screen (Stateless Widget)
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Column(
        children: [
          ProfileHeader(), // Stateless Widget
          LikeCounter(), // Stateful Widget
          MoodToggle(), // Stateful Widget
          Footer(), // Stateless Widget
        ],
      ),
    );
  }
}

// Profile Header (Stateless Widget)
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade50,
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/avatar.webp'), // Add your image
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Flutter Developer', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

// Like Counter (Stateful Widget)
class LikeCounter extends StatefulWidget {
  @override
  _LikeCounterState createState() => _LikeCounterState();
}

class _LikeCounterState extends State<LikeCounter> {
  int _likes = 0;

  void _incrementLikes() {
    setState(() {
      _likes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text('Likes: $_likes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          ElevatedButton(
            onPressed: _incrementLikes,
            child: Text('Like'),
          ),
        ],
      ),
    );
  }
}

// Mood Toggle (Stateful Widget)
class MoodToggle extends StatefulWidget {
  @override
  _MoodToggleState createState() => _MoodToggleState();
}

class _MoodToggleState extends State<MoodToggle> {
  bool _isHappy = true;

  void _toggleMood() {
    setState(() {
      _isHappy = !_isHappy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Current Mood:', style: TextStyle(fontSize: 18)),
        Text(
          _isHappy ? '😊 Happy' : '😔 Sad',
          style: TextStyle(fontSize: 24),
        ),
        TextButton(
          onPressed: _toggleMood,
          child: Text('Change Mood'),
        ),
      ],
    );
  }
}

// Footer (Stateless Widget)
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Powered by Flutter',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }
}