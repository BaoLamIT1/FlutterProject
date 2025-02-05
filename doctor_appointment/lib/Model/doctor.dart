import 'review.dart';
class Doctor {
  final int doctorId;
  final String name, specialist, about, location, image;
  final int price;
  final int color;
  final List<Review> reviews;

  const Doctor({
    required this.doctorId,
    required this.name,
    required this.specialist,
    required this.about,
    required this.location,
    required this.image,
    required this.color,
    required this.price,
    required this.reviews,
  });
}

List<Doctor> doctors = [
  Doctor(
    doctorId: 1,
    name: "BaoLamVu",
    specialist: "Pediatrician",
    about: about,
    location: "3 CauGiay Str, HaNoi",
    price: 59,
    image: "https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/410265068_3604099446521238_3862283601799223752_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=kjUl7RQeMNgQ7kNvgGTL-fh&_nc_zt=23&_nc_ht=scontent.fhan5-2.fna&_nc_gid=ASglFHDW2M-ZCyZirpEwJMT&oh=00_AYCMjyQ0SPt9wXnyHSOsaksB9qwKtYIPfU0xH1iFTC9FUQ&oe=67A800F9",
    color: 0xFFffcdcf,
    reviews: [reviews[0], reviews[1], reviews[2], reviews[3],reviews[4]],
  ),
  Doctor(
    doctorId: 2,
    name: "PhamThiHa",
    specialist: "Therapist",
    about: about,
    location: "4 CauGiay Str, HaNoi",
    price: 52,
    image: "https://img.freepik.com/premium-photo/3d-cartoon-character-doctor-with-patient_1157627-1905.jpg",
    color: 0xFFf9d8b9,
    reviews: [reviews[5], reviews[6], reviews[7],],
  ),
  Doctor(
    doctorId: 3,
    name: "ThiTrangLuong",
    specialist: "Orthopedics",
    about: about,
    location: "5 CauGiay Str, HaNoi",
    price: 53,
    image: "https://scontent.fhan5-9.fna.fbcdn.net/v/t39.30808-6/471302908_1627051004884107_3042302630238779259_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=YX2xG_L7xoIQ7kNvgFFHH66&_nc_zt=23&_nc_ht=scontent.fhan5-9.fna&_nc_gid=AW5Wf7X9GSRBkRO2-bHg5Hy&oh=00_AYDLWUr-uY1kwSrz1DNMqlgkT31VOiYymXyHQgs1_UulaQ&oe=67A7EBA5",
    color: 0xFFccd1fa,
    reviews: [reviews[3], reviews[2], reviews[1]],
  ),
  Doctor(
    doctorId: 4,
    name: "PhuongAnhNguyen",
    specialist: "Neurologists",
    about:about,
    location: "6 CauGiay Str, HaNoi",
    price: 80,
    image: "https://scontent.fhan5-6.fna.fbcdn.net/v/t39.30808-6/455705899_490624927036288_4026179797901763396_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=833d8c&_nc_ohc=mtnNTmKjKhwQ7kNvgHIXTNm&_nc_zt=23&_nc_ht=scontent.fhan5-6.fna&_nc_gid=Apru5gNJh255N-czBV9ryr0&oh=00_AYBLd-jGQZoiPcQ2vblvycrkPgO3D_4bLxP6FOiecwpvMw&oe=67A7EE25",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[4], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 5,
    name: "ThiHienHoang",
    specialist: "Emergency Medicine",
    about: about,
    location: "7 CauGiay Str, HaNoi",
    price: 80,
    image: "https://img.freepik.com/premium-photo/3d-cartoon-character-doctor-with-confident-pose_1157627-1929.jpg",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[3], reviews[5]],
  ),
  Doctor(
    doctorId: 6,
    name: "TrungCook",
    specialist: "Neurologists",
    about:about,
    location: "8 CauGiay Str, HaNoi",
    price: 54,
    image: "https://img.freepik.com/premium-vector/doctor-patient-cartoon-vector-illustration-doctor-patient-cartoon-character_1142-76232.jpg",
    color: 0xFF11583c,
    reviews: [reviews[0], reviews[2], reviews[4], reviews[7],],
  ),
  Doctor(
    doctorId: 7,
    name: " Ngoc Lan Anh Nguyen",
    specialist: "Psychiatry",
    about:about,
    location: "9 CauGiay Str, HaNoi",
    price: 76,
    image:
    "https://img.lovepik.com/png/20231107/Nurses-Day-Character-Avatar-Illustration-plant-happy-cartoon-avatar_520672_wh860.png",
    color:  0xFFf9d8b9,
    reviews: [reviews[5], reviews[3], reviews[4], reviews[2], reviews[7]],
  ),
  Doctor(
    doctorId: 8,
    name: "Huu Chung Le",
    specialist: "Cardiologists",
    about:about,
    location: "10 CauGiay Str, HaNoi",
    price: 57,
    image: "https://scontent.fhan5-2.fna.fbcdn.net/v/t39.30808-6/415256134_3720207141637562_477806305794422392_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=AGVz6rucgGoQ7kNvgEvU2eq&_nc_zt=23&_nc_ht=scontent.fhan5-2.fna&_nc_gid=A4qWltypfrjIEnwHawp2-ld&oh=00_AYDaDNFVU1dHsKjgAZ5OUw-sw_PgHWfF4ndxn_sgwuTnhw&oe=67A7FD25",
    color:  0xFFffcdcf,
    reviews: [reviews[3], reviews[5],],
  ),

];
const about =
    "is an experienced specialist who is constantly working on improving his/her skills.";

rate(Doctor doctor) {
  double rate = 0;
  for (var element in doctor.reviews) {
    rate += element.rate;
  }
  return rate / doctor.reviews.length;
}