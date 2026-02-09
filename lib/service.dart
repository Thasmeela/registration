import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void>Register(String name,String email,String password,String confirm_password,BuildContext context)async{
  try{
    UserCredential usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseFirestore.instance.collection("users").doc(usercredential.user!.uid).set({
      "NAME":name,"EMAIL":email,"PASSWORD":password,"CONFIRM_PASSWORD":confirm_password
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("registration successfull")));

  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()
    ))); 
  }
}
Future<void>login(String email,String password,BuildContext context)async{
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("logined successful")));

  }catch(e){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()
    )));
  }
}
Future<void>forgot(String email,String password,BuildContext context)async{
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Reset successful")));

    
  }
  catch(e){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));

  }
}