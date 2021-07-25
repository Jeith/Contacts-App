import 'package:flutter/material.dart';

class ContactData with ChangeNotifier {
  // Declaring contact 
  List contactList = [
    {
      "id": 3,
      "firstName": "Arthur",
      "lastName": "Verocai",
      "number": "3462976973",
      "email": "verocaiarthur@hotmail.com"
    },
    {
      "id": 9,
      "firstName": "Bobbi",
      "lastName": "Humpherey",
      "number": "1152930309",
      "email": "bobbih@yahoo.com"
    },
    {
      "id": 1,
      "firstName": "Brenda",
      "lastName": "Jones",
      "number": "8329307362",
      "email": "brendabjones@hotmail.com"
    },
    {
      "id": 5,
      "firstName": "Charlie",
      "lastName": "Parker",
      "number": "2819301157",
      "email": "e.bill@gmail.com"
    },
    {
      "id": 10,
      "firstName": "Chet",
      "lastName": "Baker",
      "number": "8232915672",
      "email": "bchet@yahoo.com"
    },
    {
      "id": 11,
      "firstName": "Dave",
      "lastName": "Grusin",
      "number": "3469301152",
      "email": "davegru5@gmail.com"
    },
    {
      "id": 7,
      "firstName": "Earl",
      "lastName": "Klugh",
      "number": "8231091173",
      "email": ""
    },
    {
      "id": 4,
      "firstName": "John",
      "lastName": "Coltrane",
      "number": "7131273982",
      "email": "j.coltrane@outlook.com"
    },
    {
      "id": 0,
      "firstName": "Lee",
      "lastName": "Morgan",
      "number": "7130091273",
      "email": "keithapittman@gmail.com"
    },
    {
      "id": 8,
      "firstName": "Ramsey",
      "lastName": "Lewis",
      "number": "2817537252",
      "email": "lewramsey@gmail.com"
    },
    {
      "id": 6,
      "firstName": "Ronnie",
      "lastName": "Laws",
      "number": "",
      "email": "ronlaws@outlook.com"
    },
    {
      "id": 12,
      "firstName": "Ronnie",
      "lastName": "Wilson",
      "number": "281930123",
      "email": "r.wilson@gmail.com"
    },
    {
      "id": 2,
      "firstName": "Walter",
      "lastName": "Wanderley",
      "number": "7131307512",
      "email": ""
    }
  ];
  bool isCurrentlyEditingContact = false;
  Map contactBeingEdited = {
    'id': 0,
    'firstName': "",
    'lastName': "",
    'number': "",
    'email': ""
  };

  // sorting contactList by first and last name
  void sortContacts() {
    contactList.sort((m1, m2) {
      var r = m1["firstName"].toLowerCase().compareTo(m2["firstName"].toLowerCase());
      if (r != 0) return r;
      return m1["lastName"].toLowerCase().compareTo(m2["lastName"].toLowerCase());
    });
  }

  // stores contact in the contactBeingEdited Map
  void storeContactForEditing(Map contact) {
    contactBeingEdited = {...contact};
    notifyListeners();
  }

  // updates specific value in the contactBeingEdited Map
  void updateContactText(String value, String key) {
    contactBeingEdited[key] = value;

    notifyListeners();
  }

  // filters out contact from contactList & dismisses dialog box
  void deleteContact(Map contact, BuildContext context) {
    List filteredContacts = contactList.where((i) => i["id"] != contact["id"]).toList();
    contactList = filteredContacts;

    contactBeingEdited["firstName"] = "";
    contactBeingEdited["lastName"] = "";
    contactBeingEdited["emai"] = "";
    contactBeingEdited["number"] = "";
    
    Navigator.of(context).pop();
    untoggleEditingInputs();

    notifyListeners();
  }

  // adds new contact to contactList
  void addContact(BuildContext context) {
    // sets id to current length of contactList and adds it to the list
    contactBeingEdited["id"] = contactList.length;
    contactList.add(contactBeingEdited);

    sortContacts();

    // navigates back to the home of the contacts page
    Navigator.pop(context);

    // resets contactBeingEdited
    contactBeingEdited = {
      'id': 0,
      'firstName': "",
      'lastName': "",
      'number': "",
      'email': ""
    };

    notifyListeners();
  }

  void resetContactBeingEdited() {
    contactBeingEdited = {
      'id': 0,
      'firstName': "",
      'lastName': "",
      'number': "",
      'email': ""
    };

    notifyListeners();
  }

  // updates existing contact inside contactList using contactBeingEdited Map
  void updateContact() {
    var targetContact = contactList.firstWhere((item) => item["id"] == contactBeingEdited["id"]);

    if (targetContact != null) {
      targetContact["firstName"] = contactBeingEdited["firstName"];
      targetContact["lastName"] = contactBeingEdited["lastName"];
      targetContact["number"] = contactBeingEdited["number"];
      targetContact["email"] = contactBeingEdited["email"];
    }

    untoggleEditingInputs();
    sortContacts();
    notifyListeners();
  }

  // restores saved values for the contactBeingEdited
  void restoreContact() {
    var targetContact = contactList.firstWhere((item) => item["id"] == contactBeingEdited["id"]);

    if (targetContact != null) {
      contactBeingEdited["firstName"] = targetContact["firstName"];
      contactBeingEdited["lastName"] = targetContact["lastName"];
      contactBeingEdited["number"] = targetContact["number"];
      contactBeingEdited["email"] = targetContact["email"];
    }

    untoggleEditingInputs();
    sortContacts();
    notifyListeners();
  }

  // toggle isEditingContact bool from true/false
  void toggleEditingInputs() {
    bool isEditingContact = !isCurrentlyEditingContact;
    isCurrentlyEditingContact = isEditingContact;

    notifyListeners();
  }

  // sets isEditingContact bool to false
  void untoggleEditingInputs() {
    isCurrentlyEditingContact = false;

    notifyListeners();
  }
}