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
    location: "123 Main St, Springfield",
    price: 59,
    image: "https://scontent.fhan14-5.fna.fbcdn.net/v/t39.30808-6/410265068_3604099446521238_3862283601799223752_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=uSF2SI7rVVMQ7kNvgGRm03F&_nc_oc=Adi8szo6uWcHhgG9XUCfmIJgPknnA0K48c9HvsEF7oB_JFbAIuIqd0fb4yWQwjxkfVg&_nc_zt=23&_nc_ht=scontent.fhan14-5.fna&_nc_gid=AlETUWD_vUSfJYRA3qMLhxw&oh=00_AYAgOVY42rMHjvO0YaJd_pgjkMI95bcB_n6ofQNxBkq_fw&oe=6789AE79",
    color: 0xFFffcdcf,
    reviews: [reviews[0], reviews[1], reviews[2], reviews[3],reviews[4]],
  ),
  Doctor(
    doctorId: 2,
    name: "ThiHaPham",
    specialist: "Therapist",
    about: about,
    location: "3516 W. Gray St. Utica, Pennsylvania",
    price: 52,
    image: "https://scontent.fhan14-4.fna.fbcdn.net/v/t39.30808-1/449437801_1891040517973800_8311837177425755620_n.jpg?stp=c0.0.640.640a_dst-jpg_s200x200_tt6&_nc_cat=107&ccb=1-7&_nc_sid=e99d92&_nc_ohc=OtQzO1nNXKcQ7kNvgE-PHkw&_nc_oc=Adhvpv5HRj_pNePMxj1BJ3Bmf-iA69xbEM7R4wW5Das23_VLihCRKLmE1LNKFC73fgY&_nc_zt=24&_nc_ht=scontent.fhan14-4.fna&_nc_gid=AQkpCu0Kx2Np-34m5ni1XoM&oh=00_AYCwSYVlnjWWKUTyIdM8KR3WynEP8Xjz53I5cj7HdtlIDQ&oe=6789B078",
    color: 0xFFf9d8b9,
    reviews: [reviews[5], reviews[6], reviews[7],],
  ),
  Doctor(
    doctorId: 3,
    name: "ThiTrangLuong",
    specialist: "Orthopedics",
    about: about,
    location: "357 Spruce Ln, Bostont",
    price: 53,
    image: "https://scontent.fhan14-4.fna.fbcdn.net/v/t39.30808-1/471643301_1629566147965926_5717491253327018117_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_ohc=jPv3GgjM2E8Q7kNvgGmZlDg&_nc_oc=AdjPR1Ol6Bsuy8SvGCQWb3tw0e9-ZSAHG1WCPsAVJyTC2xFFMYxqxtP6q5LUfMbYwEc&_nc_zt=24&_nc_ht=scontent.fhan14-4.fna&_nc_gid=AH4knW7-w8AugxiQvt1zQPJ&oh=00_AYCTL9MQmd9xaKv4979yR501Gxjl0uXhSTyGjxfBkqYYdw&oe=67899D79",
    color: 0xFFccd1fa,
    reviews: [reviews[3], reviews[2], reviews[1]],
  ),
  Doctor(
    doctorId: 4,
    name: "PhuongAnhNguyen",
    specialist: "Neurologists",
    about:about,
    location: "68 Stoughton Terrace",
    price: 80,
    image: "https://scontent.fhan14-5.fna.fbcdn.net/v/t39.30808-1/427979094_1595015844373897_370697252969515425_n.jpg?stp=c0.0.720.720a_dst-jpg_s200x200_tt6&_nc_cat=104&ccb=1-7&_nc_sid=e99d92&_nc_ohc=MWXWFHuDODIQ7kNvgH6CGzk&_nc_oc=AdjoWQoaWE_jPhlEt3VZ_8HFeN6ZRKUYDBxGz0iwzkKZ3s5gs2hen0altneH8m7QyTw&_nc_zt=24&_nc_ht=scontent.fhan14-5.fna&_nc_gid=AEYygQZBCNt7FL2ehOHZY9q&oh=00_AYCKYVNlaWr_HURmVxR7kg-30jkUxcJoP5bnXMmM48iQWg&oe=6789A223",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[4], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 5,
    name: "ThiHienHoang",
    specialist: "Emergency Medicine",
    about: about,
    location: "654 Pine St, Miami",
    price: 80,
    image: "https://scontent.fhan14-4.fna.fbcdn.net/v/t39.30808-1/442404994_1846317275871326_8920596681117580797_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_ohc=WvWVZDlNQVkQ7kNvgFCYcxD&_nc_oc=Adg_WEY5qNV_jbU7K61uTxkbsX4Wz9FuBMnBUbpCKlePj4PjVhJQRpQktp2MFG5rn4A&_nc_zt=24&_nc_ht=scontent.fhan14-4.fna&_nc_gid=ADv1gf6qkTkL-zbJ4sOkXFB&oh=00_AYCLwHxXTUeI-2sbDBXzpOQqzJafdg47symt5Hgp9ZXVhg&oe=6789B7F6",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[3], reviews[5]],
  ),
  Doctor(
    doctorId: 6,
    name: "TrungCook",
    specialist: "Neurologists",
    about:about,
    location: "789 Oak St, Los Angeles",
    price: 54,
    image: "https://scontent.fhan14-5.fna.fbcdn.net/v/t39.30808-1/462751124_1064031131879945_747328634039980935_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=109&ccb=1-7&_nc_sid=e99d92&_nc_ohc=Cj9-UIMAdlwQ7kNvgF3_YtP&_nc_oc=Adj-KbHADnWxwq9bEYpp0ZnHzW0SZ_1hJmo58UYs00-bdFzAD-RYCq7ReTm0CrkxZ4Y&_nc_zt=24&_nc_ht=scontent.fhan14-5.fna&_nc_gid=A3p3x05T8WrWEP51iwOGVeT&oh=00_AYAk0juQhSG7Q8PpbIGYfOcStQGUoDN7xScSVfyaH6OO6A&oe=678C013F",
    color: 0xFF11583c,
    reviews: [reviews[0], reviews[2], reviews[4], reviews[7],],
  ),
  Doctor(
    doctorId: 7,
    name: " Ngoc Lan Anh Nguyen",
    specialist: "Psychiatry",
    about:about,
    location: "246 Cedar Blvd, Denver",
    price: 76,
    image:
    "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/472755374_1650577375812196_5291533646770401883_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=110&ccb=1-7&_nc_sid=e99d92&_nc_ohc=voKqUAnGlrMQ7kNvgFb551o&_nc_oc=Adg8SgIffNDFsVs_HKDhJqgTQcEiC12ZrZ3E3_nQRkNZWN_crNvdVPvcKxthXADQdPk&_nc_zt=24&_nc_ht=scontent.fhan14-3.fna&_nc_gid=AUG4pyohkV81dT1OP0I5-87&oh=00_AYBm98PqT-FGEgGYbn-6y5Pr_sg4Gil1L8hc3ZZ6Z9PsVw&oe=678C01B1",
    color:  0xFFf9d8b9,
    reviews: [reviews[5], reviews[3], reviews[4], reviews[2], reviews[7]],
  ),
  Doctor(
    doctorId: 8,
    name: "Huu Chung Le",
    specialist: "Cardiologists",
    about:about,
    location: "767 Old Gate Trail",
    price: 57,
    image: "https://scontent.fhan14-4.fna.fbcdn.net/v/t39.30808-1/415256134_3720207141637562_477806305794422392_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_ohc=EC3YrHfha3wQ7kNvgEbFgGm&_nc_oc=Adg5O_D92HdbFvuqe_azrSk6Qp4Yzg74K0OPbZAk5N200J4SORewVb6EeBEXmseA-b4&_nc_zt=24&_nc_ht=scontent.fhan14-4.fna&_nc_gid=AYTS64ZkG8LpcXYb85R8DZA&oh=00_AYDtQ5Q4CGiRVsh8qCZzImxAUOx14YhatTrWaq_K1R6a5A&oe=678C19E3",
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