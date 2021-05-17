import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double textFontSize = 17.0;
    return Scaffold(
      appBar: AppBar(
          title: const Text('About Me'),
      ),
      body: Center(
        child: Column (
          children: <Widget>[
            // Add space between AppBar with details by Padding
            Padding(padding: const EdgeInsets.all(20.0)),
            // Insert the photo profile
            Stack(
              children: <Widget>[
                Positioned(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/photo.jpg'),
                    )
                )
              ],
            ),
            // Add space between photo with texts by Padding
            Padding(padding: const EdgeInsets.all(20.0)),
            // Full name details
            RichText(
              text: TextSpan(
                text: 'Nama Lengkap: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: textFontSize, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Muhammad Athallah',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: textFontSize, color: Colors.black),
                  )
                ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Nama Panggilan: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: textFontSize, height: 2, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Athal',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: textFontSize, color: Colors.black),
                    )
                  ]
              ),
            ),
            RichText(
              text: TextSpan(
                  text: 'Hobi: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: textFontSize, height: 2, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Mempelajari hal baru, Membaca buku',
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: textFontSize, color: Colors.black),
                    )
                  ]
              ),
            ),
            // Add space between texts with social media details by Padding
            Padding(padding: const EdgeInsets.all(20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {
                    launch('https://www.facebook.com/mhdathallah.id/');
                  },
                ),
                ElevatedButton(
                  child: Icon(FontAwesomeIcons.instagram),
                  onPressed: () {
                    launch('https://www.instagram.com/mhd.athallah/');
                  },
                ),
                ElevatedButton(
                  child: Icon(FontAwesomeIcons.envelope),
                  onPressed: () {
                    launch(Uri.encodeFull('mailto:muhammad.athallah01@ui.ac.id'));
                  },
                ),
                ]
            ),
          ],
        )
      )
    );
  }
}
