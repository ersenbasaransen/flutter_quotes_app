import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_quotes_app/screens/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse('https://api.quotable.io/random');
                      var response = await http.get(url);
                      // print('Response status: ${response.statusCode}');
                      // print('Response body: ${response.body}');

                      var data = jsonDecode(response.body);
                      String quoteText = data['content'];
                      String authorName = data['author'];

                      print(quoteText);
                      print(authorName);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondScreen(
                              quoteText: quoteText, authorName: authorName)));
                    },
                    child: const Text("Go to next screen")))));
  }
}
