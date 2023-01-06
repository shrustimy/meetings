import 'package:flutter/material.dart';
import 'package:meetings/screens/log_screen.dart';
import 'package:meetings/widgets/home_button.dart';

import '../utilities/color.dart';
import 'meet_screen.dart';

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

  List<Widget> pages=[
    MeetScreen(),
    const LogScreen(),
    const Text('Contacts'),
    const Text('Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0,
        title: const Text('Meetings'),
        centerTitle: true,
      ),
      body: pages[_page],
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
          // BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Meetings'),
        ]
      ),
    );
  }
}
//
// class LogMeeting extends StatelessWidget {
//   const LogMeeting({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           HomeButton(onPressed: (){}, icon: Icons.videocam, text: 'New Meeting',),
//           HomeButton(onPressed: (){}, icon: Icons.add_box_rounded, text: 'Join Meeting',),
//           HomeButton(onPressed: (){}, icon: Icons.calendar_today, text: 'Schedule',),
//           HomeButton(onPressed: (){}, icon: Icons.arrow_upward_rounded, text: 'Share Screen',),
//         ],
//       ),
//       const Expanded(child: Center(child: Text('Create / Join Meeting with just a click!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),))
//     ],
//     );
//   }
// }
