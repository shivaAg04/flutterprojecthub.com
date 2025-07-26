import 'dart:io';
import 'project_data.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Flutter Projects Showcase\n');
  buffer.writeln('Curated list of open-source Flutter apps for learning and inspiration.\n');

  for (var project in projects) {
    buffer.writeln('## ${project['name']}');
    buffer.writeln('- 🌐 **Live**: [${project['live']}](${project['live']})');
    buffer.writeln('- 📁 **GitHub**: [${project['github']}](${project['github']})');
    buffer.writeln('- 🛠️ **Tech Stack**: ${project['stack']}');
    buffer.writeln('- 📝 **Description**: ${project['description']}\n');
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());

  print('✅ README.md generated successfully.');
}
