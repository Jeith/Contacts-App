import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:contacts_app/widgets/profile-banner.dart';
import 'package:contacts_app/widgets/edit-contact.dart';
import 'package:contacts_app/widgets/individual-contact.dart';

Widget individualContactPage(Map contact, context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Contacts"),
      actions: <Widget>[
        Consumer<ContactData>(
          builder: (context, data, child) => !data.isCurrentlyEditingContact ? 
            IconButton(
              icon: (new Icon(IconData(61325, fontFamily: 'MaterialIcons'), size: 20, color: Colors.blueGrey)),
              tooltip: 'Edit Contact Details',
              onPressed: () {
                var contactData = context.read<ContactData>();
                contactData.toggleEditingInputs();
              }
            ) : IconButton(
              icon: (new Icon(IconData(57882, fontFamily: 'MaterialIcons'), size: 20, color: Colors.blue)),
              tooltip: 'Cancel Changes',
              onPressed: () {
                var contactData = context.read<ContactData>();
                contactData.restoreContact();
                contactData.untoggleEditingInputs();
              }
            )
        )
      ]
    ),
    body: Wrap(
      children: <Widget>[
        profileIconBanner(context),
        Consumer<ContactData>(
          builder: (context, data, child) => !data.isCurrentlyEditingContact ? buildIndividualContact(contact) : editIndividualContact(contact, context)
        )
      ]
    )
  );
}