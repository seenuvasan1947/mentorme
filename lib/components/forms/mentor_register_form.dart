// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mentorme/components/constant.dart';
import 'package:mentorme/screens/home_screen.dart';
// import 'package:mentorme/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mentor_Reg extends StatefulWidget {
  const Mentor_Reg({super.key});

  @override
  State<Mentor_Reg> createState() => _Mentor_RegState();
}

class _Mentor_RegState extends State<Mentor_Reg> {
  late String mentor_name;
  late String mentor_email;
  late String mentor_password;
  late String mentor_phone;
    late String mentor_bio;
  late String mentor_address;
  late String mentor_domain;
 final _auth = FirebaseAuth.instance;
  late var newuser = null;
  // late var newuser = 123;
  Future<String?> stud_reg() async {
    try {
      newuser = await _auth.createUserWithEmailAndPassword(
          email: mentor_email, password: mentor_password);
      FirebaseFirestore.instance.collection("mentors").doc(mentor_email).set({
        'mentor_email': mentor_email,
        'mentor_password': mentor_password,
        'mentor_name': mentor_name,
        'mentor_phone': mentor_phone,
        'mentor_bio': mentor_bio,
        'mentor_address': mentor_address,
        'mentor_domain': mentor_domain,
        
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_email', mentor_email);
      await prefs.setString('user_name', mentor_name);
      
      if (newuser != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePage()));
      }
    } catch (e) {
      AlertDialog(
        content: Center(
          child: Column(
            children: [Text(e.toString())],
          ),
        ),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Please fill out this form'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column( mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),  
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
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
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
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_password = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password.')),
              const SizedBox(
                height: 30.0,
              ),

              TextField(
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_phone = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your phone number.')),
              const SizedBox(
                height: 30.0,
              ),
const SizedBox(
                height: 30.0,
              ),
              TextField(
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
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
const SizedBox(
                height: 30.0,
              ),

              TextField(
                  minLines: 7,
                  maxLines: 20,
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_bio = value;
                    //Do something with the user input.
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your bio.')),
              const SizedBox(
                height: 30.0,
              ),

              TextField(
                  minLines: 7,
                  maxLines: 20,
                  enableIMEPersonalizedLearning: true,
                  autocorrect: true,
                  obscureText: false,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    mentor_address = value;
                    //Do something with the user input.
                    print(mentor_address);
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your address.')),
              const SizedBox(
                height: 30.0,
              ),


              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      stud_reg();
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)))),
                    child: Text("Submit"),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}












// // ignore_for_file: non_constant_identifier_names

// import 'package:awesome_select/awesome_select.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:mentorme/components/constants/constants.dart';
// import 'package:mentorme/components/language/lang_strings.dart';
// import 'package:mentorme/screens/home_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Mertor_Reg extends StatefulWidget {
//   const Mertor_Reg({super.key});

//   @override
//   State<Mertor_Reg> createState() => _Mertor_RegState();
// }

// // ignore: camel_case_types
// class _Mertor_RegState extends State<Mertor_Reg> {
//   late String mentor_name;
//   late String mentor_email;
//   late String mentor_password;
//   late String mentor_phone;
//   late String mentor_bio;
//   late String mentor_address;
//   late String mentor_domain;

//   final _auth = FirebaseAuth.instance;
// //  late var newuser = null;
// late var newuser = 123;
 
//   /* functions */

//   Future<String?> mentor_reg() async {
//       // late var newuser = null;
//     try {
//       // newuser = await _auth.createUserWithEmailAndPassword(
//       //     email: mentor_email, password: mentor_password);
//       FirebaseFirestore.instance.collection("mentors").doc(mentor_email).set({
//         'mentor_email': mentor_email,
//         'mentor_password': mentor_password,
//         'mentor_name': mentor_name,
//         'mentor_phone': mentor_phone,
//         'mentor_domain': mentor_domain,
//         'mentor_bio': mentor_bio,
//         'mentor_address': mentor_address,
//       });
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('user_email', mentor_email);
//        await prefs.setString('user_name', mentor_name);
      
// // if (newuser != null) {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const HomeScreen()));
//       // }


//       // if (newuser != null) {
//       //   Navigator.push(context,
//       //       MaterialPageRoute(builder: (context) => const HomeScreen()));
//       // }
//     } catch (e) {
//       AlertDialog(
//         content: Center(
//           child: Column(
//             children: [Text(e.toString())],
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // String dropdownValue = AppLocale.welcome.getString(context);
//     List<S2Choice<String>> options = [
//       S2Choice<String>(
//           value: 'App Development',
//           title: AppLocale.welcome.getString(context)),
//       S2Choice<String>(value: 'Website Build', title: 'Website Build'),
//       S2Choice<String>(value: 'UI/UX', title: 'UI/UX'),
//       S2Choice<String>(value: 'Content Writer', title: 'Content Writer'),
//       S2Choice<String>(value: 'Netwoking', title: 'Netwoking'),
//       S2Choice<String>(value: 'CyberSecurity ', title: 'CyberSecurity'),
//       S2Choice<String>(value: 'AI/ML/DS', title: 'AI/ML/DS'),
//       S2Choice<String>(value: 'Basic Programming', title: 'Basic Programming'),
//     ];
//     return Scaffold(
//       appBar: AppBar(title: Text('Fill All details please'),),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.1,
//               ),
              
//               TextField(
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_name = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your name.')),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               TextField(
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_email = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your email.')),
//               const SizedBox(
//                 height: 30.0,
//               ),

//               TextField(
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_password = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your password.')),
//               const SizedBox(
//                 height: 30.0,
//               ),

//               TextField(
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_phone = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your phone number.')),
//               const SizedBox(
//                 height: 30.0,
//               ),

//               SmartSelect.single(
//                   selectedValue: dropdownValue,
//                   title: 'Domain',
//                   choiceItems: options,
//                   onChange: (state) => setState(() {
//                         dropdownValue = state.value;
//                         // print(dropdownValue);
//                       })),
//               TextField(
//                   minLines: 7,
//                   maxLines: 20,
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_bio = value;
//                     //Do something with the user input.
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your bio.')),
//               const SizedBox(
//                 height: 30.0,
//               ),

//               TextField(
//                   minLines: 7,
//                   maxLines: 20,
//                   enableIMEPersonalizedLearning: true,
//                   autocorrect: true,
//                   obscureText: false,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     mentor_address = value;
//                     //Do something with the user input.
//                     print(mentor_address);
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your address.')),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.36,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       mentor_reg();
//                     },
//                     style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                                 RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30)))),
//                     child: Text("Submit"),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 60.0,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
