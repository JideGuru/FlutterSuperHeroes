import 'package:flutter/material.dart';

class SuperheroAvatar extends StatelessWidget {
  const SuperheroAvatar({
    super.key,
    required this.img,
    this.radius = 40.0,
  });

  final double radius;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(0.0, 0.0),
            blurRadius: 2.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(
            img,
          ),
        ),
      ),
    );
  }
}
