// ignore_for_file: import_of_legacy_library_into_null_safe, library_prefixes

import 'package:scoped_model/scoped_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:convert';

import 'user_model.dart';
import 'message_model.dart';

class ChatModel extends Model {
  late User currentUser;
  late List<User> otherUsers = <User>[];
  late List<Message> messages = <Message>[];

  void init(name, room, website) {
    currentUser = User(name, room != '' ? room : null, website);

    IO.Socket socket = IO.io('http://localhost:3000');

    // socketIO.init();

    // socketIO.subscribe(
    //   'recieve_message',
    //   (jsonData) {
    //     Map<String, dynamic> data = json.decode(jsonData);
    //     messages.add(
    //       Message(
    //         data['content'],
    //         data['website'],
    //         data['room'],
    //       ),
    //     );
    //     notifyListeners();
    //   },
    // );
    // socketIO.connect();
  }

  void sendMessage({String text = '', String website = '', String room = ''}) {
    messages.add(Message(text, currentUser.room, currentUser.website));
    // socketIO.sendMessage(
    //   'send_message',
    //   json.encode(
    //     {
    //       'room': room,
    //       'content': text,
    //       'website': website,
    //     },
    //   ),
    // );
    notifyListeners();
  }

  List<Message> getMessagesForWebsite(String website) {
    // return messages.where((element) => element.website == website).toList();

    return [Message("text", "roomID", website)];
  }
}
