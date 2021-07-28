import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';

Widget profileIconBanner(context) {
  final _titleFont = const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  
  return Card(
    child: Stack(
    alignment: AlignmentDirectional.center,
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
      ),
      Column(
        children: <Widget>[
          // profile icon
          Icon(const IconData(0xe043, fontFamily: 'MaterialIcons'), size: 150, color: Colors.grey),
          Consumer<ContactData>(
            builder: (context, data, child) => 
              // live updating full name
              Text(data.contactBeingEdited["firstName"] + " " + data.contactBeingEdited["lastName"],
                style: _titleFont,
              )
            )
          ]
        )
      ]
    )
  );
}