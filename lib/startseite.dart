import 'package:flutter/material.dart';

import 'Models/fh_campus_wien.dart';

class Startseite extends StatelessWidget {
  const Startseite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Organisationen',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
              flex: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {}, child: const Text('FH St. Pölten')),
                        TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CustomCard()));
                            },
                            child: const Text('FH Campus Wien')),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {}, child: const Text('PH Leopoldstadt')),
                        TextButton(
                            onPressed: () {},
                            child: const Text('PFA Leopoldstadt')),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 60,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'Gespeicherte Beurteilungen',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}


