import 'dart:io';
import 'project_data.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln('Curated list of open-source Flutter apps for learning and inspiration.\n');

  buffer.writeln('## 🏢 Company Projects\n');
  for (var project in companyProjects) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.companyLink != null && project.companyLink!.isNotEmpty) {
      buffer.writeln('  - 🌐 [Company Website](${project.companyLink})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  buffer.writeln('## 👨‍💻 Personal Projects\n');
  for (var project in personalProjects) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.creatorLinkedIn != null && project.creatorLinkedIn!.isNotEmpty) {
      buffer.writeln('  - 🔗 [Creator LinkedIn](${project.creatorLinkedIn})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md generated successfully.');
}
