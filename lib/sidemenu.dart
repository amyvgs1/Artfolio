import 'package:flutter/material.dart';

class Sidemenu extends StatelessWidget{
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Menu",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/home");
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/search");
            },
            leading: const Icon(Icons.search),
            title: const Text("Find Art"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, '/favorite');
            },
            leading: const Icon(Icons.favorite),
            title: const Text("Favorites"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, "/profile");
            },
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
          ),
        ],
      ),
    );
  }
  
}