import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class myTxt2speech extends StatefulWidget {
  const myTxt2speech({super.key});

  @override
  State<myTxt2speech> createState() => _myTxt2speechState();
}

class _myTxt2speechState extends State<myTxt2speech> {
  final mText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
         appBar: AppBar(title: Text('Text To Speech'),),
         body: Center
           (
             child: Column
               (
                 children:
                 [
                    TextField
                      (
                       controller: mText,
                    ),
                   ElevatedButton
                     (onPressed: () => listenText(mText),
                       child: Text('Listen'))
                 ],
             )
           ),
    );
  }

  void listenText(mText)
  {
    TextToSpeech tts = TextToSpeech();
    tts.speak(mText);
  }
}
