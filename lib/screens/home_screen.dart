// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:awesome_select/awesome_select.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:mentorme/components/constants/constants.dart';
import 'package:mentorme/components/forms/login_screen.dart';
import 'package:mentorme/components/language/lang_strings.dart';
import 'package:mentorme/provider/provider.dart';


const List<String> list = <String>['en', 'km', 'ja'];
String dropdownValue = list.first;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseFirestore.instance;
  late String filter_domain ;
  Future<void> send( senderemail) async {
    var rec_mail=senderemail;
    final Email email = Email(
      body: 'Hai respected mentor i am student and i need your help ',
      subject: 'regarding communication in mentorme app',
      recipients: [
        
      rec_mail
      ],
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('welcome'),
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Welcome'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${Getcurrentuser.name}'),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('${Getcurrentuser.email}'),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // ListTile(
              //   title: const Text('add book'),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const bookaddscreen()));
              //   },
              // ),

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
            ],
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const SizedBox(
                height: 30.0,
              ),
              // SmartSelect.single(
              //     selectedValue: filter_domain,
              //     title: 'Domain',
              //     choiceItems: options,
              //     onChange: (state) => setState(() {
              //           filter_domain = state.value.toString();
              //           // print(dropdownValue);
              //           print(filter_domain);
              //         })),


// DropdownButton(
//     value: dropdownValue,
//     items: list.map<DropdownMenuItem<String>>((String value) {
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//     onChanged: (String? value) {
//       // This is called when the user selects an item.

//       dropdownValue = value!;
// filter_domain=dropdownValue;
// print(filter_domain);
//       // localization.translate(dropdownValue);
//     },
//   ),





Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: db.collection('mentors').snapshots(),
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
                          title: Text(doc['book_name']),
                          subtitle: Text(doc['author_name']),
                          trailing: IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("books")
                                    .doc(doc['book_name'])
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
                                      title: const Text('Book detail'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Book name",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['book_name']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Author name",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['author_name']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Short discription",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['short_discription']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                          const Text(
                                            "Long discription",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['long_discription']),
                                          const SizedBox(
                                            height: 35,
                                          ),
                                           const Text(
                                            "Posted by",
                                            style: TextStyle(fontSize: 24),
                                          ),
                                          const SizedBox(
                                            height: 27,
                                          ),
                                          Text(doc['poster_name']),
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






















              // Expanded(
              //   child: StreamBuilder<QuerySnapshot>(
              //     stream: db
              //         .collection('mentors')
                      
              //         .snapshots(),
                      
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       } else {
              //         return ListView(
              //           shrinkWrap: true,
              //           scrollDirection: Axis.vertical,
              //           children: snapshot.data!.docs.map((doc) {
              //             return Card(
              //               child: ListTile(
              //                 title: Text(doc['mentor_name']),
              //                 trailing: IconButton(
              //                     onPressed: () async {
              //                       send(doc['mentor_name']);
              //                     },
              //                     icon: const Icon(Icons.send)),
              //                 onTap: () {
              //                   showDialog(
              //                       context: context,
              //                       builder: (BuildContext context) {
              //                         return SingleChildScrollView(
              //                           child: AlertDialog(
              //                             actions: [
              //                               IconButton(
              //                                   onPressed: () {
              //                                     Navigator.of(context).pop();
              //                                   },
              //                                   icon: const Icon(Icons.close))
              //                             ],
              //                             title: const Text('Mentor  detail'),
              //                             content: Column(
              //                               mainAxisSize: MainAxisSize.min,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.start,
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 const Text(
              //                                   "mentor  name",
              //                                   style: TextStyle(fontSize: 24),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 27,
              //                                 ),
              //                                 Text(doc['mentor_name']),
              //                                 const SizedBox(
              //                                   height: 35,
              //                                 ),
              //                                 const Text(
              //                                   "Mentor domain",
              //                                   style: TextStyle(fontSize: 24),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 27,
              //                                 ),
              //                                 Text(doc['mentor_domain']),
              //                                 const SizedBox(
              //                                   height: 35,
              //                                 ),
              //                                 const Text(
              //                                   "Mentor bio",
              //                                   style: TextStyle(fontSize: 24),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 27,
              //                                 ),
              //                                 Text(doc['mentor_bio']),
              //                                 const SizedBox(
              //                                   height: 35,
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 35,
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         );
              //                       });
              //                 },
              //               ),
              //             );
              //           }).toList(),
              //         );
              //       }
              //     },
              //   ),
              // ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
