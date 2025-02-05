class Review {
  final int id;
  final String fullname, image, comment;
  final String date;
  final double rate;
  final int color;
  Review({
    required this.id,
    required this.rate,
    required this.fullname,
    required this.image,
    required this.comment,
    required this.date,
    required this.color,
  });
}
List<Review> reviews = [
  Review(
    id: 1,
    fullname: "TrangVee",
    image: "https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/475328894_2319118295137931_7386019908677042214_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=15RXOZfLe1oQ7kNvgEmWH1T&_nc_zt=23&_nc_ht=scontent.fhan5-11.fna&_nc_gid=AZhBQBWeNCqqq6VqmIjRj9G&oh=00_AYBfsoFQTRBUzCYlvNA3d3Rhqa_RH8cRfRNlzhR3eBzWkw&oe=67A8F1A5",
    rate: 4.6,
    comment:
    "Many thanks to my doctor! The doctor is professional, expert and competent doctor...",
    date: "10/22/2022",
    color: 0xFFffcdcf,
  ),
  Review(
    id: 2,
    fullname: "LinhCu",
    image: "https://scontent.fhan5-11.fna.fbcdn.net/v/t39.30808-6/462297592_2313113732362487_6469802258981841060_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=cl616VHLMsAQ7kNvgERxnKf&_nc_zt=23&_nc_ht=scontent.fhan5-11.fna&_nc_gid=ANP0FwEq4jSysgRPY4jgieJ&oh=00_AYC-jnoB5lRuHvkPO46BKUgBPacsUINiWT8yPWX779q4nQ&oe=67A8F0A1",
    rate: 3.8,
    comment:
    "Greatfull to find such a great and kind doctor",
    date: "3/16/2022",
    color:  0xFFccd1fa,
  ),
  Review(
    id: 3,
    fullname: "Thi Huong Le",
    image: "https://img.pikbest.com/png-images/qiantu/sick-patient-cartoon-image-illustration_2718936.png!sw800",
    rate: 4.5,
    comment:
    "The doctor was incredibly attentive and really took the time to listen to my concerns. I felt like my health and well-being truly mattered. Highly recommend!",
    date: "12/10/2022",
    color: 0xFFf9d8b9,
  ),
  Review(
    id: 4,
    fullname: "BaoLamLam",
    image:
    "https://t3.ftcdn.net/jpg/04/97/68/08/360_F_497680856_nWYZ4OrUdRPAhcPYgaYDxKGV1jHqLjZL.jpg",
    rate: 3.5,
    comment:
    "I was nervous before my appointment, but the doctor’s calm and reassuring manner put me right at ease. I left with a clear understanding of my treatment plan.",
    date: "4/19/2022",
    color: 0xFFccae4d,
  ),
  Review(
    id: 5,
    fullname: "DungDung",
    image: "https://img.freepik.com/premium-photo/3d-cartoon-character-doctor-with-patient_1157627-1934.jpg",
    rate: 3.3,
    comment:
    "Amazing experience! The doctor was thorough and answered all my questions without rushing. I feel much more confident about my health.",
    date: "10/27/2022",
    color: 0xFF086887,
  ),
  Review(
    id: 6,
    fullname: "NguyenVanA",
    image:
    "https://png.pngtree.com/thumb_back/fh260/background/20230614/pngtree-woman-in-sunglasses-standing-in-front-of-a-dark-background-image_2891237.jpg",
    rate: 3.9,
    comment:
    "The level of care I received was outstanding! I appreciated how the doctor explained everything in detail, making sure I understood my options.",
    date: "10/11/2022",
    color: 0xFFe1edf8,
  ),
  Review(
    id: 7,
    fullname: "PhamThiB",
    image: "https://i.pinimg.com/736x/55/b5/9c/55b59c73bd0ee0e42c0022168b9d36be.jpg",
    rate: 3.2,
    comment: "From start to finish, my visit was excellent. The doctor was knowledgeable, compassionate, and made me feel valued. I’ll definitely be back!",
    date: "10/24/2022",
    color: 0xFFe8ee07,
  ),
  Review(
    id: 8,
    fullname: "TranNgocC",
    image: "https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D",
    rate: 3.7,
    comment:
    "The doctor was very professional and empathetic. I felt heard and understood, and the treatment has already made a difference.",
    date: "5/11/2022",
    color: 0xFFe1edf8,
  ),
];