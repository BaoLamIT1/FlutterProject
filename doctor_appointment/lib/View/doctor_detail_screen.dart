
import 'package:doctor_appointment/Model/doctor.dart';
import 'package:doctor_appointment/Model/review.dart';
import 'package:doctor_appointment/View/review_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key , required this.doctor,  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      extendBody: true,
      body: SafeArea(
        child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(Icons.more_vert , color: Colors.white,)
                  ],
                ),
              ),
              CircleAvatar(radius: 45,
                backgroundColor: Color(doctor.color),
                backgroundImage: NetworkImage(doctor.image),
              ),
              SizedBox(height: 5),
              Text("Dr " + doctor.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 2),
              Text(doctor.specialist,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: const Icon(Icons.phone, color: Colors.white,),
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    child: const Icon(
                      CupertinoIcons.chat_bubble_text_fill,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(child: Container(
            padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About doctor",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                      Text( "Dr " + doctor.name +" " +doctor.about,
                        textAlign: TextAlign.justify,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          letterSpacing: 0,
                          color: Colors.black
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text("Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          letterSpacing: 0,
                      ),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.star, color: Colors.amber[800],),
                      const SizedBox(width: 5),
                      Text(rate(doctor).toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text("(${doctor.reviews.length})",
                        style: TextStyle(
                          color: Colors.grey,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(doctor.reviews.length,
                          (index) => 
                              Padding(padding: index == 0
                              ? const EdgeInsets.only(left: 15, right: 15)
                              : const EdgeInsets.only(right: 15),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ReviewItems(review: doctor.reviews[index]),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                 Padding(padding:  EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold ,
                            fontSize: 18,
                            letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurpleAccent.withOpacity(0.3),
                            ),
                            child: Icon(Icons.location_on, color: Colors.deepPurpleAccent),
                          ),
                          SizedBox(width: 25),
                          Column(
                            children: [
                              Text("UTC Medical Center",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(doctor.location, style: TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 14,),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ),
        ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
            ),
          ],
              color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Booking price", style: TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text("\$${doctor.price}",
                  style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text("Book appointment",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
