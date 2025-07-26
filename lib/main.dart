import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'company_app.dart';
import 'personal_app.dart';
import 'project_data_model.dart';

void main() {
  runApp(ProjectShowcaseApp());
}

class ProjectShowcaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrain) {
        double maxWidth = kIsWeb ? 420 : constrain.maxWidth;
        return Center(
          child: SizedBox(
            width: maxWidth,
            child: MaterialApp(
              title: 'Open Source Projects ',
              theme: ThemeData(
                primarySwatch: Colors.deepPurple,
              ),
              home: ProjectHomePage(),
            ),
          ),
        );
      },
    );
  }
}

class ProjectHomePage extends StatefulWidget {
  @override
  _ProjectHomePageState createState() => _ProjectHomePageState();
}

class _ProjectHomePageState extends State<ProjectHomePage> {
  bool showCompany = true;

  @override
  Widget build(BuildContext context) {
    final List<ProjectDataModel> projects =
        showCompany ? companyProjects : personalProjects;

    return Scaffold(
      appBar: AppBar(
        title: Text(showCompany ? 'Company Apps' : 'Personal Apps'),
        actions: [
          IconButton(
            icon: Icon(Icons.swap_horiz),
            tooltip: 'Switch Projects',
            onPressed: () {
              setState(() => showCompany = !showCompany);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: projects.length,
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(project.name,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(project.description),
              isThreeLine: true,
              trailing: Icon(Icons.open_in_new),
              onTap: () {
                _showProjectDetails(context, project);
              },
            ),
          );
        },
      ),
    );
  }

  void _showProjectDetails(BuildContext context, ProjectDataModel project) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          runSpacing: 8,
          children: [
            Text(project.name, style: Theme.of(context).textTheme.headline6),
            Text(project.description),
            Divider(),
            if (project.androidLink.isNotEmpty)
              LinkButton(text: 'Android App', url: project.androidLink),
            if (project.iosLink.isNotEmpty)
              LinkButton(text: 'iOS App', url: project.iosLink),
            if (project.repoLink != null)
              LinkButton(text: 'GitHub Repo', url: project.repoLink!),
            if (project.companyLink != null)
              LinkButton(text: 'Company Website', url: project.companyLink!),
            if (project.creatorLinkedIn != null)
              LinkButton(
                  text: 'Creator LinkedIn', url: project.creatorLinkedIn!),
          ],
        ),
      ),
    );
  }
}

class LinkButton extends StatelessWidget {
  final String text;
  final String url;

  const LinkButton({required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(Icons.link),
      label: Text(text),
      onPressed: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not open $url')),
          );
        }
      },
    );
  }
}
