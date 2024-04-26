import 'package:artfolio/additional/art_mediums.dart';
import 'package:artfolio/additional/month.dart';
import 'package:artfolio/additional/spotlight.dart';
import 'package:artfolio/additional/tips.dart';
import 'package:artfolio/screens/artwork_display.dart';
import 'package:artfolio/screens/create_account.dart';
import 'package:artfolio/screens/favorites.dart';
import 'package:artfolio/screens/home.dart';
import 'package:artfolio/screens/login.dart';
import 'package:artfolio/screens/profile.dart';
import 'package:artfolio/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<FavoriteList>(create: (_) => FavoriteList())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/' : (context) => const LoginScreen(),
        '/home': (context) => const MyHomePage(title: "Home"),
        '/create': (context) => const CreateAccountScreen(),
        '/mediums': (context) => const Mediums(),
        '/spotlight': (context) => const Spotlight(),
        '/search': (context) => const SearchScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/tips' : (context) => const Tips(),
        '/month' : (context) =>  MonthArt(),
        '/favorite' : (context) => const FavoriteScreen()
       },
      initialRoute: '/',
    );
  }
}