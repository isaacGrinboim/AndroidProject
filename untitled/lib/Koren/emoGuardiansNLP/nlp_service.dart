import 'package:http/http.dart' as http;
import 'dart:convert';

class NLPService {
  final String apiKey;

  NLPService(this.apiKey);

  Future<String> emoGuardiansNLP(String input) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': input}
        ],
        'max_tokens': 50,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to generate text: ${response.body}');
    }
  }
}
