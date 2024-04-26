import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthArt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Art of the Month:",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.bold)
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: Image.asset("assets/images/month.png", fit: BoxFit.cover,)
              ),
              Text(
                "Girl with a Pearl Earring",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(fontSize:30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.blue[300]!,
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("By App Contributor"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "One of the most recognizable artworks in history, there is chance that you are familiar with this image, but are you familiar with its creation and history?",
                  style: GoogleFonts.openSans(fontSize:15, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Girl with a Pearl Earring, oil painting on canvas (c. 1665) by Dutch artist Johannes Vermeer, one of his most well-known works. It depicts an imaginary young woman in exotic dress and a very large pearl earring. The work permanently resides in the Mauritshuis museum in The Hague.",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Girl with a Pearl Earring represents a young woman in a dark shallow space, an intimate setting that draws the viewer’s attention exclusively on her. She wears a blue and gold turban, the titular pearl earring, and a gold jacket with a visible white collar beneath. Unlike many of Vermeer’s subjects, she is not concentrating on a daily chore and unaware of her viewer. Instead, caught in a fleeting moment, she turns her head over her shoulder, meeting the viewer’s gaze with her eyes wide and lips parted as if about to speak. Her enigmatic expression coupled with the mystery of her identity has led some to compare her to the equivocal subject in Leonardo da Vinci's Mona Lisa (c. 1503 - 19). ",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/earring2.png"), fit: BoxFit.contain)
                ),
              ),
              Text(
                "Spectator enjoying the painting",
                style: GoogleFonts.openSans(fontSize: 13, fontStyle: FontStyle.italic),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Although now a highly regarded artist, Vermeer was not well known outside of his native city of Delft during his lifetime or in the decades after. Historians credit the 19th-century French critic Étienne-Joseph-Théophile-Thoré (under the pseudonym of William Bürger) for reassessing the artist’s work, which eventually led to Vermeer’s distinguished reputation. Even so, Girl with a Pearl Earring became one of Vermeer’s more famous pieces only around the turn of the 21st century, with the 1995 blockbuster exhibition at the National Gallery of Art in Washington, D.C., and the publication of the best-selling novel Girl with a Pearl Earring by Tracy Chevalier in 1999. The book fashioned the painting’s subject into a housemaid named Griet who works in Vermeer’s home and becomes his paint mixer. It was adapted into an Oscar-nominated film in 2003 starring Scarlett Johansson as the fictional Griet and Colin Firth as Vermeer.",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/vermeer.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
              Text(
                "Another one of Vermeer's works",
                style: GoogleFonts.openSans(fontSize:13, fontStyle: FontStyle.italic),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "We hope you enjoyed this months' edition of 'Art of the Month' where you learn more about singular pieces of artworks and their interesting backgrounds. Stayed Tuned for next month's edition!",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
