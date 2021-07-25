import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';

Widget contactCreationPage() {
  final inputPadding = const EdgeInsets.all(6);
  final buttonPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 6);
  final saveTextStyles = const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);

  return Scaffold(
    appBar: AppBar(
      title: Text("Create Contact"),
    ),
    body: Wrap(
      children: <Widget>[
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
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Phone',
                    )
                  )
                ),
                Padding(
                  padding: inputPadding,
                  child: TextFormField(
                    onChanged: (text) {
                      var contactData = context.read<ContactData>();

                      contactData.updateContactText(text, "email");
                    },
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

                    contactData.addContact(context);
                  },
                  child: Padding(
                    padding: buttonPadding,
                    child: Text("Create Contact",
                      style: saveTextStyles
                    )
                  )
                )
              ]
            )
          )
        )
      ]
    )
  );
}