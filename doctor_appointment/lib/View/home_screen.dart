import 'package:doctor_appointment/Model/doctor.dart';
import 'package:doctor_appointment/Model/symptom.dart';
import 'package:doctor_appointment/View/doctor_detail_screen.dart';
import 'package:doctor_appointment/View/list_of_doctors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}
class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          const SizedBox(height: 20),
          clinic_home_visit(),
          const SizedBox(height: 30),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("What are your symptoms?",
          style: TextStyle(
              fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: 0),
          ),
          ),
          const SizedBox(height: 20),
          symptoms_scrollView(),
          const SizedBox(height: 20),
          Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text("Popular doctors",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  letterSpacing: 0),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // Vô hiệu hóa cuộn trong GridView
                shrinkWrap: true, // Để GridView co dãn trong SingleChildScrollView
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Số cột
                  crossAxisSpacing: 16, // Khoảng cách giữa các cột
                  mainAxisSpacing: 14, // Khoảng cách giữa các hàng
                  childAspectRatio: 0.8, // Tỷ lệ giữa chiều rộng và chiều cao của các phần tử
                ),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context)=> DoctorDetailScreen(
                                doctor: doctors[index],
                              ),
                          ),
                      );
                    },
                    child: ListOfDoctors(doctor: doctors[index]),
                  );
                },
              ),
            ),
          ),

        ],
      ),
    );
  }

  SingleChildScrollView symptoms_scrollView() {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              ...List.generate(symptoms.length,
                  (index) => Padding(padding: index ==0
                  ? const EdgeInsets.only(left: 15, right: 15)
                  : const EdgeInsets.only(right: 15),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(symptoms[index].image),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          symptoms[index].label,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  ),
              ),
            ],
          ),
        );
  }

  Padding clinic_home_visit() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(-0, 10),
                    ),
                  ],
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 60,
                      color: Colors.white,
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Clinic visit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                        Text("Make an appointment",
                          style: TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              SizedBox(width: 15),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.home_filled,
                            size: 40,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Home visit",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0,
                              ),
                            ),
                            Text("Call the doctor home",
                              style: TextStyle(
                                color: Colors.black38,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            ],
          ),
        );
  }

  Padding header() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("LamBaoBao" ,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset("images/hand.png", height: 40, width: 40,),
                ],
              ),
              CircleAvatar(radius: 27,
              backgroundImage: NetworkImage("https://m.media-amazon.com/images/I/51+sD2iMaHL._AC_SL1027_.jpg"),
              )
            ],
          ),
        );
  }

}
