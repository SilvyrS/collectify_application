import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

Widget MyAppBar() {
  return Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xFF130f40),
          ),
          child: HeaderDrawer(),
        ),
        ListDrawer()
      ],
    ),
  );
}

Column HeaderDrawer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        '../assets/logo1.png',
        height: 80,
        width: 80,
      ),
      const SizedBox(
        height: 20,
      ),
      Text(
        'MENU',
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    ],
  );
}

Column ListDrawer() {
  return Column(
    children: [
      ListTile(
        leading: Image.asset(
          '../assets/home.png',
          height: 30,
          width: 30,
        ),
        title: Text('Home'),
      ),
      SizedBox(
        height: 20,
      ),
      ListTile(
        leading: Image.asset(
          '../assets/animal.png',
          height: 30,
          width: 30,
        ),
        title: Text('Animal Kingdom'),
      ),
      SizedBox(
        height: 20,
      ),
      ListTile(
        leading: Image.asset(
          '../assets/plant.png',
          height: 30,
          width: 30,
        ),
        title: Text('Plant Kingdom'),
      ),
      SizedBox(
        height: 20,
      ),
      ListTile(
        leading: Image.asset(
          '../assets/aboutus.png',
          height: 30,
          width: 30,
        ),
        title: Text('About Us'),
      ),
      SizedBox(
        height: 450,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text('All Rights Reserved.')],
      ),
    ],
  );
}
