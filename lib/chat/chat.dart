import 'package:artfolio/chat/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chat extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //send messages
  Future<void> sendMessage(
      String reciever, String message, String chatroomName) async {
    //first gather user info
    final String currUid = auth.currentUser!.uid;
    final String currEmail = auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a message
    Message newMessage = Message(
        userID: currUid,
        userEmail: currEmail,
        chatroom: chatroomName,
        message: message,
        timestamp: timestamp);

    //add message to database
    db
        .collection("Chatrooms")
        .doc(chatroomName)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //recieve messages
  Stream<QuerySnapshot> getMessages(String chatroom) {
    return db
        .collection("Chatrooms")
        .doc(chatroom)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
