import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_assignment/Bloc/popular_state.dart';
import 'package:new_assignment/Bloc/populat_places.dart';
import 'package:new_assignment/Models/PLaces/place.dart';
import 'package:new_assignment/Widgets/bottom_nav.dart';
import 'package:new_assignment/Widgets/place_card.dart';

class HomeScreen extends StatelessWidget {
  var places = [
    Place(
        name: "Mount Fuji",
        location: "Tokyo, Japan",
        rating: 4.8,
        imageUrl: "assets/images/card_img1.png"),
    Place(
        name: "Andes",
        location: "South America",
        rating: 4.7,
        imageUrl: "assets/images/card_img2.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi, David 👋",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        AssetImage("assets/images/profile_pic.png"),
                  )
                ],
              ),
              SizedBox(height: 5),
              Text(
                "Explore the world",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search places",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey
                          .shade200, // Color of the border when not focused
                      width: 2.0, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.green, // Color of the border when focused
                      width: 2.0, // Border width
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular places",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("View all", style: TextStyle(color: Colors.blue)),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  FilterButton(text: "Most Viewed", selected: true),
                  FilterButton(text: "Nearby"),
                  FilterButton(text: "Latest"),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    return PlaceCard(place: places[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;
  final bool selected;

  FilterButton({required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: selected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
