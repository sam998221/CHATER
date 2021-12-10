// ignore_for_file: prefer_const_constructors

import 'package:chater/chat_page.dart';
import 'package:chater/create_room.dart';
import 'package:chater/join_room.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHATER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Center(
            child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "CHATER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(
                    Icons.online_prediction,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "WELCOME",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return JoinRoom();
                          }));
                        },
                        child: const Text(
                          "JOIN ROOM",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>((Set<MaterialState> states) {
                            return EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.015,
                            );
                          }),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2);
                              }
                              return Colors
                                  .white; // Use the component's default.
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return CreateRoom();
                          }));
                        },
                        child: const Text(
                          "CREATE ROOM",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.resolveWith<
                              EdgeInsetsGeometry>((Set<MaterialState> states) {
                            return EdgeInsets.symmetric(
                              horizontal: size.width * 0.03,
                              vertical: size.height * 0.015,
                            );
                          }),
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.2);
                              }
                              return Colors
                                  .white; // Use the component's default.
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
