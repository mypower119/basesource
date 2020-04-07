import 'package:flutter/material.dart';

class MButton extends RaisedButton {
  String text;

  MButton(this.text, {Function onPressed}) :
        super(
          child: Text(text),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.red)
          )
      );
}
