import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';


class AnimalCarousel extends StatelessWidget {
  final List<String> animalImages = [
    'https://images.pexels.com/photos/47547/squirrel-animal-cute-rodents-47547.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1661179/pexels-photo-1661179.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/34231/antler-antler-carrier-fallow-deer-hirsch.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/62289/yemen-chameleon-chamaeleo-calyptratus-chameleon-reptile-62289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animal Carousel')),
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Vízszintes Carousel',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items: animalImages.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(image, fit: BoxFit.cover),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 40),
            //ScrollLopAnimation
            ScrollLoopAutoScroll(
              scrollDirection: Axis.horizontal,
              duration: Duration(seconds: 60), // Lassú, folyamatos átmenet
              gap: 10, 
              enableScrollInput: true,
              child: Row(
                children: animalImages.map((image) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 5,
                    child: Image.network(image, fit: BoxFit.cover),
                  );
                }).toList(),
              ),
            ),
            Text(
              'Két függőleges Carousel egymás mellett',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Bal oldali Carousel
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        scrollDirection: Axis.vertical,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                      ),
                      items: animalImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      blurStyle: BlurStyle.normal,
                                      color: Colors.black,
                                      offset: Offset.zero,
                                      spreadRadius: 1,
                                    )
                                  ]),
                              child: Image.network(image, fit: BoxFit.cover),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Jobb oldali Carousel (visszafelé)
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        scrollDirection: Axis.vertical,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        reverse: true, // visszafelé mozog
                      ),
                      items: animalImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(color: Colors.blue),
                              child: Image.network(image, fit: BoxFit.cover),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
