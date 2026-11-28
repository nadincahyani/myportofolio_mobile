import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _role = '';
  String _organization = '';
  String _category = 'organization';
  String _dateDisplay = '';
  String _documentationUrl = '';
  bool _isOngoing = true;
  String _description = '';
  bool _isSubmitting = false;

  static const List<String> _categories = [
    'organization',
    'committee',
    'teaching-assistant',
    'volunteer',
  ];

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final messenger = ScaffoldMessenger.of(context);
    final apiClient = context.read<ApiClient>();
    final authState = context.read<AuthState>();

    final allowed = await ensureLoggedIn(context);
    if (!allowed || !mounted) return;

    final token = authState.token;
    if (token == null || token.isEmpty) {
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Authentication token not found.')),
        );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final newExperience = Experience(
      role: _role.trim(),
      organization: _organization.trim(),
      category: _category,
      dateDisplay: _dateDisplay.trim().isEmpty ? null : _dateDisplay.trim(),
      documentationUrl: _documentationUrl.trim().isEmpty
          ? null
          : _documentationUrl.trim(),
      isOngoing: _isOngoing,
      description: _description.trim(),
    );

    try {
      final created = await apiClient.createExperience(
        newExperience,
        token: token,
      );
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('Experience added!'),
          content: Text('${created.role} at ${created.organization} saved.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );

      if (!mounted) return;
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await authState.logout();
        if (!mounted) return;
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Session expired (401). Please log in again.'),
            ),
          );
        await ensureLoggedIn(context);
      } else {
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(
                'Failed to create experience (${e.statusCode}): ${e.message}',
              ),
            ),
          );
      }
    } catch (e) {
      if (!mounted) return;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Unexpected error: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Experience')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Role *',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _role = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Role cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Organization *',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _organization = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Organization cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories
                    .map(
                      (c) => DropdownMenuItem<String>(value: c, child: Text(c)),
                    )
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _category = val);
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Date Display (e.g. May 2026 - Present)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _dateDisplay = v,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Documentation URL (Optional)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _documentationUrl = v,
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('Ongoing'),
                value: _isOngoing,
                onChanged: (val) => setState(() => _isOngoing = val),
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description *',
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => _description = v,
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Description cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
