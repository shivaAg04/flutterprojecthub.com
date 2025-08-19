// import 'package:app/core/app_color.dart';
// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../data/company_app.dart';
// import '../data/personal_app.dart';
// import '../viewModel/home_screen_viewmodel.dart';
// import '../widgets/fading_border_container.dart';
// import '../widgets/link_project.dart';
// import 'app_stats_screen.dart';


// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.primaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.fitbit_outlined, color: AppColor.white),
//           onPressed: () {
//             showFutureFeatureBottomSheet(context);
//           },
//         ),
//         backgroundColor: AppColor.primaryColor,
//         title: Consumer<HomeScreenViewmodel>(
//           builder: (context, provider, _) => Text(
//             provider.showCompany
//                 ? 'Company Apps ${companyProjects.length}'
//                 : 'Personal Apps ${personalProjects.length}',
//             style: TextStyle(color: AppColor.white),
//           ),
//         ),
//         actions: [
//           Consumer<HomeScreenViewmodel>(
//             builder: (context, provider, _) => IconButton(
//               icon: Icon(Icons.swap_horiz, color: AppColor.white),
//               tooltip: 'Switch Projects',
//               onPressed: provider.toggleProjectType,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           /// Search Box
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Consumer<HomeScreenViewmodel>(
//               builder: (context, provider, _) => FadingBorderContainer(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Search projects...',
//                     hintStyle:
//                         TextStyle(color: AppColor.white.withOpacity(0.8)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                   onChanged: provider.updateSearch,
//                 ),
//               ),
//             ),
//           ),

//           /// Project List
//           Expanded(
//             child: Consumer<HomeScreenViewmodel>(
//               builder: (context, provider, _) {
//                 final projects = provider.projects;
//                 return projects.isEmpty
//                     ? Center(
//                         child: Text(
//                           'No projects found',
//                           style: TextStyle(color: AppColor.white),
//                         ),
//                       )
//                     : ListView.builder(
//                         itemCount: projects.length,
//                         itemBuilder: (context, index) {
//                           final project = projects[index];
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 8.0, horizontal: 16),
//                             child: GestureDetector(
//                               onTap: () async {
//                                 // comapny app link
//                                 if (project.companyLink != null &&
//                                     project.companyLink!.isNotEmpty) {
//                                   if (await canLaunchUrl(
//                                       Uri.parse(project.companyLink!))) {
//                                     await launchUrl(
//                                         Uri.parse(project.companyLink!));
//                                   }
//                                 }
//                               },
//                               child: FadingBorderContainer(
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 100,
//                                           height: 100,
//                                           padding: const EdgeInsets.all(16.0),
//                                           child: ClipRRect(
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                             child: Image.network(
//                                               project.imageUrl ??
//                                                   "https://play-lh.googleusercontent.com/r2ZbsIr5sQ7Wtl1T6eevyWj4KS7QbezF7JYB9gxQnLWbf0K4kU7qaLNcJLLUh0WG-3pK=w480-h960-rw",
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 8.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     project.name,
//                                                     style: TextStyle(
//                                                       fontSize: 16,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: AppColor.white,
//                                                     ),
//                                                   ),
//                                                   Container(
//                                                     margin: const EdgeInsets
//                                                         .symmetric(
//                                                         horizontal: 8),
//                                                     height: 4,
//                                                     width: 4,
//                                                     decoration: BoxDecoration(
//                                                       color: AppColor.white,
//                                                       shape: BoxShape.circle,
//                                                     ),
//                                                   ),
//                                                   // grey circle icon

//                                                   Text(
//                                                     project.industry.name,
//                                                     style: TextStyle(
//                                                       color: AppColor.white,
//                                                       fontSize: 12,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               SizedBox(
//                                                 width: 200,
//                                                 child: Text(
//                                                   project.description,
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: AppColor.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SingleChildScrollView(
//                                       scrollDirection: Axis.horizontal,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         children: [
//                                           if (project.androidLink.isNotEmpty)
//                                             LinkButton(
//                                                 text: 'Android App',
//                                                 url: project.androidLink),
//                                           if (project.iosLink.isNotEmpty)
//                                             LinkButton(
//                                                 text: 'iOS App',
//                                                 url: project.iosLink),
//                                           if (project.repoLink != null &&
//                                               project.repoLink!.isNotEmpty)
//                                             LinkButton(
//                                                 text: 'GitHub Repo',
//                                                 url: project.repoLink!),
//                                           if (project.creatorLinkedIn != null &&
//                                               project
//                                                   .creatorLinkedIn!.isNotEmpty)
//                                             LinkButton(
//                                                 text: 'Creator LinkedIn',
//                                                 url: project.creatorLinkedIn!),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:app/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/company_app.dart';
import '../data/personal_app.dart';
import '../viewModel/home_screen_viewmodel.dart';
import '../widgets/fading_border_container.dart';
import '../widgets/link_project.dart';
import 'app_stats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 1200;
    final isMediumScreen = screenWidth > 768;
    
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: _buildAppBar(context, isMediumScreen),
      body: _buildBody(context, isWideScreen, isMediumScreen),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isMediumScreen) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.fitbit_outlined, color: AppColor.white),
        onPressed: () {
          showFutureFeatureBottomSheet(context);
        },
        tooltip: 'Features',
      ),
      backgroundColor: AppColor.primaryColor,
      title: Consumer<HomeScreenViewmodel>(
        builder: (context, provider, _) => Text(
          provider.showCompany
              ? 'Company Apps ${companyProjects.length}'
              : 'Personal Apps ${personalProjects.length}',
          style: TextStyle(
            color: AppColor.white,
            fontSize: isMediumScreen ? 20 : 16,
          ),
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
      elevation: 0,
    );
  }

  Widget _buildBody(BuildContext context, bool isWideScreen, bool isMediumScreen) {
    return Column(
      children: [
        /// Search Box
        Container(
          width: isWideScreen ? 600 : double.infinity,
          margin: EdgeInsets.all(isMediumScreen ? 24.0 : 16.0),
          child: Consumer<HomeScreenViewmodel>(
            builder: (context, provider, _) => FadingBorderContainer(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search projects...',
                  hintStyle: TextStyle(color: AppColor.white.withOpacity(0.8)),
                  prefixIcon: Icon(
                    Icons.search, 
                    color: AppColor.white.withOpacity(0.8)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: isMediumScreen ? 16 : 12,
                    horizontal: 16,
                  ),
                ),
                style: TextStyle(color: AppColor.white),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: AppColor.white.withOpacity(0.5),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No projects found',
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  : _buildProjectGrid(projects, isWideScreen, isMediumScreen);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProjectGrid(List<dynamic> projects, bool isWideScreen, bool isMediumScreen) {
    // For web, use a responsive grid layout
    if (kIsWeb && isWideScreen) {
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return _buildProjectCard(projects[index], isMediumScreen, isGrid: true);
        },
      );
    }
    
    // For mobile and medium screens, use list view
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: isMediumScreen ? 24 : 16),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final project = projects[index];
        return Padding(
          padding: EdgeInsets.only(bottom: isMediumScreen ? 20 : 16),
          child: _buildProjectCard(project, isMediumScreen),
        );
      },
    );
  }

  Widget _buildProjectCard(dynamic project, bool isMediumScreen, {bool isGrid = false}) {
    return GestureDetector(
      onTap: () async {
        // Company app link
        if (project.companyLink != null && project.companyLink!.isNotEmpty) {
          final uri = Uri.parse(project.companyLink!);
          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
            );
          }
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: FadingBorderContainer(
            child: Padding(
              padding: EdgeInsets.all(isMediumScreen ? 20 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // App Icon
                      Container(
                        width: isGrid ? 80 : (isMediumScreen ? 100 : 80),
                        height: isGrid ? 80 : (isMediumScreen ? 100 : 80),
                        padding: EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            project.imageUrl ??
                                "https://play-lh.googleusercontent.com/r2ZbsIr5sQ7Wtl1T6eevyWj4KS7QbezF7JYB9gxQnLWbf0K4kU7qaLNcJLLUh0WG-3pK=w480-h960-rw",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColor.white.withOpacity(0.1),
                                child: Icon(
                                  Icons.apps,
                                  color: AppColor.white.withOpacity(0.5),
                                  size: 32,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      
                      // Project Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    project.name,
                                    style: TextStyle(
                                      fontSize: isMediumScreen ? 18 : 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  height: 4,
                                  width: 4,
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Text(
                                  project.industry.name,
                                  style: TextStyle(
                                    color: AppColor.white.withOpacity(0.8),
                                    fontSize: isMediumScreen ? 14 : 12,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              project.description,
                              maxLines: isGrid ? 2 : 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: isMediumScreen ? 14 : 12,
                                fontWeight: FontWeight.w500,
                                color: AppColor.white.withOpacity(0.9),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 16),
                  
                  // Action Buttons
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (project.androidLink.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: LinkButton(
                              text: 'Android App',
                              url: project.androidLink,
                            ),
                          ),
                        if (project.iosLink.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: LinkButton(
                              text: 'iOS App',
                              url: project.iosLink,
                            ),
                          ),
                        if (project.repoLink != null && project.repoLink!.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: LinkButton(
                              text: 'GitHub',
                              url: project.repoLink!,
                            ),
                          ),
                        if (project.creatorLinkedIn != null && project.creatorLinkedIn!.isNotEmpty)
                          LinkButton(
                            text: 'LinkedIn',
                            url: project.creatorLinkedIn!,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Enhanced LinkButton widget for web
class LinkButton extends StatefulWidget {
  final String text;
  final String url;

  const LinkButton({
    Key? key,
    required this.text,
    required this.url,
  }) : super(key: key);

  @override
  State<LinkButton> createState() => _LinkButtonState();
}

class _LinkButtonState extends State<LinkButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(
              uri,
              mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
            );
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered 
                ? AppColor.white.withOpacity(0.2)
                : AppColor.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColor.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: AppColor.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
