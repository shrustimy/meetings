import 'package:flutter/material.dart';
import 'package:meetings/widgets/home_button.dart';

import '../utilities/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _page=0;
  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title: const Text('Meetings'),
        centerTitle: true,
      ),
      body: Column(
      children: [
        Row(
          children: [
            HomeButton(onPressed: (){}, icon: Icons.abc)
          ],
        )
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        // type: BottomNavigationBarType.fixed,
        //   unselectedFontSize: 14,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: 'Meet and chat'),
          BottomNavigationBarItem(backgroundColor:footerColor,icon: Icon(Icons.lock_clock),label: 'Meetings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Meetings'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Meetings'),
        ]
      ),
    );
  }
}
