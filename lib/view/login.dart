
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          decoration:const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors:<Color>[Colors.orange,Colors.red]
          )),
          height: size.height>size.width? size.height-30:size.width,
          child: Column(
            children: [
              Expanded( flex: 4, child: SizedBox( child: CarouselWithIndicatorDemo(),)),
              Expanded(flex: 2, child: SizedBox(width: 250, child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                const Expanded(child: SizedBox(),),
                ElevatedButton( style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.white) ), onPressed: (){}, child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 17),) ),
                
                const Expanded(child: SizedBox(),),
                 ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber), ), onPressed: (){}, child: Text("Create an account",style: TextStyle(color: Colors.black,fontSize: 17))),
                 const Expanded(child: SizedBox(),)
              ]),))
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

final List <String> titulos=["NO MÁS FILAS","LOCALES CERCA DE TÍ","Titulo3"];
final List <String> subtitulos=["Tu tiempo es importante","Encuentra tu sitio favorito","Titulo3"];

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
              Expanded(flex: 1, child: SizedBox(width: 200, child: Center(child: Text(titulos[_current],style: TextStyle(fontSize: 45 ,color: Colors.white),)))),
              Expanded(
                flex: 1,
                child: CarouselSlider(
              
                  items: imageSliders,
                  carouselController: _controller,
                  options: CarouselOptions(autoPlayInterval: Duration(seconds: 7),
                      autoPlay: true,
                      enlargeCenterPage: true,
                       aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ),
              Container(height: 25, color: Colors.amber,),
              Container(margin:const EdgeInsets.symmetric(vertical: 20), child: Text(subtitulos[_current],style: TextStyle(fontSize: 20 ,color: Colors.white),),)
             
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
                margin:const EdgeInsets.symmetric(vertical: 4.0, horizontal: 13.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.black
                            : Colors.orange)
                        .withOpacity(_current == entry.key ? 1 : 0.4)
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
