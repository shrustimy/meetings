import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:meetings/resources/auth_methods.dart';
import 'package:meetings/utilities/color.dart';
import 'package:meetings/widgets/meet-options.dart';

import '../resources/jitsi_method.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final AuthMethods _authMethods=AuthMethods();
  late TextEditingController meetId;
  late TextEditingController name_controller;
  final JitsiMethods _jitsiMeetMethods= JitsiMethods();

  bool AudioMuted =true;
  bool VideoMuted = true;
  @override

  void initState(){
    meetId=TextEditingController();
    name_controller=TextEditingController(text: _authMethods.user.displayName);
        super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetId.dispose();
    name_controller.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
_jitsiMeetMethods.createMeeting(roomName: meetId.text, isAudMute: AudioMuted, isVidMute: VideoMuted , username: name_controller.text);
  }
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor: backgroundColor,
       title: const Text(
         'Join a Meeting',
         style: TextStyle(
           fontSize: 18,
         ),
       ),
       centerTitle: true ,
     ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetId,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Meet ID',
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: name_controller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Nme',
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
            ),
          ),
          const SizedBox(height: 20,),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Join',style: TextStyle(
                fontSize: 16,
              ) ,),
            ),
          ),
          const SizedBox(height: 20,),
          MeetOption(text: "Mute Audio", Mute: AudioMuted, onChange: onAudioMuted),
          MeetOption(text: 'Turn Off My Video', Mute: VideoMuted, onChange: onVideoMuted),

        ],
      ),
    );
  }
 onAudioMuted(bool? val){
 setState(() {
  AudioMuted=val!;
});
 }

 onVideoMuted(bool? val){
   setState(() {
     VideoMuted=val!;
   });
 }
}
