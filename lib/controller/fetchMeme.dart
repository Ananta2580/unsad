import 'package:http/http.dart' as http;
import 'dart:convert';


class FetchMeme {
  final Function(String) onUpdateMemeImageUrl;

  FetchMeme({required this.onUpdateMemeImageUrl});

  Future<void> fetchRandomMeme() async {
    try {
      final response = await http.get(Uri.parse('https://api.imgflip.com/get_memes'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final memes = data['data']['memes'];
        final randomMeme = memes[DateTime.now().microsecondsSinceEpoch % memes.length];
        final imageUrl = randomMeme['url'];

        // Call the callback function to update the UI with the valid network URL
        onUpdateMemeImageUrl(imageUrl);
      } else {
        print('Failed to load meme. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching meme: $error');
    }
  }
}
