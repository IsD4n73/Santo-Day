// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:text_scroll/text_scroll.dart';

class DefaultSanto extends StatelessWidget {
  String img;
  String nome;
  String descrizione;

  DefaultSanto(
      {required this.nome,
      required this.descrizione,
      required this.img,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Image(
                image: NetworkImage(img),
                height: 130,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
            child: SizedBox(
              width: 120,
              child: TextScroll(
                "$nome                  ",
                velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(16, 4, 0, 8),
          //   child: Text(
          //     descrizione,
          //     textAlign: TextAlign.start,
          //     overflow: TextOverflow.clip,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.w400,
          //       fontStyle: FontStyle.normal,
          //       fontSize: 12,
          //       color: Color(0xff000000),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
