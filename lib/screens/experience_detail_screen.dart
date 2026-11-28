import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/experience.dart';

class ExperienceDetailScreen extends StatelessWidget {
  final Experience experience;

  const ExperienceDetailScreen({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final period =
        experience.dateDisplay != null &&
            experience.dateDisplay!.trim().isNotEmpty
        ? experience.dateDisplay!
        : (experience.isOngoing ? 'Ongoing' : 'Completed');

    return Scaffold(
      appBar: AppBar(title: Text(experience.role)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.role,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text('Organization: ${experience.organization}'),
                const SizedBox(height: 6),
                Text('Category: ${experience.category}'),
                const SizedBox(height: 6),
                Text('Period: $period'),
                if (experience.documentationUrl != null &&
                    experience.documentationUrl!.trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text('Documentation: ${experience.documentationUrl}'),
                ],
                const SizedBox(height: 12),
                const Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(experience.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
