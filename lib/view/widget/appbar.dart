import "package:flutter/material.dart";

AppBar getAppbar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    automaticallyImplyLeading: false,
    backgroundColor: const Color(0xffffffff),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    title: const Text(
      "SantoDay",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        color: Color(0xff000000),
      ),
    ),
  );
}
