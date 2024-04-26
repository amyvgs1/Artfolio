// this is a class that represents messages sent between users

import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String userID;
  final String userEmail;
  final String chatroom;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.userID,
      required this.userEmail,
      required this.message,
      required this.timestamp,
      required this.chatroom});

  //create a map of all data

  Map<String, dynamic> toMap() {
    return {
      'userId': userID,
      'userEmail': userEmail,
      'chatroom': chatroom,
      'message': message,
      'timestamp': timestamp
    };
  }
}
