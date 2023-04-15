// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:mentorme/components/constant.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mentorme/components/provider.dart';

class postaddscreen extends StatefulWidget {
  const postaddscreen({super.key});

  @override
  State<postaddscreen> createState() => _postaddscreenState();
}

class _postaddscreenState extends State<postaddscreen> {
  late String mentor_name;
  late String mentor_email;
  late String mentor_domain;
  
  final db = FirebaseFirestore.instance;
  Future<String?> adddata() async {
    FirebaseFirestore.instance.collection("posts").doc(mentor_email).set({
      'poster_name': Getcurrentuser.crnt_user,
      'mentor_name': mentor_name,
      'mentor_email': mentor_email,
      'mentor_domain': mentor_domain,
      
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AlertDialog(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close))
          ],
          title: const Text('mentor post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_name = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your name.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_email = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email.')),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_domain = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your domain.')),
              const SizedBox(
                height: 30.0,
              ),
              
              ElevatedButton(
                  onPressed: () {
                    adddata();
                  },
                  child: Text('save')),
            ],
          ),
        ),
      ),
    );
  }
}
