import 'package:artfolio/screens/artwork_display.dart';
import 'package:artfolio/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//class that represents list of results
class ArtworkId {
  final List idList;

  ArtworkId({required this.idList});

  ArtworkId.fromJson(Map<String, dynamic> json)
      : idList = json['objectIDs'] as List;

  @override
  String toString() => idList.toList().toString();
}

Future<ArtworkId> fetchResults(String search) async {
  final response = await http.get(Uri.parse(
      'https://collectionapi.metmuseum.org/public/collection/v1/search?q=$search'));
  if (response.statusCode == 200) {

    return ArtworkId.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load artkwork');
  }
}

//class which represents artworks
class Artwork {
  bool favorite = false;
  final String title;
  final String image;
  final String artist;
  final String born;
  final String end;
  final String nationality;
  final String objName;
  final String creation;
  final String department;
  final String artMedium;

   Artwork(
      {required this.favorite, required this.title, required this.image, required this.artist, required this.born, required this.end, required this.nationality, required this.objName, required this.creation, required this.department, required this.artMedium});

  Artwork.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String,
        image = json['primaryImageSmall'] as String,
        artist = json['artistDisplayName'] as String,
        born = json['artistBeginDate'] as String,
        end = json['artistEndDate'] as String,
        nationality = json['artistNationality'] as String,
        objName = json['objectName'] as String,
        creation = json['objectDate'] as String,
        department = json['department'] as String,
        artMedium = json['medium'] as String;

}

//create a function that creates an instance of the artwork class that consists of artwork information to pass to another screen
// which will be presented on that screen

Future<List<Artwork>> getArtworks(List artIds) async {
  late List<Artwork> artworks = [];

  if (artIds.length > 15) {
    artIds.length = 15;
  }

  for (int i = 0; i < artIds.length; i++) {
    final response = await http.get(Uri.parse(
        'https://collectionapi.metmuseum.org/public/collection/v1/objects/${artIds[i]}'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Artwork art = Artwork.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      if (art.image == ""){
        continue;
      }
      else{
        artworks.add(art);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  return artworks;
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _search = TextEditingController();
  late ArtworkId artworks;
  late List artworksList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Sidemenu(),
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 350,
                      child: TextField(
                        controller: _search,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: IconButton(
                        onPressed: () async {
                          artworks = await fetchResults(_search.text);
                          setState(() {
                            artworksList = artworks.idList;
                          });
                        },
                        icon: const Icon(Icons.search),
                      ),
                    )
                  ],
                ),
                artworksList.isEmpty
                    ? Column(
                        children: [
                          Container(
                            height: 300,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/waiting.png"), fit: BoxFit.contain)
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Your Search begins here",
                              style: GoogleFonts.openSans(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Go Ahead, look up your heart's desire",
                              style: GoogleFonts.openSans(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      )
                    : FutureBuilder(
                        future: getArtworks(artworksList),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text("Error: ${snapshot.error}");
                          } else {
                            return ListView.separated(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DisplayArtScreen(display: snapshot.data[index])));
                                  },
                                  child: Container(
                                  padding: const EdgeInsets.all(15.0),
                                  width: 100,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data[index].image),
                                        fit: BoxFit.cover
                                      ),
                                      //color: Colors.blue,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Text(
                                    snapshot.data[index].title + " by " + snapshot.data[index].artist,
                                    style: GoogleFonts.openSans(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
                                  ),
                                ));
                              },
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        ));
  }
}
