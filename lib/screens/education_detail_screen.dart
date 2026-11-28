import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/education.dart';

class EducationDetailScreen extends StatelessWidget {
  final Education education;

  const EducationDetailScreen({super.key, required this.education});

  @override
  Widget build(BuildContext context) {
    final period =
        education.endYear != null && education.endYear!.trim().isNotEmpty
        ? '${education.startYear} - ${education.endYear}'
        : '${education.startYear} - Present';

    return Scaffold(
      appBar: AppBar(title: Text(education.institution)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  education.institution,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Degree: ${education.degree}'),
                const SizedBox(height: 6),
                Text('Field of Study: ${education.fieldOfStudy}'),
                const SizedBox(height: 6),
                Text('Period: $period'),
                const SizedBox(height: 12),
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  education.description.trim().isNotEmpty
                      ? education.description
                      : 'No description provided.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
