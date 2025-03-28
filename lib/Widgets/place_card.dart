import 'package:flutter/material.dart';
import 'package:new_assignment/Models/PLaces/place.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 100,
      child: Container(
        constraints: BoxConstraints(maxHeight: 80),
        margin: EdgeInsets.only(right: 10, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(place.imageUrl),
            fit: BoxFit.cover,
            // scale: 0.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 0.2,
              offset: Offset(10, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 15,
              child: Container(
                height: 80,
                width: 180,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(29, 29, 29, 0.4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        children: [
                          TextSpan(
                            text: "Mount Fuji, ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "Tokyo"),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.white70, size: 18),
                        const SizedBox(width: 4),
                        const Text(
                          "Tokyo, Japan",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const Spacer(),
                        const Icon(Icons.star_border,
                            color: Colors.white70, size: 18),
                        const SizedBox(width: 4),
                        const Text(
                          "4.8",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
