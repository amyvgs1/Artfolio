import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips extends StatelessWidget{
  const Tips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/artist.png"), fit: BoxFit.contain)
                ),
              ),
              Text(
                "Tips on How to be a Better Artist",
                style: GoogleFonts.openSans(fontSize:30, fontWeight: FontWeight.bold),
              ),
              Card(
                color: Colors.red[300]!,
                child: ListTile(
                  leading: const Icon(Icons.person_2),
                  title: Text(
                    "By App Contributor",
                    style: GoogleFonts.openSans(fontSize:20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Art is a way in which we express ourselves, the multitudes of emotions that we experience can be turned into a visual piece that can be enjoyed by anyone. In this article, we are going to discuss some tips that you can follow to flourish and grow as an artist.",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "There are various forms of art that one can partake in, oftentime people tend to see art as just drawing or painting. However, art is whatever you desire it to be and these tips can be applicable to almost any form of art you wish to engage in. So here are some tips for you future artists:",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "1. Choose Your Medium",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/choice.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Experimenting with different art mediums is the initial step into creating art. As I have said, art is whatever you desire it to be and therefore and be comprised of what you wish. Paint a picture, make some pottery, sketch small figures, or knit a sweater, experimenting with different mediums can give you insight into your style and artistic dreams.",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "2. Practice",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(fontSize:20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/practice.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Whatever form of art you engage in requires practice, after all art is a skill just like one considers sports a skill. To be able to properly express yourself through your art medium, you must master using it. In painting or sketching that can be understading shades and highlights or in knitting that be making the correct knots. Practice to express yourself.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "3. Enjoy Yourself",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(fontSize:20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/happy.png"),
                    fit: BoxFit.contain
                  )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "The most important tip is to enjoy yourseld. I know that might sound like a cliche or a lazy piece of advice, but the only way you can make good art is by allowing yourself to step out rigidity and freely express yourself. If you find yourself constantly stressing about your art or how it may turn out, then you're not enjoying art... and you might need a new hobby.",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "In all, I hope you enjoyed this article and incorporate these tips in your own art journey. The biggest takeaway is: enjoy making art and others will enjoy it too. Good Luck!",
                  style: GoogleFonts.openSans(fontSize:15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}