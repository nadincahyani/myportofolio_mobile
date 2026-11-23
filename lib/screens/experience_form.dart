import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _role = '';
  String _organization = '';
  String _description = '';
  DateTime? _startDate;
  DateTime? _endDate;
  String? _dateErrorMessage;

  String _formatDate(DateTime? date) {
    if (date == null) return 'Select date';
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day-$month-$year';
  }

  Future<void> _pickStartDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime(now.year, now.month - 1, now.day),
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked;
        _validateDates();
      });
    }
  }

  Future<void> _pickEndDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? _startDate ?? now,
      firstDate: DateTime(1970),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      setState(() {
        _endDate = picked;
        _validateDates();
      });
    }
  }

  bool _validateDates() {
    if (_startDate == null || _endDate == null) {
      setState(() {
        _dateErrorMessage = 'Both start date and end date are required.';
      });
      return false;
    }
    if (_endDate!.isBefore(_startDate!)) {
      setState(() {
        _dateErrorMessage = 'End date cannot be earlier than start date.';
      });
      return false;
    }
    setState(() {
      _dateErrorMessage = null;
    });
    return true;
  }

  void _handleSave() {
    final isFormValid = _formKey.currentState?.validate() ?? false;
    final isDateValid = _validateDates();

    if (!isFormValid || !isDateValid) {
      return;
    }

    _formKey.currentState!.save();

    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Experience Summary'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Role / Position: $_role'),
                const SizedBox(height: 6),
                Text('Organization / Company: $_organization'),
                const SizedBox(height: 6),
                Text('Start Date: ${_formatDate(_startDate)}'),
                const SizedBox(height: 6),
                Text('End Date: ${_formatDate(_endDate)}'),
                const SizedBox(height: 6),
                Text('Description: $_description'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Experience',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Role / Position *',
                  hintText:
                      'e.g., Discrete Mathematics & Logic Teaching Assistant',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) => _role = value,
                onSaved: (value) => _role = value!.trim(),
                validator: (value) {
                  final trimmed = value?.trim() ?? '';
                  if (trimmed.isEmpty) {
                    return 'Role or position cannot be empty or whitespace only.';
                  }
                  if (trimmed.length < 3) {
                    return 'Role or position must be at least 3 characters.';
                  }
                  if (trimmed.length > 100) {
                    return 'Role or position must not exceed 100 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Organization / Company *',
                  hintText: 'e.g., Faculty of Computer Science, Universitas Indonesia',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) => _organization = value,
                onSaved: (value) => _organization = value!.trim(),
                validator: (value) {
                  final trimmed = value?.trim() ?? '';
                  if (trimmed.isEmpty) {
                    return 'Organization or company is required.';
                  }
                  if (trimmed.length < 3) {
                    return 'Organization name must be at least 3 characters.';
                  }
                  if (trimmed.length > 100) {
                    return 'Organization name must not exceed 100 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14.0),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickStartDate,
                      icon: const Icon(Icons.calendar_today),
                      label: Text('Start: ${_formatDate(_startDate)}'),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _pickEndDate,
                      icon: const Icon(Icons.event_available),
                      label: Text('End: ${_formatDate(_endDate)}'),
                    ),
                  ),
                ],
              ),
              if (_dateErrorMessage != null) ...[
                const SizedBox(height: 6.0),
                Text(
                  _dateErrorMessage!,
                  style: TextStyle(color: colorScheme.error, fontSize: 12.5),
                ),
              ],
              const SizedBox(height: 14.0),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description *',
                  hintText:
                      'Describe your key responsibilities or highlights...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) => _description = value,
                onSaved: (value) => _description = value!.trim(),
                validator: (value) {
                  final trimmed = value?.trim() ?? '';
                  if (trimmed.isEmpty) {
                    return 'Description cannot be empty or whitespace only.';
                  }
                  if (trimmed.length < 10) {
                    return 'Description must be at least 10 characters.';
                  }
                  if (trimmed.length > 300) {
                    return 'Description must not exceed 300 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: _handleSave,
                child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
