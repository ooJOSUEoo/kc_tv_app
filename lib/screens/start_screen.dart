
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kc_tv_app/model/items.dart';
import 'package:kc_tv_app/screens/list_screen.dart';
import 'package:kc_tv_app/widgets/suggestion_card.dart';


class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  Items _itemsAll = Items();
  Items _itemsLive = Items();
  Items _itemsShorts = Items();
  int _randomIndex = 0;
  int _selectedIndex = 0;

  // Fetch content from the json file
  Future<void> readJson(String fileName, String key, Function callback) async {
    try {
      final String response = await rootBundle.loadString('assets/jsons/$fileName.json');
      final data = await json.decode(response);
      callback(data[key]);
      if (data[key].isEmpty) {
            print('$key list is empty');
      } else if (!data[key][0].containsKey('title')) {
            print('First element in $key list does not have a title property');
      } else {
            // Access the title property here
            print('$key list: ${data[key][0]['miniatura']}');
      }
     } catch (e, stacktrace) {
      print('$fileName.json --> $e');
      print('$fileName.json --> $stacktrace');
    }
  }

  @override
  void initState() {
    super.initState();
  
    // Getting a random index of the items for the recommendations
    Random random = Random();
    _randomIndex = random.nextInt(2)+1;
  }

  @override
  Widget build(BuildContext context) {
  Items itemsSelected = Items();
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(1.0),
          // child: Image.asset(
          //   "assets/images/miniaturas/retro.jpg",
          // ),
        ),
        title: Text(
          'Games Tv',
          style: Theme.of(context).textTheme.headlineLarge,
          ),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              '    Recomendado para ti',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 20,),
            FutureBuilder(
                  future: Future.wait([
                      readJson('all', 'all', (data) => _itemsAll = Items.fromJsonList(data)),
                      readJson('live', 'live', (data) => _itemsLive = Items.fromJsonList(data)),
                      readJson('shorts', 'shorts', (data) => _itemsShorts = Items.fromJsonList(data)),
                  ]).catchError((error) {
                      // Maneja el error aquí
                      print(error);
                      return [];
                  }),
                  builder: (context, snapshot) {
                    
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        // Muestra un mensaje de error
                        return const Text('Ocurrió un error al cargar los datos'); 
                      } else {
                        if (_randomIndex >= 0 && _randomIndex < _itemsAll.items.length) {
                            return SuggestionCard(item: _itemsAll.items[_randomIndex]);
                          } else {
                            return const SizedBox.shrink(); // or return an empty widget
                          }
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
          ],
        ),
      ), 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.live_tv,
              color: Colors.red,
              ),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_movies_outlined,
              color: Colors.red,
            ),
            label: 'Shorts',
          ),
        ],
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.red,
        unselectedLabelStyle: const TextStyle(color: Colors.red, fontSize: 14),
        fixedColor: Colors.red,
        onTap: (index) {
          //print('index: $index');
          
          if (index == 0) {
            itemsSelected = _itemsAll;
          } else if (index == 1) {
            itemsSelected = _itemsLive;
          } else if (index == 2) {
            itemsSelected = _itemsShorts;
          }
          setState(() {
            _selectedIndex = index;
            itemsSelected = itemsSelected;
        });
        //print('SelectedIndex: $_selectedIndex');
        Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(listItems: itemsSelected)));
          //Navigator.of(context).pushNamed('ListScreen', arguments: itemsSelected);
        },
      ),
    );
  }
}