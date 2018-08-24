import 'package:flutter/material.dart';

import '../helpers/contact_helper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ContactHelper helper = ContactHelper();

  @override
  void initState() {
    super.initState();

    /*Contact c = Contact();
    c.name = 'RobertoRibeiro';
    c.email = 'robertov82008@gmail.com';
    c.phone = '1234567890';
    c.img = 'imgtest';

    helper.saveContact(c);*/

    helper.getAllContacts().then((list) {
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
