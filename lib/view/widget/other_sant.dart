// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:santo_day/controller/api_controller.dart';
import 'package:text_scroll/text_scroll.dart';

class OtherSanto extends StatelessWidget {
  String img;
  String nome;
  String descrizione;

  OtherSanto(
      {required this.nome,
      required this.descrizione,
      required this.img,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image(
            image: NetworkImage(img),
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextScroll(
                  "$nome                  ",
                  textAlign: TextAlign.start,
                  velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                //   child: Text(
                //     descrizione,
                //     textAlign: TextAlign.start,
                //     overflow: TextOverflow.clip,
                //     style: TextStyle(
                //       fontWeight: FontWeight.w700,
                //       fontStyle: FontStyle.normal,
                //       fontSize: 12,
                //       color: Color(0xff000000),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
