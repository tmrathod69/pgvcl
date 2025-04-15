import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumber extends StatefulWidget
{
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber>
{
  final TextEditingController _controller = TextEditingController();
  late int _targetNumber;
  String _hint = '';
  int _attempts = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateNewNumber();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        appBar: AppBar(title: Text("Random Number"),),
        body: Center(
          child: Padding
            (
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'I\'m thinking of a number between 1 and 13.\nCan you guess it?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Enter your guess',
                    border: OutlineInputBorder(),
                  ),
                  //onSubmitted: (_) => _checkGuess(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _checkGuess,
                  child: const Text('Submit Guess'),
                ),
                const SizedBox(height: 20),
                Text(
                  _hint,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _hint.contains('🎉') ? Colors.green : Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                // TextButton(
                //   onPressed: _generateNewNumber,
                //   child: const Text('🔁 Restart Game'),
                // ),
              ],
            ),
          ),
        ),
    );
  }

  void _checkGuess()
  {
    final guessText = _controller.text;
    if (guessText.isEmpty) return;
    final guess = int.parse(guessText);

    if (guess == null || guess < 1 || guess > 13)
    {
      setState(()
      {
        _hint = 'Enter a number between 1 and 13!';
      });
      return;
    }

    _attempts++;

    if (guess < _targetNumber) {
      setState(() {
        _hint = 'Too Low!';
      });
    } else if (guess > _targetNumber) {
      setState(() {
        _hint = 'Too High!';
      });
    } else {
      setState(() {
        _hint = '🎉 You got it in $_attempts tries!';
      });
    }

    _controller.clear();
  }

  void _generateNewNumber()
  {
    final random = Random();
    _targetNumber = random.nextInt(13) + 1;
    _hint = '';
    _attempts = 0;
    _controller.clear();
    setState(() {});

  }
}
