import "package:flutter/material.dart";
import 'package:flutter_barcode/barcode/model/barcode.dart';
import 'package:flutter_barcode/barcode/presenter/barcode_paint.dart';
import 'package:codebb/bar_code.dart';

class Bar_code extends StatefulWidget {
  const Bar_code({super.key});

  @override
  State<Bar_code> createState() => _Bar_codeState();
}

class _Bar_codeState extends State<Bar_code> {
  TextEditingController nbr = TextEditingController();
  TextEditingController haut = TextEditingController();
  TextEditingController larg = TextEditingController();
  TextEditingController valeur = TextEditingController();
  double hhaut = 200;
  double llarg = 300;
  int nnbr = 1;
  var vbarcode;
  String? vvaleur;
  //String vvaleur = '9780201379624';
  void lhaut() {
    hhaut = double.parse(haut.text);
    llarg = double.parse(larg.text);
  }

  void vnbr() {
    nnbr = int.parse(nbr.text);
  }

  void vvvaleur() {
    print(vbarcode);
    vvaleur = valeur.text;
    print(vvaleur);
    vbarcode = Barcode.jan(valeur.text);
    print(vbarcode);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vvaleur = '4011200296908';
    //vbarcode = Barcode.jan(vvaleur);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        SizedBox(
          height: 200,
        ),
        Row(
          children: [
            Container(
              child: TextFormField(controller: haut),
              width: 100,
            ),
            Container(
              child: TextFormField(controller: larg),
              width: 100,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  lhaut();
                });
              },
              child: const Text('apply'),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: TextFormField(
                controller: nbr,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  vnbr();
                });
              },
              child: const Text('apply'),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 200,
              child: TextFormField(
                controller: valeur,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  vvvaleur();
                });
              },
              child: const Text('apply'),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: llarg),
            itemCount: nnbr,

            itemBuilder: (context, index) => BarcodePaint(
              // or Barcode.nw7("<...>")

              Barcode.jan(vvaleur!),
              size: Size(hhaut, llarg),
            ),
            // Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(8),
            //     child: const Text('4011200296908')),
          ),
        )
      ]),
    );
  }
}
