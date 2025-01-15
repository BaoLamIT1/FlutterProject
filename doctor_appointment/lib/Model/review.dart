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
    image: "https://scontent.fhan14-4.fna.fbcdn.net/v/t39.30808-1/451414466_1405653193578633_856984365909098731_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=102&ccb=1-7&_nc_sid=e99d92&_nc_ohc=KoZkxl5IpBAQ7kNvgGqpVsD&_nc_oc=AdgFLPPOpHJX-tgQSY0nhZDMbX6Lh5ysJm4T6e9TL6pu9Brg0os-yKDr53h7QivDnjk&_nc_zt=24&_nc_ht=scontent.fhan14-4.fna&_nc_gid=AewdSLaO1EA2Tkors78uwzK&oh=00_AYByVIs1V0Plenhdzn8nP_48QWPfATHGbCHR9UkPRYnaJQ&oe=678C162C",
    rate: 4.6,
    comment:
    "Many thanks to my doctor! She is professional, expert and competent doctor...",
    date: "10/22/2022",
    color: 0xFFffcdcf,
  ),
  Review(
    id: 2,
    fullname: "LinhCu",
    image: "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/327889064_566743782003704_5880688501461637889_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=111&ccb=1-7&_nc_sid=e99d92&_nc_ohc=RK9_e2WOFa4Q7kNvgHfRymq&_nc_oc=AdjDHcH8_Y9jcfTZ2BgUUnD1-okfbK9ZlJMDpCmDssiiiAS50LhnDOqpYX1FxvFArZ4&_nc_zt=24&_nc_ht=scontent.fhan14-3.fna&_nc_gid=AXKMeUjx00zYZIRV0JvH9yF&oh=00_AYAag9Kr4JbN-STgkrVqTXIwgZeOUfFOqoY3rUmHNaVRAg&oe=678C09BD",
    rate: 3.8,
    comment:
    "Greatfull to find such a great and kind doctor",
    date: "3/16/2022",
    color:  0xFFccd1fa,
  ),
  Review(
    id: 3,
    fullname: "Thi Huong Le",
    image: "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/442504377_1251525902649792_1782880114104151020_n.jpg?stp=cp0_dst-jpg_s40x40_tt6&_nc_cat=111&ccb=1-7&_nc_sid=e99d92&_nc_ohc=wv7xSahDFWkQ7kNvgGHtfw8&_nc_oc=AdjCTiyb6NNVLYYP76phiG07w-_hoXM-Fhzj8-sX0g46yawFdcshto7gkrIFqHBH23A&_nc_zt=24&_nc_ht=scontent.fhan14-3.fna&_nc_gid=ANidVAbIPz59fW2jM-gvAms&oh=00_AYAQeRom06-9jxnaTpV_pU732xOBckDZ0R8XZO1pm1IC8Q&oe=678C153A",
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
    "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/467126571_552492037516243_7711570163516235538_n.jpg?stp=c293.157.638.639a_dst-jpg_s200x200_tt6&_nc_cat=110&ccb=1-7&_nc_sid=e99d92&_nc_ohc=S4u4_MaQ-30Q7kNvgFLUb8f&_nc_oc=AdjuWlfnH9xZq-iBO0KydjtE7xOM6FNwTW8b95Ppq_wwDQTMjImIgsjj7wczBiUsGxY&_nc_zt=24&_nc_ht=scontent.fhan14-3.fna&_nc_gid=ATpbsDIGQMwxUPJCD4BcAoL&oh=00_AYDOui2ozZ6J6qmuB5xIrRThcqmDJnpSOt5xXTPh3N-z5g&oe=678C12AF",
    rate: 3.5,
    comment:
    "I was nervous before my appointment, but the doctor’s calm and reassuring manner put me right at ease. I left with a clear understanding of my treatment plan.",
    date: "4/19/2022",
    color: 0xFFccae4d,
  ),
  Review(
    id: 5,
    fullname: "DungDung",
    image: "https://scontent.fhan14-3.fna.fbcdn.net/v/t39.30808-1/451756754_1555961551646567_372630673080038605_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=103&ccb=1-7&_nc_sid=e99d92&_nc_ohc=tKYqcmUNubIQ7kNvgGOahRj&_nc_oc=AdisvYqhMY35sTZ52XMLjlm07spLz7FRI9jenj-DQVK6_4x44szDy_z9rrWgojrCUHI&_nc_zt=24&_nc_ht=scontent.fhan14-3.fna&_nc_gid=AByv4amBbQBi-UDFR6Ig8wz&oh=00_AYB26jqqbtfN4d7AoI1xFilzFU6mPY5hlHaCRib_OukYiw&oe=678C33C5",
    rate: 3.3,
    comment:
    "Amazing experience! The doctor was thorough and answered all my questions without rushing. I feel much more confident about my health.",
    date: "10/27/2022",
    color: 0xFF086887,
  ),
  Review(
    id: 6,
    fullname: "Mada Prodrick",
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
    fullname: "Constantin Slowan",
    image: "https://i.pinimg.com/736x/55/b5/9c/55b59c73bd0ee0e42c0022168b9d36be.jpg",
    rate: 3.2,
    comment: "From start to finish, my visit was excellent. The doctor was knowledgeable, compassionate, and made me feel valued. I’ll definitely be back!",
    date: "10/24/2022",
    color: 0xFFe8ee07,
  ),
  Review(
    id: 8,
    fullname: "Sally Fernyhough",
    image: "https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D",
    rate: 3.7,
    comment:
    "The doctor was very professional and empathetic. I felt heard and understood, and the treatment has already made a difference.",
    date: "5/11/2022",
    color: 0xFFe1edf8,
  ),
];