
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget
{
  const AudioFile({super.key});

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile>
{
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(title: Text("Music"),),
      body: Center
        (
        child: Column
          (
          children:
          [
            ElevatedButton(onPressed: ()
            {
              player.play(UrlSource("https://prakrutitech.buzz/AndroidAPI/audio.mp3"));
            }, child: Text("Play")),
            ElevatedButton(onPressed: ()
            {
              player.stop();
            }, child: Text("Stop")),

          ],
        ),
      ),
    );
  }
}
