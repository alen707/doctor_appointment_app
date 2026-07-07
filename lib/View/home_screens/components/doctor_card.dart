import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String greyButten;
  final String blackButten;
  final String date;
  final String time;
  final String name;
  final String dep;
  final String location;
  final String hospital;
  const DoctorCard({
    super.key,
    required this.blackButten,
    required this.greyButten,
    required this.date,
    required this.time,
    required this.dep,
    required this.name,
    required this.location,
    required this.hospital,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$date - $date",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  Container(
                    height: 109,
                    width: 109,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/skip_screen_image_c.png",
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                            ),
                          ),

                          SizedBox(height: 10),
                          Text(
                            dep,
                            style: TextStyle(
                              color: Colors.grey.shade700,

                              fontSize: 14,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey.shade500,
                              ),
                              Flexible(
                                child: Text(
                                  "$hospital,$location",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.grey.shade500,

                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Container(
                height: 0,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                      ),
                      onPressed: () {},
                      child: Text(
                        greyButten,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: Text(
                        blackButten,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
