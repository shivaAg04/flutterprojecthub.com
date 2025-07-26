class FlutterProject {
  final String name;
  final String description;
  final String androidUrl;
  final String iosUrl;
  final String sourceCode;
  final String creatorName;
  final String creatorProfile;
  final String type;

  
  FlutterProject({
    required this.name,
    required this.description,
    required this.androidUrl,
    required this.iosUrl,
    required this.sourceCode,
    required this.creatorName,
    required this.creatorProfile,
    required this.type,
  });

  String toMarkdown() {
    return '''
### \$name
→ \$description  
📱 [Android](\$androidUrl) • 🍎 [iOS](\$iosUrl) • 💻 [Source Code](\$sourceCode) • 👤 [\$creatorName](\$creatorProfile)
''';
  }
}

final List<FlutterProject> flutterProjects = [
  FlutterProject(
    name: 'CRED',
    description: 'Pay credit card bills and earn rewards.',
    androidUrl: 'https://play.google.com/store/apps/details?id=com.cred.club',
    iosUrl: 'https://apps.apple.com/in/app/cred/id1189012039',
    sourceCode: '',
    creatorName: 'CRED Team',
    creatorProfile: 'https://www.cred.club',
    type: 'company',
  ),
  FlutterProject(
    name: 'Flutter Portfolio',
    description: 'Personal portfolio app built with Flutter.',
    androidUrl: 'https://example.com/apk',
    iosUrl: '',
    sourceCode: 'https://github.com/DevStack06/Flutter-Portfolio-App',
    creatorName: 'DevStack06',
    creatorProfile: 'https://linkedin.com/in/devstack06',
    type: 'personal',
  ),
];
