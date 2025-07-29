import 'package:app/core/app_color.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/company_app.dart';
import '../data/personal_app.dart';
import '../viewModel/home_screen_viewmodel.dart';
import '../widgets/fading_border_container.dart';
import '../widgets/link_project.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Consumer<HomeScreenViewmodel>(
          builder: (context, provider, _) => Text(
            provider.showCompany
                ? 'Company Apps ${companyProjects.length}'
                : 'Personal Apps ${personalProjects.length}',
            style: TextStyle(color: AppColor.white),
          ),
        ),
        actions: [
          Consumer<HomeScreenViewmodel>(
            builder: (context, provider, _) => IconButton(
              icon: Icon(Icons.swap_horiz, color: AppColor.white),
              tooltip: 'Switch Projects',
              onPressed: provider.toggleProjectType,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          /// Search Box
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<HomeScreenViewmodel>(
              builder: (context, provider, _) => FadingBorderContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search projects...',
                    hintStyle:
                        TextStyle(color: AppColor.white.withOpacity(0.8)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: provider.updateSearch,
                ),
              ),
            ),
          ),

          /// Project List
          Expanded(
            child: Consumer<HomeScreenViewmodel>(
              builder: (context, provider, _) {
                final projects = provider.projects;
                return projects.isEmpty
                    ? Center(
                        child: Text(
                          'No projects found',
                          style: TextStyle(color: AppColor.white),
                        ),
                      )
                    : ListView.builder(
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          final project = projects[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: GestureDetector(
                              onTap: () async {
                                // comapny app link
                                if (project.companyLink != null &&
                                    project.companyLink!.isNotEmpty) {
                                  if (await canLaunchUrl(
                                      Uri.parse(project.companyLink!))) {
                                    await launchUrl(
                                        Uri.parse(project.companyLink!));
                                  }
                                }
                              },
                              child: FadingBorderContainer(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              project.imageUrl ??
                                                  "https://play-lh.googleusercontent.com/r2ZbsIr5sQ7Wtl1T6eevyWj4KS7QbezF7JYB9gxQnLWbf0K4kU7qaLNcJLLUh0WG-3pK=w480-h960-rw",
                                              height: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    project.name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColor.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    height: 4,
                                                    width: 4,
                                                    decoration: BoxDecoration(
                                                      color: AppColor.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  // grey circle icon

                                                  Text(
                                                    project.industry.name,
                                                    style: TextStyle(
                                                      color: AppColor.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 200,
                                                child: Text(
                                                  project.description,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          if (project.androidLink.isNotEmpty)
                                            LinkButton(
                                                text: 'Android App',
                                                url: project.androidLink),
                                          if (project.iosLink.isNotEmpty)
                                            LinkButton(
                                                text: 'iOS App',
                                                url: project.iosLink),
                                          if (project.repoLink != null &&
                                              project.repoLink!.isNotEmpty)
                                            LinkButton(
                                                text: 'GitHub Repo',
                                                url: project.repoLink!),
                                          if (project.creatorLinkedIn != null &&
                                              project
                                                  .creatorLinkedIn!.isNotEmpty)
                                            LinkButton(
                                                text: 'Creator LinkedIn',
                                                url: project.creatorLinkedIn!),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
