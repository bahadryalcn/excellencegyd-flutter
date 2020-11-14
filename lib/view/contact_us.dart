import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:websitegyd/view/static_page.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return StaticPage(
      stack: Column(
        children: [
          // FloatingQuickAccessBar(),
          Container(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
      column: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: screenSize.height * 0.2,
            width: screenSize.width * 0.3,
            child: Card(
              elevation: 10,
              color: Theme.of(context).canvasColor,
              child: ContactCardItem(),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   height: screenSize.height * 0.3,
          //   width: screenSize.width * 0.3,
          //   child: Card(
          //     elevation: 10,
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.all(16),
          //   height: screenSize.height * 0.3,
          //   width: screenSize.width * 0.3,
          //   child: Card(
          //     elevation: 10,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ContactCardItem extends StatelessWidget {
  const ContactCardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.message,
              size: 30,
            ),
            Text(
              'Whatsapp: +905320629756',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          onPressed: () {
            FlutterOpenWhatsapp.sendSingleMessage("905320629756", "Hello");
          },
          color: Colors.red,
          child: Text(
            'Send message us by Whatsapp',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
