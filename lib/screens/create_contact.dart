import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app/models/contacts.dart';

class ContactCreation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contactData = context.read<ContactData>();
    final inputPadding = const EdgeInsets.all(6);
    final buttonPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 6);
    final saveTextStyles = const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold);

    void _createContact(Map contactBeingEdited){
      Map _error = {
        "errorPresent": false,
        "errorType": ""
      };

      // requires at least a first or last name AND email or phone
      if (contactBeingEdited["firstName"].isEmpty && contactBeingEdited["lastName"].isEmpty){
        _error = {
          "errorPresent": true,
          "errorType": "name"
        };
      } else if (contactBeingEdited["email"].isEmpty && contactBeingEdited["number"].isEmpty) {
        _error = {
          "errorPresent": true,
          "errorType": "contact"
        };
      }

      // shows an error message if error is present
      if (_error["errorPresent"]){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Contact Error"),
            content: Text(
              "Enter a " + (_error["errorType"] == "name" ? "first and/or last name." : "phone number and/or email.")
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              )
            ]
          )
        );
      } else {
        // adds contact to the list
        contactData.addContact();
        Navigator.pop(context);
      }
    }

    void _updateFieldText(String mapValue, String mapKey){
      contactData.updateContactText(mapValue, mapKey);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
      ),
      body: Wrap(
        children: <Widget>[
          Card(
            child: Column(
                children: [
                  Padding(
                    padding: inputPadding,
                    child: TextFormField(
                      onChanged: (text) {
                        _updateFieldText(text, "firstName");
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
                        _updateFieldText(text, "lastName");
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
                        _updateFieldText(text, "number");
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
                        _updateFieldText(text, "email");
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                      )
                    )
                  ),
                  Consumer<ContactData>(
                    builder: (context, data, child) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _createContact(data.contactBeingEdited),
                      child: Padding(
                        padding: buttonPadding,
                        child: Text("Create Contact",
                          style: saveTextStyles
                        )
                      )
                    )
                  )
                ]
              )
          )
        ]
      )
    );
  }
}