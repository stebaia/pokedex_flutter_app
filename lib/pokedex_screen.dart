import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_flutter_app/pokedex.dart';

class PokedexListScreen extends StatefulWidget {
  const PokedexListScreen({Key? key}) : super(key: key);

  @override
  State<PokedexListScreen> createState() => _PokedexListScreenState();
}

class _PokedexListScreenState extends State<PokedexListScreen> {
  late List<Pokemon> pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: FutureBuilder<List<Pokemon>>(
            future: fetchPokemonData(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                pokemon = snapshot.data!;
                return SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Pokedex',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridView.count(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      shrinkWrap: true,
                      childAspectRatio: 1.4,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: List.generate(
                          pokemon.length,
                          (index) => _buildCardElementGrid(
                              getColorFromType(pokemon![index].type![0]),
                              pokemon![index].name!,
                              pokemon[index].img!,
                              pokemon[index].type!,
                              Container())))
                ]));
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }

  Color getColorFromType(String type) {
    return type == "Grass"
        ? Colors.greenAccent
        : type == "Fire"
            ? Colors.redAccent
            : type == "Water"
                ? Colors.blue
                : type == "Poison"
                    ? Colors.deepPurpleAccent
                    : type == "Electric"
                        ? Colors.amber
                        : type == "Rock"
                            ? Colors.grey
                            : type == "Ground"
                                ? Colors.brown
                                : type == "Psychic"
                                    ? Colors.indigo
                                    : type == "Fighting"
                                        ? Colors.orange
                                        : type == "Bug"
                                            ? Colors.lightGreenAccent
                                            : type == "Ghost"
                                                ? Colors.deepPurple
                                                : type == "Normal"
                                                    ? Colors.black26
                                                    : Colors.pink;
  }

  Widget _buildCardElementGrid(Color color, String name, String imageUrl,
      List<String> types, Widget function) {
    return Padding(
        padding: EdgeInsets.only(left: 4, right: 4, bottom: 10, top: 10),
        child: GestureDetector(
            onTap: (() => Navigator.push(
                context, MaterialPageRoute(builder: (context) => function))),
            child: Container(
              height: 10,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: buildTypesColumn(name, types),
                        )),
                  ),
                  Positioned(
                      top: 10,
                      left: 80,
                      child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 100,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ))),
                ],
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 5.0,
                ),
              ], color: color, borderRadius: BorderRadius.circular(30)),
            )));
  }

  List<Widget> buildTypesColumn(String name, List<String> types) {
    List<Widget> typesWidget = [];

    typesWidget.add(Text(
      name,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
    ));

    types.forEach((element) {
      typesWidget.add(Container(
        margin: EdgeInsets.only(top: 4),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 5, bottom: 5),
          child: Text(
            element,
            style: TextStyle(color: Colors.white, shadows: [
              BoxShadow(
                  color: Colors.blueGrey,
                  offset: Offset(0, 0),
                  spreadRadius: 1.0,
                  blurRadius: 15)
            ]),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black.withOpacity(0.5)),
      ));
    });
    return typesWidget;
  }

  Future<List<Pokemon>> fetchPokemonData() async {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      final List pokedex = jsonDecode(response.body)["pokemon"];
      return pokedex.map(((e) => Pokemon.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
