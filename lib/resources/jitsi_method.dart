import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:meetings/resources/auth_methods.dart';
import 'package:jitsi_meet/jitsi_meet.dart';


class JitsiMethods {
  final AuthMethods _authMethods=AuthMethods();
  void createMeeting({required String roomName,required bool isAudMute ,required bool isVidMute, String username=''}) async {
    try {
      Map<FeatureFlagEnum, bool> featureFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (!kIsWeb) {
        // Here is an example, disabling features for each platform
        if (Platform.isAndroid) {
          // Disable ConnectionService usage on Android to avoid issues (see README)
          featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
        } else if (Platform.isIOS) {
          // Disable PIP on iOS as it looks weird
          featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
        }
      } // Limit video resolution to 360p
      String name;
      if(username.isEmpty){
        name=_authMethods.user.displayName!;
      } else{
        name=username;
      }

      var options = JitsiMeetingOptions(
        room: roomName
      )
        ..userDisplayName = name
        ..userEmail = _authMethods.user.email
        ..userAvatarURL = _authMethods.user.photoURL // or .png
        ..audioMuted = isAudMute
        ..videoMuted = isVidMute;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}

