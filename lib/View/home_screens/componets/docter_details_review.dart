import 'package:flutter/material.dart';

class DocterDetailsReviews extends StatelessWidget {
  final String name;
  final String reviews;
  final double rating;
  const DocterDetailsReviews({
    super.key,
    required this.name,
    required this.reviews,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Row(
          children: [
            SizedBox(height: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/profile_photo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          rating.floor(),
                          (_) => const Icon(Icons.star, color: Colors.amber,size: 15),
                        ),
                        if (rating % 1 == 0.5)
                          const Icon(Icons.star_half, color: Colors.amber,size: 15),
                      ],
                    ),

                    // Icon(Icons.star, color: Colors.amber, size: 15),
                    // Icon(Icons.star, color: Colors.amber, size: 15),
                    // Icon(Icons.star, color: Colors.amber, size: 15),
                    // Icon(Icons.star, color: Colors.amber, size: 15),
                    // Icon(Icons.star, color: Colors.amber, size: 15),
                  ],
                ),
              ],
            ),
          ],
        ),

         SizedBox(height: 10),

         Text(reviews, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
