class Project {
  final String name;
  final String description;
  final String androidLink;
  final String iosLink;
  final String repoLink;
  final String creatorName;
  final String? companyLink;
  final String? creatorLinkedIn;

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
