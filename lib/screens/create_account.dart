//if users do not have an account they will be transported to this page to create one

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  //text controllers for data
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  String errorMessage = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;
  late String currUid = getUid();

  String getUid() {
    String uid = auth.currentUser!.uid.toString();
    return uid;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Creator"),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Container(
                padding: const EdgeInsets.all(10.0), child: Text(errorMessage)),
            Text(
              "Create Account",
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Please fill the field boxes below with the appropriate information",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _firstName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: "Enter Your First Name",
                  labelText: "First Name",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _lastName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Last Name",
                    hintText: "Enter Your Last Name"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _userName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Username",
                    hintText: "Create a Username"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Email",
                    hintText: "Enter a Valid Email"),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Password",
                    hintText: "Create a Password"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await auth.createUserWithEmailAndPassword(
                      email: _email.text, password: _password.text);

                  DateTime now = DateTime.now();
                  var formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(now);

                  //create instance in database under 'users' collection.
                  final data = {
                    "firstname": _firstName.text,
                    "lastname": _lastName.text,
                    "username": _userName.text,
                    "email": _email.text,
                    "password": _password.text,
                    "date": formattedDate
                  };

                  await db.collection('Users').doc(currUid).set(data);
                  Navigator.pushNamed(context, '/home');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'email-already-in-use') {
                    setState(() {
                      errorMessage =
                          'An Account Already Exists with that Email';
                    });
                  } else if (e.code == 'weak-password') {
                    setState(() {
                      errorMessage =
                          'Password is Not Strong Enough. Must be at least 6 Characters';
                    });
                  } else {
                    print("error...");
                  }
                }
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
