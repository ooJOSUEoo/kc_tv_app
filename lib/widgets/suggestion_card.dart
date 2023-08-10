import 'package:flutter/material.dart';

class SuggestionCard extends StatelessWidget {
  const SuggestionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 250,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
           child: const Image(
             image: AssetImage('assets/images/recomendados.jpg'),
           ),
        ),
         Column(
          children: [
            SizedBox(
              width: 400,
              height: 50,
              child: Text(
                'Juegos favoritos',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              width: 400,
              height: 100,
              child: Text(
                'Revive los mejores videojuegos',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: Text(
                'Duracion: 12:56',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            )
          ],
        )
      ],
    );
  }
}