class Durian {
  final String name;
  final String code;
  final String dateOfRegistration;
  final String origin;
  final String flavor;
  final String imagePath;

  Durian({
    required this.name,
    required this.code,
    required this.dateOfRegistration,
    required this.origin,
    required this.flavor,
    required this.imagePath
  });
}


List<Durian> durians = [
    Durian(
      name: "Musang King",
      code: "D197",
      dateOfRegistration: "9 December 1993",
      origin: "Wee Chong Beng, Tanah Merah, Kelantan",
      flavor: "Sweet yet bitter yet creamy and it melts in your mouth",
      imagePath: "assets/images/fruits/musang_king.webp", // Example image path
    ),
    Durian(
      name: "Durian Udang Merah",
      code: "D175",
      dateOfRegistration: "4 June 1990",
      origin: "Balik Pulau, Pulau Pinang",
      flavor: "Sweet with a pungent smell",
      imagePath: "assets/images/fruits/durian_udang_merah.jpg", // Example image path
    ),
    Durian(
      name: "Durian D24",
      code: "D24",
      dateOfRegistration: "30 November 1937",
      origin: "Empangan Bukit Merah, Perak",
      flavor: "Soft and sweet",
      imagePath: "assets/images/fruits/durian_d24.webp", // Example image path
    ),
    Durian(
      name: "Durian IOI",
      code: "D168",
      dateOfRegistration: "24 May 1989",
      origin: "Hjh Hasmah Hj Hashim, Muar, Johor",
      flavor: "Sweet and creamy and may be bitter for some",
      imagePath: "assets/images/fruits/durian_ioi.jpg", // Example image path
    ),
    Durian(
      name: "Durian Golden Phoenix",
      code: "D198",
      dateOfRegistration: "13 March 2013",
      origin: "Tan Sue Seng, Batu Pahat, Johor",
      flavor: "Sweet and fragrant and a very faint bitter taste",
      imagePath: "assets/images/fruits/durian_golden_phoenix.png", // Example image path
    ),
    Durian(
      name: "Durian Black Thorn",
      code: "D200",
      dateOfRegistration: "15 August 2012",
      origin: "Nibong Tebal, Pulau Pinang",
      flavor: "Sweet and custard-like, light in texture",
      imagePath: "assets/images/fruits/durian_black_thorn.png", // Example image path
    ),
    Durian(
      name: "Durian Kampung",
      code: "888",
      dateOfRegistration: "N/A",
      origin: "Gugusan Kepulauan Melayu",
      flavor: "Varies from sweet to bitter",
      imagePath: "assets/images/fruits/durian_kampung.jpg", // Example image path
    ),
    Durian(
      name: "Durian Dato Nina",
      code: "D2",
      dateOfRegistration: "-",
      origin: "-",
      flavor: "Tasty, slightly bitter and the filling is thick and soft",
      imagePath: "assets/images/fruits/durian_dato_nina.jpg", // Example image path
    ),
  ];

Durian? findDurianByName(String name) {
  for (Durian durian in durians) {
    if (durian.name.toLowerCase() == name.toLowerCase()) {
      return durian;
    }
  }
  return null; // Return null if durian with the given name is not found
}

