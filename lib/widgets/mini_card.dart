import 'package:flutter/material.dart';
import 'package:kc_tv_app/model/item.dart';
import 'package:kc_tv_app/screens/player_screen.dart';

class MiniCard extends StatefulWidget {

  final Item item;

  const MiniCard({super.key, required this.item});

  @override
  State<MiniCard> createState() => _MiniCardState();
}

class _MiniCardState extends State<MiniCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Card(
        margin: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        color: Color.fromARGB(255, 240, 152, 137),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 20,),
              _cardImage(),
              const SizedBox(width: 50,),
              _texts(),                        
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardImage(){
    return SizedBox(
      width: 250,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () { 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(url: widget.item.url.toString())));
                },
        
          child: Image.asset(widget.item.miniatura.toString()),
        ),
      ),
    );
  }

  Widget _texts(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
              width: 450,
              height: 50,
              child: Text(
                    widget.item.title.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Text(
                  'Fecha:  ${widget.item.fecha.toString()}',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(width: 20,),        
                Text(
                      'Duración:  ${widget.item.duracion.toString()}',
                      style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            )
        ],
    );
  }

}