import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:voice_calculator/utils/basicArithmeticOperations.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  stt.SpeechToText speech = stt.SpeechToText();
  SpeechToText _speechToText = SpeechToText();
  String _answer = "";
  bool _speechEnabled = false;
  String _equation = '';

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _equation = result.recognizedWords;
      if (_equation.contains("+")) {
        _answer = Calculate(_equation, "+");
      } else if (_equation.contains("-")) {
        _answer = Calculate(_equation, "-");
      } else if (_equation.contains("/")) {
        _answer = Calculate(_equation, "/");
      } else if (_equation.contains("*")) {
        _answer = Calculate(_equation, "*");
      } else {
        _equation = "I don't understand. Can you repeat that, please?";
      }
    });
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((_equation != "")
                ? _equation
                : 'Say something like 2+3 (2 plus 3) or 6/2 (six divide 2)'),
            Text("Answer: $_answer"),
            ElevatedButton(
                onPressed: () {
                  if (_speechToText.isNotListening) {
                    _startListening();
                  } else {
                    _stopListening();
                  }
                },
                child: Text("Four Operations!"))
          ],
        ),
      )),
    );
  }
}
