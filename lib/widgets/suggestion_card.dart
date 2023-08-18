import 'package:flutter/material.dart';
import 'package:kc_tv_app/model/item.dart';
import 'package:kc_tv_app/screens/player_screen.dart';

class SuggestionCard extends StatefulWidget {
  final Item item;

   const SuggestionCard({super.key, required this.item});

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {


  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         SizedBox(
           width: 550,
           height: 350,
           child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: GestureDetector(
                onTap: () { 
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerScreen(url: widget.item.url.toString())));
                },
                child: Image(
                      image: AssetImage(widget.item.miniatura.toString() ),
                    ),
                ),
              ),
         ),
        const SizedBox (width: 20.0,),
        Column(
          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: Text(
                widget.item.title.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              width: 305,
              height: 120,
              child: Text(
                    widget.item.descripcion.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Text('Fecha:  ${widget.item.fecha.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: Text('Duración: ${widget.item.duracion.toString()}',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.justify,
              ),
            ),
          ],          
        ),
      ],
    );
  }
}