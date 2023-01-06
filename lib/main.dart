import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meetings/resources/auth_methods.dart';
import 'package:meetings/screens/home_screen.dart';
import 'package:meetings/screens/login_screen.dart';
import 'package:meetings/screens/video_screen.dart';
import 'package:meetings/utilities/color.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meetings',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home_screen': (context) => const Home(),
        '/video-call': (context) => const VideoScreen(),
    },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
            if(snapshot.hasData){
              return const Home();
          }
            return const LoginScreen();
        },
      ),

    );
  }
}


