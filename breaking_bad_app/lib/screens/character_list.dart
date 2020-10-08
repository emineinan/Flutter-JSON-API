import 'dart:convert';

import 'package:breaking_bad_app/data/character_api.dart';
import 'package:breaking_bad_app/model/character.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  CharacterList({Key key}) : super(key: key);

  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  List<Character> characterList = new List<Character>();

  void getCharactersfromApi() async {
    CharacterApi.getCharacters().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        characterList = list.map((model) => Character.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getCharactersfromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Breaking Bad Characters"),
        ),
        body: Container(
          child: ListView.builder(
              itemCount: characterList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(characterList[index].name),
                  subtitle: Text(characterList[index].nickname),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(characterList[index].img),
                  ),
                );
              }),
        ));
  }
}
