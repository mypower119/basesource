import 'package:base_constructor/app/presentation/base_widget/m_button.dart';
import 'package:base_constructor/app/presentation/base_widget/m_text.dart';
import 'package:flutter/material.dart';

class SimpleOneButton extends StatelessWidget{

  final String content;

  SimpleOneButton(this.content);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: MText(content),)
      ,
      MButton('Ok', onPressed: (){
        Navigator.of(context).pop();
      })
    ],);
  }
}