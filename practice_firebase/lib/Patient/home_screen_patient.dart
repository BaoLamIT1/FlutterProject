import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class HomeScreenPatient extends StatefulWidget {
  const HomeScreenPatient({super.key});

  @override
  State<HomeScreenPatient> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenPatient> {
  @override
  Widget build(BuildContext context) {
    String message = "Good";
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);
    setState(
          () {
        if (hour >= 5 && hour < 12) {
          message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          message = 'Good Afternoon';
        } else {
          message = 'Good Evening';
        }
      },
    );
    return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(message),
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, bottom: 8),
              child: Text(
                "Hello ",
                   // "//${user?.displayName}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                "Let's find your doctor",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // search doctor
            search_container(context),

            Padding(padding: EdgeInsets.only(left: 20, bottom: 15),
              child: Text("Popular doctors",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
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
                  //itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //   MaterialPageRoute(
                        //     builder: (context)=> DoctorDetailScreen(
                        //       doctor: doctors[index],
                        //     ),
                        //   ),
                        // );
                      },
                      //child: ListOfDoctors(doctor: doctors[index]),
                    );
                  },
                ),
              ),
            ),

          ],
    )
    );
  }

  Container search_container(BuildContext context) {
    return Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.search,
              //controller: _doctorName,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 20, top: 10, bottom: 10),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Search doctor',
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
                suffixIcon: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    iconSize: 20,
                    splashRadius: 20,
                    color: Colors.white,
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ),
              ),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              onFieldSubmitted: (String value) {
                setState(
                      () {
                    value.isEmpty
                        ? Container()
                        :
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold( // SearchList
                         //searchKey: value,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
  }

  // Start Header
  Padding header(String message) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Phần Avatar + Text
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://m.media-amazon.com/images/I/51+sD2iMaHL._AC_SL1027_.jpg"),
              ),
              SizedBox(width: 8),
              Text(
                message,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => const Scaffold()));
                  },
                icon: const Icon(Icons.notifications_outlined,
                size: 30,
                color: Colors.redAccent,
              ),
            ),),
          ),
        ],
      ),
    );
  }
  // End Header

}

