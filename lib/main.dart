import 'package:african_countries/components/countries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'African Countries',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemCount: countryList.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(1, 2),
                      ),
                    ]),
                //tech-zanuda
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      countryList[index].flag,
                      width: 75,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      countryList[index].name,
                      style: GoogleFonts.geologica(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        text: 'Площадь: ',
                        style: GoogleFonts.geologica(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                      ),
                      TextSpan(
                          text: NumberFormat('#,###')
                              .format(countryList[index].size),
                          style: GoogleFonts.geologica(
                              textStyle: const TextStyle(color: Colors.white))),
                      TextSpan(
                          text: ' км',
                          style: GoogleFonts.geologica(
                              textStyle: GoogleFonts.geologica(
                                  textStyle:
                                      const TextStyle(color: Colors.white)))),
                      TextSpan(
                          text: '\u00B2',
                          style: GoogleFonts.geologica(
                              textStyle: GoogleFonts.geologica(
                                  textStyle:
                                      const TextStyle(color: Colors.white))))
                    ])),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Население: ',
                          style: GoogleFonts.geologica(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))),
                      TextSpan(
                          text: NumberFormat('#,###')
                              .format(countryList[index].population),
                          style: GoogleFonts.geologica(
                              textStyle: const TextStyle(
                            color: Colors.white,
                          )))
                    ])),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
