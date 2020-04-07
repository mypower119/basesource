import 'package:base_constructor/app/presentation/dialog/model.dart';
import 'package:base_constructor/config/style.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatelessWidget {

  final String title;
  final List<ItemModel> items;
  final String idSelected;
  final Function callBack;

  SelectWidget(this.title, this.items, this.idSelected, this.callBack);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((t) => InkWell(
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                callBack(t);
                Navigator.pop(context);
              },
              child: Row(
                children: <Widget>[
                  Flexible(child: Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
                    alignment: AlignmentDirectional.centerStart,
                    child:
                    Text(t.name, style: AppStyle.styleTextNormal),
                  ),),
                  if (idSelected == t.id)...[
                    Container(
                        height: 30,
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(Icons.check)),
                  ]
                ],
              ))).toList()),
    );
  }
}
