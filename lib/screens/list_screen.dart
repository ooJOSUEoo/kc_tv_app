import 'package:flutter/material.dart';
import 'package:kc_tv_app/model/items.dart';
import 'package:kc_tv_app/widgets/mini_card.dart';


class ListScreen extends StatefulWidget {

  final Items listItems; 


  const ListScreen({super.key, required this.listItems});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
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
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: 
               IconButton(
                icon: const Icon(
                  Icons.reply_outlined,
                  color: Colors.white,
                  size: 32,
                ),
                tooltip: 'Regresar al inicio', 
                onPressed: () {  
                  Navigator.pop(context);
                },  
              ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.listItems.items.length,
        itemBuilder: (BuildContext context, int index) {
          return MiniCard(item: widget.listItems.items[index]);
        }
      ),
    );
  }
}