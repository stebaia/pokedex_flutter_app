import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex_flutter_app/pokedex_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 227, 227),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('pokeball.png'),
                                  colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.2),
                                    BlendMode.modulate,
                                  ))),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'What Pokemon are you looking for?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 36),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 238, 235, 235),
                              width: 0.0),
                          borderRadius: BorderRadius.circular(30)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 238, 235, 235),
                              width: 0.0),
                          borderRadius: BorderRadius.circular(30)),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 238, 235, 235),
                              width: 0.0),
                          borderRadius: BorderRadius.circular(30)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 238, 235, 235),
                              width: 0.0),
                          borderRadius: BorderRadius.circular(30)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 235, 235),
                      hintText: 'Search pokemon, Move, Ability etc',
                    ),
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: 1.6,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: [
                        _buildCardElementGrid(
                            Color(0xff49D0B0), 'Pokedex', PokedexListScreen()),
                        _buildCardElementGrid(
                            Color(0xffF7776A), 'Moves', PokedexListScreen()),
                        _buildCardElementGrid(Color(0xff59A9F4), 'Abilities',
                            PokedexListScreen()),
                        _buildCardElementGrid(
                            Color(0xffFFCF49), 'Items', PokedexListScreen()),
                        _buildCardElementGrid(Color(0xff7A538C), 'Locations',
                            PokedexListScreen()),
                        _buildCardElementGrid(Color(0xffB1736D), 'Type Charts',
                            PokedexListScreen())
                      ])
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pokemon News',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 200,
                            child: Column(
                              children: [
                                Text(
                                  'Pokemon Scarlett and Violett Arrives Soon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '19 Aug 2022',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'violetto.jpg',
                                width: 120,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ))
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 200,
                            child: Column(
                              children: [
                                Text(
                                  'Pokemon Scarlett and Violett Arrives Soon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '19 Aug 2022',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'violetto.jpg',
                                width: 120,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ))
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 200,
                            child: Column(
                              children: [
                                Text(
                                  'Pokemon Scarlett and Violett Arrives Soon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '19 Aug 2022',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'violetto.jpg',
                                width: 120,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ))
                      ],
                    ),
                    Divider(),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildCardElementGrid(Color color, String name, Widget function) {
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
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                  ),
                  Positioned(
                      top: 10,
                      left: 80,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('pokewhite.png'),
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.2),
                                  BlendMode.modulate,
                                ))),
                      )),
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
}
