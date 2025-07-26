import 'dart:io';

import 'company_app.dart';
import 'personal_app.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln(
      'Curated list of open-source Flutter apps for learning and inspiration.\n');

  /// ===== COMPANY PROJECTS SECTION =====
  buffer.writeln('## 🏢 Company Projects\n');

  // A-Z Jump Menu
  buffer.writeln('### 🔤 Jump to:\n');
  for (var letter in List.generate(26, (i) => String.fromCharCode(65 + i))) {
    buffer.write('[${letter}](#company-${letter.toLowerCase()}) ');
  }
  buffer.writeln('\n');

  final sortedCompany = [...companyProjects]
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  String currentCompanyLetter = '';
  for (var project in sortedCompany) {
    final letter = project.name[0].toUpperCase();
    if (letter != currentCompanyLetter) {
      currentCompanyLetter = letter;
      buffer.writeln('\n---\n');
      buffer.writeln(
          '### <a name="company-${letter.toLowerCase()}"></a>$letter\n');
    }
    buffer.writeln('- **${project.name}**');
    if (project.androidLink.isNotEmpty) {
      buffer.writeln('  - 📱 [Android](${project.androidLink})');
    }
    if (project.iosLink.isNotEmpty) {
      buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    }
    if (project.repoLink != null && project.repoLink!.isNotEmpty) {
      buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    }
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.companyLink != null && project.companyLink!.isNotEmpty) {
      buffer.writeln('  - 🌐 [Company Website](${project.companyLink})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  /// ===== PERSONAL PROJECTS SECTION =====
  buffer.writeln('\n\n## 👨‍💻 Personal Projects\n');

  // A-Z Jump Menu
  buffer.writeln('### 🔤 Jump to:\n');
  for (var letter in List.generate(26, (i) => String.fromCharCode(65 + i))) {
    buffer.write('[${letter}](#personal-${letter.toLowerCase()}) ');
  }
  buffer.writeln('\n');

  final sortedPersonal = [...personalProjects]
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  String currentPersonalLetter = '';
  for (var project in sortedPersonal) {
    final letter = project.name[0].toUpperCase();
    if (letter != currentPersonalLetter) {
      currentPersonalLetter = letter;
      buffer.writeln('\n---\n');
      buffer.writeln(
          '### <a name="personal-${letter.toLowerCase()}"></a>$letter\n');
    }
    buffer.writeln('- **${project.name}**');
    if (project.androidLink.isNotEmpty) {
      buffer.writeln('  - 📱 [Android](${project.androidLink})');
    }
    if (project.iosLink.isNotEmpty) {
      buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    }
    if (project.repoLink != null && project.repoLink!.isNotEmpty) {
      buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    }
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.creatorLinkedIn != null &&
        project.creatorLinkedIn!.isNotEmpty) {
      buffer.writeln('  - 🔗 [Creator LinkedIn](${project.creatorLinkedIn})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md with filtered fields generated successfully.');
}
