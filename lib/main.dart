import 'package:flutter/material.dart';
        Padding(
          padding: EdgeInsets.only(left: 26, top: 20),
          child: Text("All reviews", style: TextStyle(
            color: Color(0xff808285),
            fontSize: 13.79,
          ),),
          ),


------------------------------------------------------------
      required this.stars,
  final double stars;

Widget _buildStars(double rating){
    const starSize = 14.0;
    List<Widget> stars = [];

    for(int i= 1; i<=5; i++){
      if(i <= rating.floor()){
        stars.add(const Icon(Icons.star, color: Colors.yellow, size: starSize,));
      }else if(i - rating <= 0.5){
        stars.add(const Icon(Icons.star_half, color: Colors.yellow, size: starSize,));
      }else{
        stars.add(const Icon(Icons.star_border, color: Colors.yellow, size: starSize,));
      }
    }

    return Row(children: stars,);
  }


       final userStars = Container(
      margin: const EdgeInsets.only(left: 20, top: 5),
      child: _buildStars(stars),
    );



-------------------



class SearchTripsPage extends StatelessWidget {
  const SearchTripsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[

          const SearchHeader(),
          
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/pantalla.png',
              fit: BoxFit.fill,
            ),
          ),


        ],
      ),
    );
  }
}


-----------


class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF6366F1)], // azul a violeta
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),

         CleanSearchBox(),
        ],
      ),
    );
  }
}
-----------

import 'package:flutter/material.dart';

class CleanSearchBox extends StatelessWidget {
  CleanSearchBox({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF6366F1)],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Knuckles Mountain Range',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.grey),
              onPressed: () {
                _controller.text = 'Bienvenido a buscar';
              },
            ),
          ],
        ),
      ),
    );
  }
}
