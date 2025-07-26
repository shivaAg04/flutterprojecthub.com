
import 'data.dart';

void main() {
  final buffer = StringBuffer();

  buffer.writeln('# 🚀 Awesome Flutter Projects (Auto-Generated)\n');
  buffer.writeln('_This README is generated from Dart source._\n');

  buffer.writeln('## 🏢 Company Apps\n');
  for (var project in companyProjects) {
    buffer.writeln(generateMarkdown(project));
  }

  buffer.writeln('\n## 👨‍💻 Personal Projects\n');
  for (var project in personalProjects) {
    buffer.writeln(generateMarkdown(project));
  }

  final file = File('README.md');
  file.writeAsStringSync(buffer.toString());
}

String generateMarkdown(Project project) {
  return '''
### \${project.name}
→ \${project.description}  
📱 [Android](\${project.androidLink}) · 🍎 [iOS](\${project.iosLink}) · 💻 [Source Code](\${project.repoLink}) · 👤 \${project.creatorName}
''';
}
