// ignore_for_file: avoid_unnecessary_containers

import 'package:chater/chat_page_test.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({Key? key}) : super(key: key);

  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 40,
                width: 400,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Enter your room code",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "GO BACK",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.015,
                        );
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2);
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return const ChatPage(website: "google.com");
                      // }));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ChatPageTest();
                      }));
                    },
                    child: const Text(
                      "ENTER ROOM",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                              (Set<MaterialState> states) {
                        return EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.015,
                        );
                      }),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2);
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
