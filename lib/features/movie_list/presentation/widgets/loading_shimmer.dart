import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMoviesWidget extends StatelessWidget{
  const LoadingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: const Color.fromRGBO(224, 222, 223, 1),
        highlightColor: const Color(0xffA3A3A3),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context,index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      color: Colors.black.withOpacity(0.8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

}