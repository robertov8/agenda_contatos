import 'dart:io';

import 'package:agenda_contatos/helpers/contact_helper.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact _editedContact;
  bool _userEdited = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact.name ?? 'Novo Contato'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: _editedContact.img != null
                                ? FileImage(File(_editedContact.img))
                                : AssetImage('images/person.png'))),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  controller: _nameController,
                  onChanged: (text) {
                    _userEdited = true;

                    setState(() {
                      _editedContact.name = text;
                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'E-mail'),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text) {
                    _userEdited = true;
                    _editedContact.email = text;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Phone'),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onChanged: (text) {
                    _userEdited = true;
                    _editedContact.phone = text;
                  },
                )
              ],
            )),
      ),
    );
  }
}
