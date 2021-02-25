/// Ismail Alam Khan and roipeker, 2020.
///

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graphx/graphx.dart';

import 'assets.dart';
import 'scene.dart';

class HeartReactionMain extends StatelessWidget {
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MPSBuilder(
        mps: mps,
        topics: [
          'like',
          'animfinish',
        ],
        builder: (_, event, __) {
          trace(event.type);
          return FloatingActionButton(
            key: _key,
            onPressed: event.type == 'like' ? null : () => mps.emit('like'),
            backgroundColor: event.type == 'like'
                ? Theme.of(context).disabledColor
                : Colors.red,
            disabledElevation: 0,
            elevation: 6,
            child: SvgPicture.string(
              SvgAssets.HEART,
              color: event.type == 'like' ? Colors.red : Colors.white,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/heart_reaction/background_photo.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SceneBuilderWidget(
          builder: () => SceneController(
            back: HeartScene(key: _key),
          ),
        ),
      ),
    );
  }
}
