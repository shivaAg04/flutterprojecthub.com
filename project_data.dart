class Project {
  final String name;
  final String description;
  final String androidLink;
  final String iosLink;
  final String repoLink;
  final String creatorName;
  final String? companyLink;       // Optional: For company projects
  final String? creatorLinkedIn;   // Optional: For personal projects

  Project({
    required this.name,
    required this.description,
    required this.androidLink,
    required this.iosLink,
    required this.repoLink,
    required this.creatorName,
    this.companyLink,
    this.creatorLinkedIn,
  });
}
final List<Project> companyProjects = [
  Project(
    name: "CRED",
    description: "Credit card management app",
    androidLink: "https://play.google.com/store/apps/details?id=com.cred.club",
    iosLink: "https://apps.apple.com/in/app/cred/id1424942477",
    repoLink: "https://github.com/example/cred",
    creatorName: "CRED Team",
    companyLink: "https://cred.club",
  ),
  Project(
    name: "Zomato",
    description: "Food delivery and restaurant discovery app",
    androidLink: "https://play.google.com/store/apps/details?id=com.application.zomato",
    iosLink: "https://apps.apple.com/in/app/zomato-food-delivery-dining/id434613896",
    repoLink: "https://github.com/example/zomato-clone",
    creatorName: "Zomato Dev Team",
    companyLink: "https://www.zomato.com",
  ),
  Project(
    name: "Swiggy",
    description: "India's largest food delivery app",
    androidLink: "https://play.google.com/store/apps/details?id=in.swiggy.android",
    iosLink: "https://apps.apple.com/in/app/swiggy-food-grocery-delivery/id989540920",
    repoLink: "https://github.com/example/swiggy-clone",
    creatorName: "Swiggy Mobile Team",
    companyLink: "https://www.swiggy.com",
  ),
  Project(
    name: "Groww",
    description: "Investment app for stocks, mutual funds, and more",
    androidLink: "https://play.google.com/store/apps/details?id=com.nextbillion.groww",
    iosLink: "https://apps.apple.com/in/app/groww/id1404871707",
    repoLink: "https://github.com/example/groww-clone",
    creatorName: "Groww Developers",
    companyLink: "https://groww.in",
  ),
  Project(
    name: "Dream11",
    description: "Fantasy sports platform",
    androidLink: "https://www.dream11.com/download-app",
    iosLink: "https://apps.apple.com/in/app/dream11-fantasy-cricket/id1072752802",
    repoLink: "https://github.com/example/dream11-clone",
    creatorName: "Dream11 Engineering",
    companyLink: "https://www.dream11.com",
  ),
  Project(
    name: "CureFit",
    description: "Fitness and wellness platform",
    androidLink: "https://play.google.com/store/apps/details?id=fit.cure.android",
    iosLink: "https://apps.apple.com/in/app/cult-fit-fitness-gym-diet/id1217794588",
    repoLink: "https://github.com/example/curefit-clone",
    creatorName: "CureFit Tech Team",
    companyLink: "https://www.cult.fit",
  ),
];

final List<Project> personalProjects = [
  Project(
    name: "My Portfolio App",
    description: "A beautiful personal portfolio built in Flutter.",
    androidLink: "https://play.google.com/store/apps/details?id=com.myportfolio.app",
    iosLink: "https://apps.apple.com/app/id1234567890",
    repoLink: "https://github.com/username/portfolio",
    creatorName: "Shiva Agrahari",
    creatorLinkedIn: "https://www.linkedin.com/in/shivaag04",
  ),
];
