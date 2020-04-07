import 'package:base_constructor/app/presentation/base_widget/m_button.dart';
import 'package:base_constructor/config/font_size.dart';
import 'package:base_constructor/config/language.dart';
import 'package:flutter/material.dart';

class EditWidget extends StatelessWidget{

  final String hintText;

  final Function callBack;

  EditWidget(this.hintText, this.callBack);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child:TextField(
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              color: Colors.black),
          controller: controller,
          decoration: InputDecoration(
              labelStyle:
              TextStyle(color: Colors.grey, fontSize: FontSize.normalFontSize),
              contentPadding:
              const EdgeInsets.fromLTRB(
                  20.0, 15.0, 20.0, 15.0),
              hintText: hintText,),
        ),)
      ,
      Row(children: <Widget>[
        Expanded(child:MButton(lang('agree'),onPressed:(){
          callBack(controller.text);
          Navigator.of(context).pop();
        }),),
        Container(width: 20,),
        Expanded(child:   MButton(lang('cancel'),onPressed:(){
          Navigator.of(context).pop();
        }),)
      ],)

    ],);
  }
}