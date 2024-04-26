// additional screens that make the app more immersive

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mediums extends StatelessWidget {
  const Mediums({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                "Let's Talk Art Mediums",
                style: GoogleFonts.openSans(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(
                  "By App Contributor",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "\tWe speak about the Renaissance and Baroque eras of art, we speak about the Picassos and the Van Goghs, But something that does not get discussed enough are the choice of art mediums that is incorporated into every piece",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "\t What are art mediums? Art Mediums are defined as materials used to create art. A broad definition right? Well that's because almost anything can create art if you really think about it. The world is your canvas as well as your medium!",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "\tWhat are some popular art mediums? Here are a few:",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        "Watercolor",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 200,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/watercolor.png"), fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "\tWatercolor is a painting method where the paints are made of pigments suspended in a water based solution. If you are interested in seeing some watercolor paintaings check out Catherdral of Llanduff by Paul Sandby or Place de Diaghilev by Benmansour",
                          style: GoogleFonts.openSans(fontSize:15),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Pastels",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 200,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/pastels.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Pastel is made from one or several finely ground pigments, a pulverized inert white filler such as ground calcium carbonate or kaolin, and a minuscule amount of binder such as gum tragacanth. This art medium is used notably by Leonardo Da Vincim and can be found in various different forms such as loose powdered, pencils, and most often in stick form",
                          style: GoogleFonts.openSans(fontSize:15),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Photography",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 200,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/photography.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "\tYes! Believe it or not photography is considered to be an art medium, as mentioned before the world is both your canvas and your source. Capturing images can tell stories and provide real life imagery that is both pleasing and meaningful to any one who enjoys art.",
                          style: GoogleFonts.openSans(fontSize:15),
                        ),
                      ),
                      Text(
                        "Ceramics",
                        style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 200,
                        width: 350,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/ceramics.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Ceramics is one of the more ancient forms of art and refers to any art made from ceramic materials, including clay. It can take on various forms such as pottery, tablewares, figurines, and other sculptures.",
                          style: GoogleFonts.openSans(fontSize:15),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "These five art mediums that were talked about are only a few, we didn't even get to mention digital art, oil paintings, charcoal and so on. Anything can be turned into art if you have the mind and ideas for it!",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
