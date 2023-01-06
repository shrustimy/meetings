import 'dart:math';

import 'package:flutter/material.dart';

import '../resources/jitsi_method.dart';
import '../widgets/home_button.dart';

class MeetScreen extends StatelessWidget {
   MeetScreen({Key? key}) : super(key: key);
  final JitsiMethods _jitsiMethods=JitsiMethods();
  createNewMeeting() async{
    var random=Random();
    String roomName=(random.nextInt(10000000)+ 10000000).toString();
    _jitsiMethods.createMeeting(roomName: roomName, isAudMute: true, isVidMute: true);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, '/video-call');
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButton(onPressed: createNewMeeting, icon: Icons.videocam, text: 'New Meeting',),
            HomeButton(onPressed: () => joinMeeting(context), icon: Icons.add_box_rounded, text: 'Join Meeting',),
            HomeButton(onPressed: (){}, icon: Icons.calendar_today, text: 'Schedule',),
            HomeButton(onPressed: (){}, icon: Icons.arrow_upward_rounded, text: 'Share Screen',),
          ],
        ),
        const Expanded(child: Center(child: Text('Create / Join Meeting with just a click!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),))
      ],
    );;
  }
}
