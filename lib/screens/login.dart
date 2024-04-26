import 'package:artfolio/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  ButtonStyle style = ElevatedButton.styleFrom(
    fixedSize: const Size(180, 45),
    backgroundColor: Colors.blue[100]!,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );

  FirebaseFirestore db = FirebaseFirestore.instance;
  late String currUid = getUid();

  String getUid() {
    String uid = auth.currentUser!.uid.toString();
    return uid;
  }

  //if there is an issue with information the user inputs, a message will be displayed detailing the issue
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover)
            ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Artfolio",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
              const Text(
                "Get To Know A World of Art",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 55),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: 'Enter Email'),
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: 'Enter Password'),
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Text(
                errorMessage,
                style: TextStyle(
                    color: Colors.red[300]!,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: style,
                  onPressed: () async {
                    try {
                      await auth
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((_) => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyHomePage(title: "Home"))));
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        setState(() {
                          errorMessage = 'No User Found for that Email';
                        });
                      } else if (e.code == 'wrong-password') {
                        setState(() {
                          errorMessage = 'Wrong Password Provided for User';
                        });
                      }
                    }
                  },
                  child: Text("Log In",
                      style: TextStyle(color: Colors.blue[900]!, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextButton(
                  onPressed: () async {
                    Navigator.pushNamed(context, '/create');
                  },
                  child: Text('Do not have an account? Create it!',
                      style: TextStyle(color: Colors.blue[200]!)),
                ),
              ),
            ],
          ),
        )
        ));
  }
}
