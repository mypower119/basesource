import 'package:flutter/material.dart';

class MTextField extends TextField {

  MTextField({Function onTextChanged, TextEditingController controller})
      : super(
            controller: controller,
            onChanged: onTextChanged,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(top: 1, bottom: 1, left: 10),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
            ));
}
