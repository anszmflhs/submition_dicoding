import 'package:flutter/material.dart';
import 'package:submition_flutter/ResepCake.dart';
import 'package:submition_flutter/detailscreen.dart';
import 'package:submition_flutter/model/resepMakanan.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('place. Size: ${MediaQuery.of(context).size.width}')),
        body: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return ListCake();
        } else if (constraints.maxWidth <= 1200) {
          return GridCake(gridCount: 4);
        } else {
          return GridCake(gridCount: 6);
        }
      },
    ));
  }
}

class ListCake extends StatelessWidget {
  const ListCake({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263238),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 20,bottom: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Anas!',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Kue Apa yang ingin kamu masak?',
                        style: TextStyle(
                            color: Color(0xffEEE8C5),
                            fontSize: 14,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.54,left: 10,right: 10,bottom: 20),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final ItemResep cake = ListItemReseps[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(resep: cake);
                    }));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            cake.gambar,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  cake.nama,
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 16,fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  cake.chef,
                                  style: TextStyle(
                                      fontFamily: 'Poppins', fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: ListItemReseps.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ResepCake(),
          ),
        ],
      ),

      // Stack(
      //   children: <Widget>[
      //     SingleChildScrollView(
      //       child: SafeArea(
      //         child: Column(
      //           children: [
      //             Container(
      //               margin: EdgeInsets.only(
      //                 right: 24,
      //                 left: 24,
      //                 top: 16,
      //               ),
      //               child: Row(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   CircleAvatar(
      //                     child: Image.asset('images/mud_cake.jpg'),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               child: ResepCake(),
      //             ),
      //             Container(
      //               child: ListView.builder(
      //                 itemBuilder: (context, index) {
      //                   final ItemResep cake = ListItemReseps[index];
      //                   return InkWell(
      //                     onTap: () {
      //                       Navigator.push(context,
      //                           MaterialPageRoute(builder: (context) {
      //                             return DetailCarousel(resep: cake);
      //                           }));
      //                     },
      //                     child: Card(
      //                       child: Row(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: <Widget>[
      //                           Expanded(
      //                             flex: 1,
      //                             child: Image.asset(
      //                               cake.gambar,
      //                             ),
      //                           ),
      //                           Expanded(
      //                             flex: 2,
      //                             child: Padding(
      //                               padding: EdgeInsets.all(8),
      //                               child: Column(
      //                                 crossAxisAlignment:
      //                                 CrossAxisAlignment.start,
      //                                 mainAxisSize: MainAxisSize.min,
      //                                 children: <Widget>[
      //                                   Text(
      //                                     cake.nama,
      //                                     style: TextStyle(
      //                                         fontFamily: 'Poppins',
      //                                         fontSize: 16),
      //                                   ),
      //                                   SizedBox(height: 10),
      //                                   Text(
      //                                     cake.judulDetail,
      //                                     style: TextStyle(
      //                                         fontFamily: 'Poppins',
      //                                         fontSize: 16),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     ),
      //                   );
      //                 },
      //                 itemCount: ListItemReseps.length,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class GridCake extends StatelessWidget {
  late final int gridCount;

  GridCake({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff263238),
      body : Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: GridView.count(
            crossAxisCount: gridCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: ListItemReseps.map((dataresep){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return DetailScreen(resep: dataresep);
                  }));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          dataresep.gambar,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        dataresep.nama,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',fontSize: 16
                        ),
                      ),
                      Text(
                        dataresep.chef,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Poppins',fontSize: 16
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
