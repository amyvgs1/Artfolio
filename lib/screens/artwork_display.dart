import 'package:artfolio/chat/chat.dart';
import 'package:artfolio/chat/message_appearance.dart';
import 'package:artfolio/screens/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//class meant to add to favorites list
class FavoriteList extends ChangeNotifier {
  List<Artwork> artList = [];

  void addFav(Artwork art) {
    artList.add(art);
    notifyListeners();
  }

  void removeRecipe(Artwork index) {
    artList.remove(index);
    notifyListeners();
  }
}

class DisplayArtScreen extends StatefulWidget {
  final Artwork display;

  const DisplayArtScreen({super.key, required this.display});

  @override
  State<DisplayArtScreen> createState() => _DisplayArtScreenState();
}

class _DisplayArtScreenState extends State<DisplayArtScreen> {
  TextEditingController _comment = TextEditingController();
  final Chat chatService = Chat();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_comment.text.isNotEmpty) {
      await chatService.sendMessage(
          auth.currentUser!.uid, _comment.text, widget.display.title);
      _comment.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    widget.display.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.display.image),
                          fit: BoxFit.contain)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.display.favorite = !widget.display.favorite;

                      if (widget.display.favorite == true) {
                        Provider.of<FavoriteList>(context, listen: false)
                            .addFav(widget.display);
                      } else {
                        Provider.of<FavoriteList>(context, listen: false)
                            .removeRecipe(widget.display);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[400]!),
                  child: ListTile(
                    leading: widget.display.favorite
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border, color: Colors.red),
                    title: Text(
                      "Add To Favorites",
                      style: GoogleFonts.openSans(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.orange[200]!,
                  child: ListTile(
                    leading: const Icon(Icons.person_2),
                    title: Text(
                      widget.display.artist,
                      style: GoogleFonts.openSans(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "About Artist",
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "${widget.display.artist} was a ${widget.display.nationality} artist born in the year ${widget.display.born} and died in the year ${widget.display.end}",
                    style: GoogleFonts.openSans(fontSize: 15),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "About the Artwork",
                    style: GoogleFonts.openSans(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "This ${widget.display.objName} was created by ${widget.display.artist} during the span of ${widget.display.creation}. The Metropolitan Museum of Art places this piece of art within the ${widget.display.department} department. This mediums used for this piece was ${widget.display.artMedium}.",
                    style: GoogleFonts.openSans(fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Comments",
                  style: GoogleFonts.openSans(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                    "Leave a comment and let us know what you think about ${widget.display.title}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.openSans(
                        fontSize: 13, fontStyle: FontStyle.italic)),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      width: 350,
                      child: TextField(
                        controller: _comment,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            hintText: "Leave a Comment"),
                      ),
                    ),
                    Container(
                      width: 20,
                      child: IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: buildMessageList(),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildMessageList() {
    return StreamBuilder(
      stream: chatService.getMessages(widget.display.title),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs
              .map((document) => buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  Widget buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['userId'] == auth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    //alignment of the messages will be determined by their sender
    return Container(
      padding: const EdgeInsets.all(10.0),
      alignment: alignment,
      child: Column(
        crossAxisAlignment: (data['userId'] == auth.currentUser!.uid)
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        mainAxisAlignment: (data['userId'] == auth.currentUser!.uid)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text(data['userEmail']),
          const SizedBox(height: 6),
          MessageBubble(message: data['message'])
        ],
      ),
    );
  }
}
