import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SaveFormButton extends StatelessWidget {
  final Function saveForm;
  const SaveFormButton(this.saveForm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 50, 167, 53), shape: BoxShape.circle),
      child: Builder(builder: (context) {
        return Platform.isIOS
            ? CupertinoButton(
                child: Icon(CupertinoIcons.check_mark,
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .selectedItemColor),
                onPressed: () {
                  saveForm;
                })
            : IconButton(
                onPressed: () {
                  saveForm;
                },
                iconSize: 40,
                icon: const Icon(Icons.check),
              );
      }),
    );
  }
}
