import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/MessagesBubble.dart';
import '../../components/messages_text_field.dart';
import '../agnora/call.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';
import 'package:motionminglee/components/widget_contents/appbar_contents.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<MessageBubble> _messages = [
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
    const MessageBubble(
        profileImageUrl: 'https://images.unsplash.com/photo-1650419743194-c28ccbbcb7b8',
        message: 'Bu chat uygulaması hastalar ve doktorlar için yapılmıştır',
        date: '10 Haziran, 11.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: ()=> Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_)=>const VideoCallScreen())
              ), icon: const Icon(Icons.video_camera_back_outlined))
        ],
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16),
              reverse: true,
              itemBuilder: (_, index) => _messages[index],
              separatorBuilder: (_, __) => const SizedBox(height: 16,),
              itemCount: _messages.length,
            ),
          ),
          const MessagesTextField(),
        ],
      ),
    );
  }
}
