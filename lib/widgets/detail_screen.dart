import 'package:flutter/material.dart';
import 'package:flutter1/models/characters.dart';
import 'package:flutter1/widgets/components/details_component.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({required this.character});

  final HarryPotterCharacters character;

  @override
  Widget build(BuildContext context) {
    DetailComponent _detailComponent =
        new DetailComponent(character: character);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Container(
        child: _detailComponent.GetCharacterCard(),
      ),
    );
  }
}
