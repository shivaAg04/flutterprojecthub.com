import '../core/app_enum.dart';

/// A model representing a Flutter project showcased in the repository.
/// This class holds common fields for both company-based and personal projects.
class ProjectDataModel {
  /// The name/title of the project or app.
  final String name;

  /// A brief description of what the project/app does.
  final String description;

  /// Link to the Android version of the app (usually Google Play Store).
  final String androidLink;

  /// Link to the iOS version of the app (usually Apple App Store).
  final String iosLink;

  /// (Optional) Link to the project's source code repository (e.g., GitHub).
  final String? repoLink;

  /// The name of the developer or team who created the project.
  final String creatorName;

  /// (Optional) Link to the company or organization that built the app.
  final String? companyLink;

  /// (Optional) Link to the creator's LinkedIn profile for attribution or networking.
  final String? creatorLinkedIn;

  /// A thumbnail or banner image URL to visually represent the app/project.
  final String? imageUrl;

  /// The industry or category the app/project belongs to.
  final IndustryCategory industry;

  /// Constructor to initialize all the fields of the ProjectDataModel.
  ProjectDataModel({
    required this.name,
    required this.description,
    required this.androidLink,
    required this.iosLink,
    this.repoLink,
    required this.creatorName,
    this.companyLink,
    this.creatorLinkedIn,
    this.imageUrl,
    required this.industry,
  });
}
