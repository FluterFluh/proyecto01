
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color(0xffFF6975),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0.8, 1),
                  colors: <Color>[Color(0xFFFFC700), Color(0xffFF6975)])),
          height: size.height > size.width ? size.height - 24 : size.height>600? size.height:720,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: SizedBox(
                    child: CarouselWithIndicatorDemo(),
                  )),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 300,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(child: SizedBox()),
                               ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child:const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child:  Text(
                                        "Inicio",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  )),
                          
                             const SizedBox(height: 30,),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      const MaterialStatePropertyAll<Color>(
                                          Color(0xFFffbc0d)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      // Change your radius here
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const SizedBox(
                                  height: 50,
                                  child:  Center(
                                    child: Text(
                                      "Create an account",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                  ),
                                )),
                            const Expanded(
                              child: SizedBox(),
                            )
                              
                          ]),
                    ),
                  )
            ],
          ),
        ),
      )),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

final List<String> imgList = [
  'assets/img/max.png',
  'assets/img/tienda.png',
  'assets/img/Google.png',
];
List<TextStyle?> textStyles1 = [
  // ignore: prefer_const_constructors

  const TextStyle(
    color: Color(0xFFFF6A73),
    fontFamily: 'Inter',
    fontSize: 50.0,
    fontWeight: FontWeight.w600,
  ),
  const TextStyle(
    color: Colors.white,
    fontFamily: 'Inter',
    fontSize: 50.0,
    fontWeight: FontWeight.w600,
  ),
  const TextStyle(
    color: Colors.white,
    fontFamily: 'Inter',
    fontSize: 30.0,
    fontWeight: FontWeight.w300,
  ),
  const TextStyle(
    color: Color(0xFFFF6A73),
    fontFamily: 'Inter',
    fontSize: 50.0,
    fontWeight: FontWeight.w600,
  ),
];

List<Widget> titulo1 = [
  Text(
    "NO",
    textAlign: TextAlign.start,
    style: textStyles1[3],
  ),
  Text(
    "M??S",
    style: textStyles1[1],
  ),
  Text(
    "FILAS",
    style: textStyles1[0],
  )
];
List<Widget> titulo2 = [
  Text(
    "LOCALES",
    style: textStyles1[1],
  ),
  Text(
    "CERCA DE TI ",
    style: textStyles1[2],
  ),
];

//final List<String> titulos = ["NO M??S FILAS", "LOCALES CERCA DE T??", "Titulo3"];
final List<String> subtitulos = [
  "Tu tiempo es importante",
  "Encuentra tu sitio favorito",
  "Titulo3"
];

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Expanded(
          child: Column(
            children: [
             const SizedBox(
                height: 10,
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox( width:300,  child: Row(
                    mainAxisAlignment: _current==0? MainAxisAlignment.start:_current==1?MainAxisAlignment.center:MainAxisAlignment.end,
                    children: [
                      _buildText(_current),
                    ],
                  ))),
              Expanded(
                flex: 1,
                child: CarouselSlider(
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(
                      autoPlayInterval: const Duration(seconds: 7),
                      autoPlay: true,
                      enlargeCenterPage: false,
                      aspectRatio: 2.5,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Container(width: 390, height: 35, color: const Color(0xFFffbc0d)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  subtitulos[_current],
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 25.0,
                height: 9.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 1.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (_current == entry.key
                      ? const Color(0xFFFFC700)
                      : Colors.white.withOpacity(0.3)),
                  // withOpacity(_current == entry.key ? 1 : 0.4)),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(item, fit: BoxFit.cover),
                    ],
                  )),
            ),
          ))
      .toList();
}

Widget _buildText(int parametro) {
  switch (parametro) {
    case 0:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [titulo1[0], titulo1[1], titulo1[2]],
      );    
    case 1:
      return Column(
        children: [ Expanded(child: SizedBox()), titulo2[0], titulo2[1],Expanded(child: SizedBox())],
      );    
    default:
      return Text("titulo 3 no asignado ");
  }
}
