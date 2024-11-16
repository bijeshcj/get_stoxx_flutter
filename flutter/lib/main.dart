import 'package:flutter/material.dart';
import 'package:get_stoxx_flutter/screens/home/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gett Stox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GeTT Stox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _addStock(){
     fetchWebContent().then((value) => print(value));
  }

  Future<String> fetchWebContent() async {
    final response = await http.get(Uri.parse('https://www.google.com/finance/quote/INFY:NSE?hl=en'));

    if (response.statusCode == 200) {
      // print(response.body);
      var document = parser.parse(response.body);
      // Use a CSS selector or any other method to get the specific content
      var specificContent = document.querySelector('div.YMlKec.fxKbKc')?.text ?? 'Content not found';
      return specificContent;
    } else {
      throw Exception('Failed to load content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStock,
        tooltip: 'Add Stock',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
