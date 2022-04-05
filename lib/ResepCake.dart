import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:submition_flutter/model/resepMakanan.dart';

class ResepCake extends StatelessWidget {
  const ResepCake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        enlargeCenterPage: true,
        disableCenter: true,
        // viewportFraction: 0.63,
      ),
      itemBuilder: (context, index, realIndex) {
        final ItemResep resep = ListItemResep[index];
        return InkWell(
          highlightColor: Colors.transparent,
          child: ItemCarousel(resep: resep),
        );
      },
      itemCount: ListItemResep.length,
    );
  }
}

class ItemCarousel extends StatelessWidget {
  final ItemResep resep;

  ItemCarousel({required this.resep});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   topRight: Radius.circular(30),
          //   bottomLeft: Radius.circular(30),
          // ),
          ),
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            child: ClipRRect(
              // borderRadius: BorderRadius.only(
              //   topRight: Radius.circular(30),
              //   bottomLeft: Radius.circular(30),
              // ),
              child: Image.asset(resep.gambar, fit: BoxFit.cover),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
              borderRadius: BorderRadius.only(
                  // topRight: Radius.circular(30),
                  // bottomLeft: Radius.circular(30),
                  ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xff263238),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8,
                        ),
                        child: Text(
                          'Hot',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 8, right: 12),
                    //   child: CircleAvatar(
                    //     backgroundColor: Color(0xff263238),
                    //     // child: FavoriteButton(),
                    //   ),
                    // )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0, left: 18, right: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        resep.nama,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Row(
                        children: [
                          // Text(
                          //   resep.durasi + ' Menit',
                          //   style: TextStyle(
                          //     color: Colors.grey,
                          //     fontFamily: 'Poppins',
                          //     fontSize: 18,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(left: 8.0),
                          //   child: Text(
                          //     resep.serving + ' Serving',
                          //     style: TextStyle(
                          //       color: Colors.grey,
                          //       fontFamily: 'Poppins',
                          //       fontSize: 18,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class FavoriteButton extends StatefulWidget {
//   const FavoriteButton({Key? key}) : super(key: key);
//
//   @override
//   State<FavoriteButton> createState() => _FavoriteButtonState();
// }
//
// class _FavoriteButtonState extends State<FavoriteButton> {
//   bool isFavorite = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       // splashColor: Colors.transparent,
//       icon: Icon(isFavorite ? Icons.bookmark : Icons.bookmark_border,
//           color: Color(0xffFFE8C5)),
//       onPressed: () {
//         setState(() {
//           isFavorite = !isFavorite;
//         });
//       },
//     );
//   }
// }
