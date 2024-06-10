import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:motionminglee/Wiev/Chat/chat_screen.dart';
class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(agoraConnectionData: AgoraConnectionData(
    appId: '39a9b7719445441b92c135692184e48f',
    channelName: 'FlutterCallProje',
    tempToken: 'd6ac1445f93542e6b830e13841456d23',
  ));
  @override
  void initState() {
    super.initState();
    _initAgnora();
  }
  Future<void> _initAgnora() async {
    await _client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Görüntülü konuşma"),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: _client,
              layoutType: Layout.floating,
              showNumberOfUsers: true,
              ),
              AgoraVideoButtons(client: _client,
              enabledButtons: [
                BuiltInButtons.toggleCamera,
                BuiltInButtons.callEnd,
                BuiltInButtons.toggleMic
              ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
