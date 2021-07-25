import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';
import 'package:contacts_app/widgets/build-row.dart';

// builds contacts list body
Widget buildContacts() {
    return Consumer<ContactData>(
      builder: (context, data, child) => ListView.builder(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 65, ),
        itemBuilder: (context, i) {
          return buildRow(data.contactList[i]);
        },
        itemCount: data.contactList.length
      )
    );
  }