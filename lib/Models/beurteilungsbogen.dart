import 'package:beurteilungsbogen/Models/fh_campus_wien.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Beurteilungsbogen extends StatefulWidget {
  const Beurteilungsbogen({super.key});

  @override
  State<Beurteilungsbogen> createState() => _BeurteilungsbogenState();
}

class _BeurteilungsbogenState extends State<Beurteilungsbogen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Beurteilungsbogen'),
            surfaceTintColor: Theme.of(context).canvasColor,
          ),
          body: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 10, // Shadow position
                            ),
                          ],
                          color: Theme.of(context).canvasColor,),
                      child: Column(
                        children: [
                          const Center(child: AutoSizeText('Berechnung: Punkte / Kompetenzen = Ergebnis = Note'),),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Punkte / Kompetenzen = Ergebnis = Note'),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.save))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(
                    flex: 80,
                    child: CustomCard(),
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
