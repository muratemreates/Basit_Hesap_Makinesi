import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({super.key});

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  var genislik;
  var yukseklik;
  var sayi = 0;
  int sonuc = 0;
  var islem = "";
  var toplamSayi = <int>[];

  @override
  Widget build(BuildContext context) {
    genislik = MediaQuery.of(context).size.width;
    yukseklik = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          leading: const Icon(
            Icons.apps_rounded,
            color: Colors.white,
            size: 35,
          ),
          title: const Text(
            'Hesap Makinesi',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[900]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Container(
                  height: yukseklik * 0.47,
                  width: genislik,
                  color: Colors.grey[900],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        islem,
                        style: const TextStyle(
                            fontSize: 30, color: Colors.white60),
                      ),
                      Text(
                        "= $sonuc",
                        style: const TextStyle(
                            fontSize: 55, color: Colors.white60),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blueGrey[800],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                setState(() {
                                  sonuc = 0;
                                  sayi = 0;
                                  toplamSayi.clear();
                                  islem = "";
                                });
                              },
                              child: const Text(
                                "CE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                          const Spacer(),
                          Text(
                            sayi.toString(),
                            style: const TextStyle(
                                fontSize: 45, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            Row(
              children: <Widget>[
                myButtonNNumeric("7"),
                myButtonNNumeric("8"),
                myButtonNNumeric("9"),
                myButtonNNumeric("0")
              ],
            ),
            Row(children: [
              myButtonNNumeric("4"),
              myButtonNNumeric("5"),
              myButtonNNumeric("6"),
              myButtonMaths("+")
            ]),
            Row(children: [
              myButtonNNumeric("1"),
              myButtonNNumeric("2"),
              myButtonNNumeric("3"),
              myButtonMarks("=")
            ]),
          ],
        ),
      ),
    );
  }

  Widget myButtonNNumeric(String numara) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 2),
      child: SizedBox(
        width: genislik * 0.24,
        height: yukseklik * 0.12,
        child: TextButton(
          onPressed: () {
            setState(() {
              sayi = int.parse(numara);
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.blueGrey[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5))),
          child: Text(numara,
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }

  Widget myButtonMaths(String islemim) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 2),
      child: SizedBox(
        width: genislik * 0.24,
        height: yukseklik * 0.12,
        child: TextButton(
          onPressed: () {
            setState(() {
              islem += " $sayi $islemim";
              toplamSayi.add(sayi);
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.grey[850],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5))),
          child: Text(islemim,
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }

  Widget myButtonMarks(String result) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 2),
      child: SizedBox(
        width: genislik * 0.24,
        height: yukseklik * 0.12,
        child: TextButton(
          onPressed: () {
            setState(() {
              print(toplamSayi);
              sonuc = 0;
              toplamSayi.forEach((element) {
                sonuc += element;
              });
            });
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.orange[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.5))),
          child: Text(result,
              style: const TextStyle(color: Colors.white, fontSize: 25)),
        ),
      ),
    );
  }
}
