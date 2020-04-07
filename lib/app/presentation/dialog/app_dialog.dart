import 'package:base_constructor/app/presentation/dialog/model.dart';
import 'package:base_constructor/config/colors.dart';
import 'package:base_constructor/config/font_size.dart';
import 'package:base_constructor/config/language.dart';
import 'package:flutter/material.dart';
import 'child/edit_widget.dart';
import 'child/select_widget.dart';
import 'child/simple_one_button.dart';

class AppDialog extends SimpleDialog {

  AppDialog(Widget child, {String title} ) :super(
    titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
    contentPadding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    title: Container(width: double.infinity, height: 45, color: AppColors.primaryColor, alignment: AlignmentDirectional.center,

      child: Text(title??lang('notification'), style: TextStyle(fontSize: FontSize.titleToolbarFontSize, color: Colors.white),)),
    children:[child]
  );

  static showDialogSelect(BuildContext context, String title, List<ItemModel> items, String idSelected, Function callBack) {
    showDialog(context: context, builder: (_) {
          return AppDialog(SelectWidget(title, items, idSelected,callBack));
        }
    );
  }

  static showDialogOneButton(BuildContext context , String content, {String title}){
    showDialog(context: context,
        barrierDismissible:false,
        builder: (_){
          return AppDialog(SimpleOneButton(content), title: title,);
        });
  }

  static showDiloagEdit(BuildContext context , String content, Function callBack){
    showDialog(context: context,
        barrierDismissible:false,
        builder: (_){
          return AppDialog(EditWidget(content, callBack), title: lang("cancel_order2"),);
        });
  }

}
