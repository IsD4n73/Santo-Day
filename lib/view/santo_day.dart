import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:santo_day/controller/api_controller.dart';
import 'package:santo_day/model/santo_model.dart';
//import 'package:santo_day/view/widget/appbar.dart';
import 'package:santo_day/view/widget/default_sant.dart';
import 'package:santo_day/view/widget/other_sant.dart';
import 'package:santo_day/view/widget/tomorrow_sant.dart';

class SantoDay extends StatefulWidget {
  const SantoDay({super.key});

  @override
  State<SantoDay> createState() => _SantoDayState();
}

class _SantoDayState extends State<SantoDay> {
  List<SantoModel> santi = [SantoModel(nome: "N/D", urlimmagine: noImg)];
  SantoModel santoDomani = SantoModel(nome: "N/D", urlimmagine: noImg);
  SantoModel santoOggi = SantoModel(nome: "N/D", urlimmagine: noImg);

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    String date = DateFormat('yyyy-MM-dd').format(now);
    String tomorrow =
        DateFormat('yyyy-MM-dd').format(now.add(const Duration(days: 1)));

    fetchSanto(date).then((value) {
      setState(() {
        santi = value;
      });
    });

    fetchSanto(date).then(
      (value) {
        for (var santo in value) {
          if (santo.defaults == "1") {
            setState(() {
              santoOggi = santo;
            });
          }
        }
      },
    );

    fetchSanto(tomorrow).then(
      (value) {
        for (var santo in value) {
          if (santo.defaults == "1") {
            setState(() {
              santoDomani = santo;
            });
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      //appBar: getAppbar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Text(
                "lI Santo Di Oggi",
                textAlign: TextAlign.start,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  fontSize: 16,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              padding: const EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0x00ffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.zero,
              ),
              child: DefaultSanto(
                img: santi[0].urlimmagine!,
                nome: santi[0].nome!,
                descrizione: santi[0].descrizione ?? "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    "Altri Santi Di Oggi",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: santi.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: OtherSanto(
                      nome: santi[index].nome ?? "N/D",
                      descrizione: santi[index].descrizione ?? "",
                      img: santi[index].urlimmagine ?? noImg),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    "Santo Di Domani",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TomorrowSanto(
                  img: santoDomani.urlimmagine ?? noImg,
                  nome: santoDomani.nome ?? "N/D",
                  descrizione: santoDomani.descrizione ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
