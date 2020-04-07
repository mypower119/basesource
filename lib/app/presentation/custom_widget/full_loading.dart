import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:loading/loading.dart';

class FullLoading extends StatelessWidget {
  final bool isLoading;

  FullLoading(this.isLoading);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black12.withOpacity(0.4),
              ),
              Center(
                  child: Loading(indicator: BallSpinFadeLoaderIndicator(), size: 35.0),)
            ],
          )
        : Container();
  }
}
