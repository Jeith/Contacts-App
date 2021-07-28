import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';

Widget editIndividualContact(Map contact, context) {
  final inputPadding = const EdgeInsets.all(6);
  final buttonPadding = const EdgeInsets.symmetric(vertical: 17, horizontal: 6);
  final saveTextStyles = const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);
  final deleteTextStyles = const TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
  // setting initialValues for TextFormFields
  var firstName = contact["firstName"];
  var lastName = contact["lastName"];
  var number = contact["number"];
  var email = contact["email"];

  void _deleteContact() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure you want to delete this contact?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('No, go back'),
          ),
          TextButton(
            onPressed: () {
              var contactData = context.read<ContactData>();
              contactData.deleteContact(contact);

              Navigator.pop(context, 'Confirm');
            },
            child: const Text('Yes, delete'),
          )
        ]
      )
    );
  }

  return Column(
    children: [
      Card(
        child: Consumer<ContactData>(
          builder: (context, data, child) => Column(
            children: [
              Padding(
                padding: inputPadding,
                child: TextFormField(
                  onChanged: (text) {
                    var contactData = context.read<ContactData>();
                    contactData.updateContactText(text, "firstName");
                  },
                  initialValue: firstName,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'First name',
                  )
                )
              ),
              Padding(
                padding: inputPadding,
                child: TextFormField(
                  onChanged: (text) {
                    var contactData = context.read<ContactData>();
                    contactData.updateContactText(text, "lastName");
                  },
                  initialValue: lastName,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Last name',
                  )
                )
              ),
              Padding(
                padding: inputPadding,
                child: TextFormField(
                  onChanged: (text) {
                    var contactData = context.read<ContactData>();
                    contactData.updateContactText(text, "number");
                  },
                  initialValue: number,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Phone',
                  )
                ),
              ),
              Padding(
                padding: inputPadding,
                child: TextFormField(
                  onChanged: (text) {
                    var contactData = context.read<ContactData>();
                    contactData.updateContactText(text, "email");
                  },
                  initialValue: email,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  )
                )
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  var contactData = context.read<ContactData>();
                  bool areNamesEmpty = data.contactBeingEdited["firstName"].isEmpty && data.contactBeingEdited["lastName"].isEmpty;
                  bool areContactsEmpty = data.contactBeingEdited["email"].isEmpty && data.contactBeingEdited["number"].isEmpty;

                  if (areNamesEmpty && areContactsEmpty){
                    _deleteContact();

                  } else {
                    contactData.updateContact();
                  }
                },
                child: Padding(
                  padding: buttonPadding,
                  child: Text("Save Changes",
                    style: saveTextStyles
                  )
                )
              ),
              Divider(height: 15.0,color: Colors.black),
              TextButton(
                onPressed: () => _deleteContact(),
                child: Padding(
                  padding: buttonPadding,
                  child: Text("Delete Contact",
                    style: deleteTextStyles
                  )
                )
              )
            ]
          )
        )
      )
    ]
  );
}