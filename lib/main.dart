// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: Center(
            child: Column(
              children: const [
                SizedBox(height: 30),
                ElevatedButton(onPressed: appToWeb, child: Text('App -> Web')),
                SizedBox(height: 30),
                ElevatedButton(onPressed: appToApp, child: Text('App -> App')),
                SizedBox(height: 30),
                kIsWeb
                    ? ElevatedButton(
                        onPressed: webToApp, child: Text('Web -> App'))
                    : SizedBox.shrink()
              ],
            ),
          )),
    );
  }
}

void appToWeb() async {
  const url = 'http://www.google.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void appToApp() async {
  const url = 'taobao://detail.tmall.com/item.htm?id=610147788029';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void webToApp() async {
  const url = 'h365://games.newtype.h365';
  await launch(url);
  // if (await canLaunch(url)) {
  //   await launch(url, forceSafariVC: false, forceWebView: false);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
