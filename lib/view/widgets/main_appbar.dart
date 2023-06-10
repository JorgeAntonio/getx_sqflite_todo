import 'package:flutter/material.dart';

AppBar mainAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.grey,
    elevation: 0,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ],
        ),
      ),
    ],
  );
}
