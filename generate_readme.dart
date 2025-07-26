import 'dart:io';
import 'project_data.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln('Curated list of open-source Flutter apps for learning and inspiration.\n');

  // Sort company projects by name
  final sortedCompanyProjects = [...companyProjects]..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  final sortedPersonalProjects = [...personalProjects]..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  buffer.writeln('## 🏢 Company Projects (A-Z)\n');
  for (var project in sortedCompanyProjects) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  buffer.writeln('## 👨‍💻 Personal Projects (A-Z)\n');
  for (var project in sortedPersonalProjects) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md generated and sorted A-Z successfully.');
}
