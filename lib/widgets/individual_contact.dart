import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// opens contact in the email or phone app if using device
void _launchURL(String url) async =>
  await canLaunch(url) ? await launch(url) : throw "Opening '$url' is prohibited on simulators.";

// formats phone number to (xxx)xxx-xxxx if 10 digits
String formatPhoneNumber(String phoneNumber) {
  String formattedPhoneNumber = "";

  if (phoneNumber.length == 10){
    formattedPhoneNumber = "(" + phoneNumber.substring(0,3) + ") " + phoneNumber.substring(3,6) + "-" +phoneNumber.substring(6,phoneNumber.length);
  } else {
    formattedPhoneNumber = phoneNumber;
  }

  return formattedPhoneNumber;
}

Widget buildIndividualContact(Map contact) {
  final _boldFont = const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
  final _buttonPadding = const EdgeInsets.all(15);
  final _iconPadding = const EdgeInsets.only(right: 6);

  return Column(
    children: [
      Card(
        child: contact["number"] != "" ? GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _launchURL("tel://" + contact["number"]);
          },
          child: Padding(
            padding: _buttonPadding,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: _iconPadding,
                  child: Icon(const IconData(58271, fontFamily: 'MaterialIcons'), size: 16, color: Colors.lightGreen)
                ),
                Text(formatPhoneNumber(contact["number"]),
                  style: _boldFont,
                )
              ]
            )
          )
        ) : Padding(
          padding: _buttonPadding,
          child: Row(
            children: <Widget>[
              Text("No phone number added yet.",
                style: _boldFont,
              )
            ]
          )
        )
      ),
      Card(
        child: contact["email"] != "" ? GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _launchURL("mailto:" + contact["email"]);
          },
          child: Padding(
            padding: _buttonPadding,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: _iconPadding,
                  child: Icon(const IconData(57898, fontFamily: 'MaterialIcons'), size: 16, color: Colors.lightGreen)
                ),
                Text(contact["email"],
                  style: _boldFont,
                )
              ]
            )
          )
        ) : Padding(
          padding: _buttonPadding,
          child: Row(
            children: <Widget>[
              Text("No email added yet.",
                style: _boldFont,
              )
            ]
          )
        )
      )
    ]
  );
}