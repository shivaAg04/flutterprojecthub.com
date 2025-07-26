import 'dart:io';
import 'project_data_model.dart';
import 'company_app.dart';
import 'personal_app.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln('Curated list of open-source Flutter apps for learning and inspiration.\n');

  buffer.writeln('## 🏢 Company Projects\n');

  final sortedCompany = [...companyProjects]..sort((a, b) => a.name.compareTo(b.name));
  for (var project in sortedCompany) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    if (project.repoLink != null && project.repoLink!.isNotEmpty) {
      buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    }
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.companyLink != null && project.companyLink!.isNotEmpty) {
      buffer.writeln('  - 🌐 [Company Website](${project.companyLink})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  buffer.writeln('## 👨‍💻 Personal Projects\n');

  final sortedPersonal = [...personalProjects]..sort((a, b) => a.name.compareTo(b.name));
  for (var project in sortedPersonal) {
    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    if (project.repoLink != null && project.repoLink!.isNotEmpty) {
      buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    }
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.creatorLinkedIn != null && project.creatorLinkedIn!.isNotEmpty) {
      buffer.writeln('  - 🔗 [Creator LinkedIn](${project.creatorLinkedIn})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md generated successfully in alphabetical order.');
}
