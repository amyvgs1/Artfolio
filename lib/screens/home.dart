import 'package:artfolio/sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Sidemenu(),
        appBar: AppBar(),
        body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Welcome Back ${auth.currentUser!.email}!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(fontSize:30, fontWeight:FontWeight.bold),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  "Explore Art",
                  style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Container(
                    height: 200,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(
                          width:20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/mediums');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: 350,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/mediums.png"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Let's Talk Art Mediums",
                              style: GoogleFonts.openSans(fontSize:20, fontWeight: FontWeight.bold, color: Colors.white),
                              textAlign: TextAlign.justify
                            ),
                          ),
                        ),
                        const SizedBox(
                          width:20
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/spotlight");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: 350,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/vangogh.png"), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                            child:Text(
                              "Spotlight: Vincent Van Gogh",
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/tips");
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: 350,
                            decoration: BoxDecoration(
                                image: const DecorationImage(image: AssetImage("assets/images/artist.png"), fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              "Tips To Be A Better Artist",
                              style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white) ,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20
                        ),
                      ],
                    )
                  ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Art of the Month:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/month');
                  },
                  child: Container(
                    height: 400,
                    width: 350,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/month.png"),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(30)),
                    child: Text(
                      "Girl with a Pearl Earring",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          )// This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
