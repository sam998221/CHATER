// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:chater/models/chat_model.dart';
import 'package:chater/models/message_model.dart';

class ChatPage extends StatefulWidget {
  final String website;

  const ChatPage({Key? key, required this.website}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController textEditingController = TextEditingController();

  Widget buildSingleMessage(Message message) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      child: Text(message.text),
    );
  }

  Widget buildChatList() {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        List<Message> messages = model.getMessagesForWebsite(widget.website);

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              return buildSingleMessage(messages[index]);
            },
          ),
        );
      },
    );
  }

  Widget buildChatArea() {
    return ScopedModelDescendant<ChatModel>(
      builder: (context, child, model) {
        return Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: textEditingController,
              ),
            ),
            const SizedBox(width: 10.0),
            FloatingActionButton(
              onPressed: () {
                model.sendMessage(
                  room: '',
                  text: textEditingController.text,
                  website: widget.website,
                );
                textEditingController.text = '';
              },
              elevation: 0,
              child: const Icon(Icons.send),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.website),
      ),
      body: Column(
        children: <Widget>[
          buildChatList(),
          buildChatArea(),
        ],
      ),
    );
  }
}
