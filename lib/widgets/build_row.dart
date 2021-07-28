import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:contacts_app/screens/individual_contact.dart';
import 'package:contacts_app/widgets/individual_contact.dart';

Widget buildRow(Map contact) {
  final _boldFont = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
  final _phoneFont = const TextStyle(fontSize: 13.0, color: Colors.grey);
  var fullName = contact["firstName"] + " " + contact["lastName"];

  return Card(
    child: Consumer<ContactData>(
      builder: (context, data, child) => ListTile(
        title: Row(
          children: <Widget>[
            Text(fullName,
              style: _boldFont,
            ),
            Spacer(),
            Text(formatPhoneNumber(contact["number"]),
              style: _phoneFont,
            )
          ]
        ),
        onTap: () {
          // stores contact for editing in Map and opens individualContactPage
          var contactData = context.read<ContactData>();

          contactData.storeContactForEditing(contact);
          contactData.untoggleEditingInputs();

          Navigator.push(context, MaterialPageRoute(builder: (context) => IndividualContact(contact: contact)));
        }
      )
    )
  );
}