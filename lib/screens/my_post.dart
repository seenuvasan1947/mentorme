// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mentorme/components/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentorme/components/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
class mypostlist extends StatefulWidget {
  const mypostlist({super.key});

  @override
  State<mypostlist> createState() => _mypostlistState();
}

class _mypostlistState extends State<mypostlist> {
  final db = FirebaseFirestore.instance;
  final prefs = SharedPreferences.getInstance();

  Future<void> send(senderemail) async {
    var rec_mail = senderemail;
    final Email email = Email(
      body: 'Hai respected mentor i am student and i need your help ',
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
  
    return Scaffold(
      appBar: AppBar(
        title: const Text('My post List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
             

              stream: db
                  .collection('posts')
                  .where("poster_name", isEqualTo: '${Getcurrentuser.crnt_user}')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: snapshot.data!.docs.map((doc) {
                      return Card(
                        child: ListTile(
                          title: Text(doc['mentor_domain']),
                          subtitle: Text(doc['mentor_name']),
                          // trailing: IconButton(
                          //     onPressed: () async {
                          //       await FirebaseFirestore.instance
                          //           .collection("posts")
                          //           .doc(doc['mentor_email'])
                          //           .delete();
                          //     },
                          //     icon: const Icon(Icons.remove)),
                          trailing: IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                            .collection("posts")
                            .doc(doc['mentor_email'])
                            .delete();
                              },
                              icon: const Icon(Icons.remove)),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SingleChildScrollView(
                                    child: AlertDialog(
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(Icons.close))
                                      ],
                                      title: const Text('My post detail'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "mentor name",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['mentor_name']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "mentor domain",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['mentor_domain']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "mentor email",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['mentor_email']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
