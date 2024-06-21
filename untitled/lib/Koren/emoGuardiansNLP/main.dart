import 'package:flutter/material.dart';
import 'openai_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenAI Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final OpenAIService openAIService = OpenAIService('YOUR_OPENAI_API_KEY');
  String _generatedText = '';
  String myInput = 'Translate the following English text to French: "Hello, how are you?"';

  void _generateText() async {
    try {
      final text = await openAIService.emoGuardiansNLP(myInput);
      setState(() {
        _generatedText = text;
      });
    } catch (e) {
      setState(() {
        _generatedText = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenAI Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _generateText,
                child: Text('Generate Text'),
              ),
              SizedBox(height: 20),
              Text(
                _generatedText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
