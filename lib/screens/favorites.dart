import 'package:artfolio/screens/artwork_display.dart';
import 'package:artfolio/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//screen dedicated to showing the recipes the user favorite
class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

  const FavoriteScreen({super.key});
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favList = context.watch<FavoriteList>().artList;
    return Scaffold(
      drawer: const Sidemenu(),
      appBar: AppBar(
        title: const Text('Your Favorites'),
        backgroundColor: Colors.red[300],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: favList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DisplayArtScreen(display: favList[index])));
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(favList[index].image),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Text(favList[index].title,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                ));
          },
        ),
      ),
    );
  }
}
