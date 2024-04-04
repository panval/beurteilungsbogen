import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomCardPlayground extends StatefulWidget {
  const CustomCardPlayground({super.key});

  @override
  State<CustomCardPlayground> createState() => _CustomCardPlaygroundState();
}

class _CustomCardPlaygroundState extends State<CustomCardPlayground> {
  int sum = 0;
  int count = 0;
  double average = 0;



  final List<String> kategorien = [
    //1
    'Son',
    //2
    'P',
    //3
    'Oy',
    //4
    'N',
    //5
    'Gy',
    //6
    'Puy',
    //7
    'Ey',
    //8
    'Ny',
    //9
    'Ry',
    //10
    'Dy',
    //11
    'Ay',
    //12
    'Py',
  ];
  final List<String> cardTitles = [
    //1
    'Zeiu.',
    //2
    'Ps',
    //3
    'Oy',
    //4
    'N',
    //5
    'G',
    //6
    'y',
    //7
    'En',
    //8
    'y',
    //9
    'Ry',
    //10
    'Dy',
    //11
    'Agy',
    //12
    'Py',
  ];
  final List<String> cardDescriptions = [
    //1
    'Sti.',
    //2
    'Pnts.',
    //3
    'Oner.',
    //4
    'Nm.',
    //5
    'Grs.',
    //6
    'Put.',
    //7
    'Em.',
    //8
    'Nes.',
    //9
    'Rs.',
    //10
    'Dn.',
    //11
    'Allm.',
    //12
    'Ps.',
  ];

  List<int> ratings = List.filled(12, 0);
  List<bool> optedOut = List.filled(12, false);

  String getTextBasedOnResult(double average) {
    if (average <= 1.50) {
      return 'n1';
    } else if (average <= 2.50) {
      return 'n2';
    } else if (average <= 3.50) {
      return 'n3';
    } else if (average <= 4.00) {
      return 'n4';
    } else {
      return 'n5';
    }
  }

  void calculateAverageRating() {
    int newSum = 0;
    int newCount = 0;
    for (int i = 0; i < ratings.length; i++) {
      if (!optedOut[i] && ratings[i] > 0) {
        newSum += ratings[i];
        newCount++;
      }
    }
    setState(() {
      sum = newSum;
      count = newCount;
      average = count > 0 ? sum / count.toDouble() : 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Row(
              children: [
                Text('Berechnung und Note '),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          '$sum Punkte : $count Aufgaben = ${average.toStringAsPrecision(3)} = '),
                      Text(
                          '${average.round()} ${getTextBasedOnResult(average)}')
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: CarouselSlider.builder(
                  itemCount: cardTitles.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 20, // Shadow position
                            ),
                          ],
                          color: Theme.of(context).canvasColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 20,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AutoSizeText(
                                    kategorien[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 30,
                            child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                child: AutoSizeText(
                                  cardTitles[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color:
                                      Theme.of(context).primaryColorDark),
                                )),
                          ),
                          Expanded(
                            flex: 70,
                            child: Scrollbar(
                              thumbVisibility: true,
                              thickness: 7,
                              controller: ScrollController(
                              ),
                              child: SingleChildScrollView(
                                  controller: ScrollController(),
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(cardDescriptions[index])),
                            ),
                          ),
                          if (!optedOut[index])
                            Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 20,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Colors.green.shade100,
                                          Colors.red.shade100
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '  Gut',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('Schlecht  ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: List<Widget>.generate(5, (int i) {
                                    return Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Radio<int>(
                                          value: i + 1,
                                          groupValue: ratings[index],
                                          onChanged: (int? value) {
                                            setState(() {
                                              ratings[index] = value ?? 0;
                                              calculateAverageRating();
                                            });
                                          },
                                        ),
                                        Text('${i + 1}'),
                                      ],
                                    );
                                  }),
                                ),
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              const Text('nicht relevant: '),
                              Checkbox(
                                value: optedOut[index],
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    optedOut[index] = newValue ?? false;
                                    if (newValue == true) {
                                      ratings[index] = 0;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.keyboard_double_arrow_left),
                                Text('wischen'),
                                Icon(Icons.keyboard_double_arrow_right)
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.38,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.93,
                    scrollDirection: Axis.horizontal,
                    animateToClosest: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
