//  Aynı sayfada quote gösteren örnek
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_quotes_app/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Random Quoter";
  String quoteText = "";
  String authorName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:
                        Text(quoteText, style: const TextStyle(fontSize: 20))),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text("- $authorName",
                          style: const TextStyle(fontSize: 15))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse('https://api.quotable.io/random');
                      var response = await http.get(url);

                      var data = jsonDecode(response.body);
                      quoteText = data['content'];
                      authorName = data['author'];

                      setState(() {});
                    },
                    child: const Text("Get quote")),
              ],
            )));
  }
}

// // SecondScreen'a giden ve o sayfada quote'ları gösteren Navigasyonlu örnek
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter_quotes_app/screens/second_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             body: Center(
//                 child: ElevatedButton(
//                     onPressed: () async {
//                       var url = Uri.parse('https://api.quotable.io/random');
//                       var response = await http.get(url);

//                       var data = jsonDecode(response.body);
//                       String quoteText = data['content'];
//                       String authorName = data['author'];

//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => SecondScreen(
//                               quoteText: quoteText, authorName: authorName)));
//                     },
//                     child: const Text("Get quote")))));
//   }
// }
