import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:contacts_app/screens/create_contact.dart';
import 'package:contacts_app/widgets/build_contacts.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Contacts(),
    );
  }
}

class Contacts extends StatefulWidget {
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  void _createNewContact () {
    var contactData = context.read<ContactData>();
    contactData.resetContactBeingEdited();

    Navigator.push(context, MaterialPageRoute(builder: (context) => ContactCreation()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: buildContacts(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewContact(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      )
    );
  }
}