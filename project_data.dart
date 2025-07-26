
class Project {
  final String name;
  final String description;
  final String androidLink;
  final String iosLink;
  final String repoLink;
  final String creatorName;

  Project({
    required this.name,
    required this.description,
    required this.androidLink,
    required this.iosLink,
    required this.repoLink,
    required this.creatorName,
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
  ),
];
