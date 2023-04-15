// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_function_type_syntax_for_parameters, depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mentorme/components/provider.dart';
import 'package:mentorme/auth/auth.dart';
import 'package:mentorme/components/forms/login_screen.dart';
import 'package:mentorme/components/provider.dart';
// import 'package:mentorme/screens/chat.dart';
import 'package:provider/provider.dart';
import 'package:mentorme/screens/mentor_post_page.dart';
import 'package:mentorme/screens/post_list.dart';
import 'package:mentorme/screens/my_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    context.read<Getcurrentuser>().getuser();
  }
  Future<void> send(senderemail) async {
    var rec_mail = senderemail;
    final Email email = Email(
      body: 'Hai respected developer i am student and i need your help ',
      subject: 'regarding communication in mentorme app',
      recipients: [rec_mail],
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Getcurrentuser>(
        builder: ((context, Getcurrentuser, child) => MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: const Text("Welcome"),
                  centerTitle: true,
                ),
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      DrawerHeader(
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        //child: Text('Drawer Header'),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text('Welcome'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('${Getcurrentuser.userName}'),
                            SizedBox(
                              height: 20,
                            ),
                            Text('${Getcurrentuser.userEmail}'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text('mentor post'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const postaddscreen()));
                        },
                      ),
                      ListTile(
                        title: const Text('My post'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mypostlist()));
                        },
                      ),
                      ListTile(
                        title: const Text('All post'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const postlist()));
                        },
                      ),
                      ListTile(
                        title: const Text('Logout'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Loginpage()));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                        ListTile(
                        title: const Text('chat with developer'),
                        onTap: () {
                         send('seenuthiruvpm@gmail.com');
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(top: 150),
                          margin: EdgeInsets.all(20),
                          height: MediaQuery.of(context).size.height / 1.2,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 250, 252, 250),
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 110.0),
                              Text('Welcome ...',
                                  style:
                                      Theme.of(context).textTheme.displayMedium),
                              SizedBox(height: 40.0),
                              Text(
                                  'unleash your skill, Lets help others ',
                                  style:
                                      Theme.of(context).textTheme.headlineMedium),
                              SizedBox(height: 40.0),
                              Image.asset("assets/teach2.jpeg"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
