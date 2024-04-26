import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Spotlight extends StatelessWidget {
  const Spotlight({super.key});

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
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/vangogh.png"))),
              ),
              Text(
                "Spotlight: Vincent Van Gogh",
                style: GoogleFonts.openSans(
                    fontSize: 40, fontWeight: FontWeight.bold),
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
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Our App's spotlight article is dedicated to introducing or informing you of some of the most influential artists of all time, we hope you enjoy this edition of Spotlight",
                  style: GoogleFonts.openSans(fontSize: 15, fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Vincent Van Gogh is possibly one of the most well known artists of all time, most recognized for his works like 'Starry Night' and his self portraits. Born on March 30, 1853 in Zundert Netherlands, Van Gogh has created approximatly 2100 paintings throughtout his life",
                    style: GoogleFonts.openSans(fontSize: 15)),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Van Gogh was largely self taught, initially copying prints and studiying manuals and lesson books. He then went on to master black and white before working with color. His attention to detail and aim for perfection are something to admire. He went on to travel to places such as the Netherlands and France in hopes of mastering his craft and finding a community of artists.",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/vangogh1.png"), fit: BoxFit.contain)
                ),
              ),
              Text(
                "One of Van Gogh's earlier paintings",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(fontSize:12, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Van Gogh might have been a bit too dedicated to his arts, after finding some success he moved to Arles, in his famous 'Yellow House' where he would spend his earnings on paint instead of food. In December 1888, Van Gogh was living purely off of coffee, bread, and absinthe, and found himself feeling sick and deranged. ",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Around this time, it was clear that he was suffering both physically and mentally, and was known to consume paint and turpentine. After going through a medical emergency, he checked himself into a mental asylum after a petition was made by the people of Arles which stated that Vincent Van Gogh was a danger to himself and others.",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/vangogh2.png"), fit: BoxFit.contain)
                ),
              ),
              Text(
                "Van Gogh's famous yellow house",
                style: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "On July 27, 1890, Van Gogh went out to paint carrying a loaded gun and shot himself in the chest. The bullet did not kill him, but he was found bleeding in his room. On July 29,  Van Gogh died in his brothers arms.",
                  style: GoogleFonts.openSans(fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    "Of course, Van Gogh just like any indvidual should not be defined by his struggles and mental health issues. Van Gogh was a talented artist who's works deserve appreciation",
                    style: GoogleFonts.openSans(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
