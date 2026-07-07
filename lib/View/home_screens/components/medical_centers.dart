import 'package:flutter/material.dart';

class MedicalCenters extends StatefulWidget {
  final double width;
  final String name;
  final String location;
  final double rating;
  final int reviewcount;
  final String distance;
  final String time;
  final String type;

  const MedicalCenters({
    super.key,
    required this.width,
    required this.location,
    required this.name,
    required this.rating,
    required this.reviewcount,
    required this.distance,
    required this.time,
    required this.type,
  });

  @override
  State<MedicalCenters> createState() => _MadicalCentersState();
}

class _MadicalCentersState extends State<MedicalCenters> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                "assets/images/medical_centerA.jpg",
                width: widget.width,
                height: 115,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),

                  Text(
                    widget.location,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  SizedBox(height: 4),

                  Row(
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                            widget.rating.floor(),
                            (_) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                          ),
                          if (widget.rating % 1 == 0.5)
                            const Icon(
                              Icons.star_half,
                              color: Colors.amber,
                              size: 15,
                            ),
                        ],
                      ),
                      SizedBox(width: 5),
                      Text(
                        "${widget.rating} (${widget.reviewcount} Reviews)",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Container(
            //   height: 0,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey.shade300),

            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Divider(color: Colors.grey.shade300, thickness: 1),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icon/routing.png"),
                      Text(
                        "${widget.distance} / ${widget.time}",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Image.asset("assets/icon/hospital.png"),
                      Text(
                        widget.type,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
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
