import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:contacts_app/screens/contact_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ContactData(),
      child: ContactsApp()
    )
  );
}

class ContactsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactList()
    );
  }
}