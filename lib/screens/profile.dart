import 'package:artfolio/sidemenu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  late String currUid = getUid();
  late Map<String, dynamic> userInfo = {};
  var titleStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  String getUid() {
    String uid = auth.currentUser!.uid.toString();
    return uid;
  }

  Future<void> getData() async {
    final docRef = db.collection("Users").doc(currUid);
    await docRef.get().then((DocumentSnapshot doc) {
      setState(() {
        userInfo = doc.data() as Map<String, dynamic>;
      });
      print(userInfo);
    });
  }

  Future<void> updateName(bool firstname) async {
    final userRef = db.collection('Users').doc(currUid);
    String newName = '';

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: firstname
                ? const Text("Change First Name:")
                : const Text('Change Last Name:'),
            content: TextField(
              onChanged: (value) {
                newName = value;
              },
            ),
            actions: [
              ElevatedButton(
                onPressed: () async {
                  if (firstname) {
                    await userRef.update({'firstname': newName});
                  } else {
                    await userRef.update({'lastname': newName});
                  }

                  await getData();
                  Navigator.pop(context);
                },
                child: const Text('Update'),
              ),
            ],
          );
        });
  }

  //updating email requires email verification
  Future<void> updatePassword() async {
    final userRef = db.collection('Users').doc(currUid);
    String errorMessage = "";
    String newPassword = "";

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Update Password"),
            content: TextField(
              onChanged: (value) {
                newPassword = value;
              },
            ),
            actions: [
              Text(errorMessage),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await auth.currentUser!.updatePassword(newPassword);
                    await userRef.update({'password': newPassword});
                    await getData();
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      setState(() {
                        errorMessage =
                            'Password Must be at Least 6 Characters Long';
                      });
                    } else {
                      print('error...');
                    }
                  }
                },
                child: const Text('Update'),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const Sidemenu(),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.purple[300]!,
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                      image: AssetImage("assets/images/user.png"), scale: 4)),
            ),
            userInfo.isEmpty
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(userInfo['username']),
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          child: ListTile(
                            leading: Text("Date Created: ", style: titleStyle),
                            title: Text(userInfo['date']),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: Text(
                            'First Name: ',
                            style: titleStyle,
                          ),
                          title: Text(userInfo['firstname']),
                          trailing: IconButton(
                            onPressed: () async {
                              await updateName(true);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                        ListTile(
                          leading: Text('Last Name: ', style: titleStyle),
                          title: Text(userInfo['lastname']),
                          trailing: IconButton(
                            onPressed: () async {
                              await updateName(false);
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                        ListTile(
                          leading: Text(
                            'Email: ',
                            style: titleStyle,
                          ),
                          title: Text(userInfo['email']),
                        ),
                        ListTile(
                          leading: Text(
                            'Password: ',
                            style: titleStyle,
                          ),
                          title: Text(userInfo['password']),
                          trailing: IconButton(
                              onPressed: () {
                                updatePassword();
                              },
                              icon: const Icon(Icons.edit)),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              },
              child: const Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
