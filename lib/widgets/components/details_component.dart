import 'package:flutter/material.dart';
import 'package:flutter1/models/characters.dart';
import 'package:intl/intl.dart';

class DetailComponent {
  const DetailComponent({required this.character});

  final HarryPotterCharacters character;

  Card GetCharacterCard() {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _GetCharacterInfo(),
          ListBody(
            children: [
              _GetDateOfBirth(),
              _GetHouse(),
            ],
          )
        ],
      ),
    );
  }

  ListTile _GetCharacterInfo() {
    return ListTile(
      title: Text(character.name),
      subtitle: Text(character.actor),
      leading: CircleAvatar(
        backgroundImage:
            character.image.isNotEmpty ? NetworkImage(character.image) : null,
        backgroundColor: Colors.red,
      ),
      tileColor: Colors.limeAccent,
    );
  }

  ListTile _GetDateOfBirth() {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    var birthDate = dateFormat.parse(character.dateOfBirth);

    return ListTile(
      shape: Border(
        top: BorderSide(width: 0.5),
        bottom: BorderSide(width: 0.5),
      ),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      tileColor: Colors.deepOrangeAccent,
      textColor: Colors.white,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text('Date of birth:'),
          ),
          Text(DateFormat("dd.MM.yyyy").format(birthDate)),
        ],
      ),
    );
  }

  ListTile _GetHouse() {
    return ListTile(
      shape: Border(
        top: BorderSide(width: 0.5),
        bottom: BorderSide(width: 0.5),
      ),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      tileColor: Colors.blueAccent,
      textColor: Colors.white,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Text('House:'),
          ),
          Text(character.house),
        ],
      ),
    );
  }
}
