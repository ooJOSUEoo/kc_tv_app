import 'package:flutter/material.dart';

class Suggestion_Card extends StatelessWidget {
  const Suggestion_Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: const Image(
            image: AssetImage('assets/images/Start.jpg'),
          ),
        ),
         Column(
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: Text(
                'NBA 2023',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            SizedBox(
              width: 300,
              height: 500,
              child: Text(
                'Revive los mejores momentos de la temporada 2022-2023',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(
              width: 300,
              height: 500,
              child: Text(
                'Duracion: 12:56',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        )
      ],
    );
  }
}