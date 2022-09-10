import 'package:flutter/material.dart';
import 'package:flutter1/services/character_service.dart';

import 'models/characters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harry Potter Characters List',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(
        title: 'Harry Potter Characters List',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HarryPotterService _service = new HarryPotterService();

  List<HarryPotterCharacters> characters = <HarryPotterCharacters>[];
  bool isLoaded = false;

  void _emptyState() {
    setState(() {
      characters.clear();
      isLoaded = false;
    });
  }

  void _getCharacters() async {
    _emptyState();

    var harryPotterCharacters = await _service.FetchCharacters();

    setState(() {
      characters = harryPotterCharacters;
      isLoaded = characters.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emptyState();
    _getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: !isLoaded
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.amberAccent,
              ),
            )
          : ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                var character = characters[index];
                var scaffoldMessenger = ScaffoldMessenger.of(context);

                return ListTile(
                  onTap: () {
                    scaffoldMessenger.removeCurrentSnackBar();

                    String houseName = character.actor;

                    scaffoldMessenger.showSnackBar(SnackBar(
                      content: Text(houseName),
                    ));
                  },
                  title: Text(character.name),
                  subtitle: Text(character.house),
                  leading: CircleAvatar(
                    backgroundImage: character.image.isNotEmpty
                        ? NetworkImage(character.image)
                        : null,
                    backgroundColor: Colors.red,
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getCharacters();
        },
        tooltip: 'Fetch Characters',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
