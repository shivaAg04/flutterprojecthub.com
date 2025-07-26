import 'dart:io';
import 'project_data_model.dart';
import 'company_app.dart';
import 'personal_app.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln('Curated list of open-source Flutter apps for learning and inspiration.\n');

  // Add Alphabetical Index (A-Z)
  buffer.writeln('### 🔤 Jump to:\n');
  for (var letter in List.generate(26, (i) => String.fromCharCode(65 + i))) {
    buffer.write('[${letter}](#${letter.toLowerCase()}) ');
  }
  buffer.writeln('\n');

  // Merge and sort all projects alphabetically
  final allProjects = [...companyProjects, ...personalProjects];
  allProjects.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  String currentLetter = '';

  for (var project in allProjects) {
    final firstLetter = project.name[0].toUpperCase();

    if (firstLetter != currentLetter) {
      currentLetter = firstLetter;
      buffer.writeln('\n---\n');
      buffer.writeln('## <a name="${currentLetter.toLowerCase()}"></a>$currentLetter\n');
    }

    buffer.writeln('- **${project.name}**');
    buffer.writeln('  - 📱 [Android](${project.androidLink})');
    buffer.writeln('  - 🍎 [iOS](${project.iosLink})');
    if (project.repoLink != null && project.repoLink!.isNotEmpty) {
      buffer.writeln('  - 💻 [Repo](${project.repoLink})');
    }
    buffer.writeln('  - 👤 Creator: ${project.creatorName}');
    if (project.companyLink != null && project.companyLink!.isNotEmpty) {
      buffer.writeln('  - 🌐 [Company Website](${project.companyLink})');
    } else if (project.creatorLinkedIn != null && project.creatorLinkedIn!.isNotEmpty) {
      buffer.writeln('  - 🔗 [Creator LinkedIn](${project.creatorLinkedIn})');
    }
    buffer.writeln('  - 📝 Description: ${project.description}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md with A-Z navigation generated successfully.');
}
