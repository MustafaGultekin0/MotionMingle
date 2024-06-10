import 'package:flutter/material.dart';

class MessagesTextField extends StatefulWidget {
  const MessagesTextField({Key? key}) : super(key: key);

  @override
  State<MessagesTextField> createState() => _MessagesTextFieldState();
}

class _MessagesTextFieldState extends State<MessagesTextField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.send,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            hintText: 'Mesaj Gönder',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Colors.blue, // Border rengini ayarla
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Colors.blue, // Border rengini ayarla
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(
                color: Colors.blueAccent, // Odaklanıldığında border rengini ayarla
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: Colors.white, // Arkaplan rengini ayarla
          ),
        ),
      ),
    );
  }
}
