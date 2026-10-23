import 'package:flutter/material.dart';

import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

// Activity 9: each state is triggered by a real UI action.
enum ReportUiState { idle, loading, success, empty, error }

class ReportFormScreen extends StatefulWidget {
  const ReportFormScreen({super.key});

  @override
  State<ReportFormScreen> createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();

  // Browser-session-only demo data; nothing is saved to a real database.
  final List<_CampusReport> _reports = [];
  ReportUiState _uiState = ReportUiState.idle;
  String? _selectedCategory;
  bool _simulateFailure = false;
  bool _showReports = false;

  bool get _isLoading => _uiState == ReportUiState.loading;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _showReportList() {
    if (_isLoading) return;
    setState(() {
      _showReports = true;
      _uiState = _reports.isEmpty
          ? ReportUiState.empty
          : ReportUiState.idle;
    });
  }

  void _openForm({bool clearFields = false}) {
    if (_isLoading) return;
    if (clearFields) {
      _titleController.clear();
      _descriptionController.clear();
      _locationController.clear();
      _selectedCategory = null;
    }
    setState(() {
      _showReports = false;
      _simulateFailure = false;
      _uiState = ReportUiState.idle;
    });
  }

  Future<void> _submitReport() async {
    if (_isLoading || !_formKey.currentState!.validate()) return;

    // Snapshot values before the asynchronous operation starts.
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final location = _locationController.text.trim();
    final category = _selectedCategory!;
    final shouldFail = _simulateFailure;

    setState(() => _uiState = ReportUiState.loading);

    try {
      // A temporary simulated API request (no REST API or database yet).
      await Future<void>.delayed(const Duration(seconds: 5));
      if (shouldFail) throw StateError('Simulated network failure');
      if (!mounted) return;

      setState(() {
        _reports.insert(
          0,
          _CampusReport(
            title: title,
            category: category,
            description: description,
            location: location.isEmpty ? 'Not specified' : location,
          ),
        );
        _uiState = ReportUiState.success;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _uiState = ReportUiState.error);
    }
  }

  Future<void> _retryReport() async {
    if (_isLoading) return;
    // Turn off the deliberate failure so Retry demonstrates recovery.
    setState(() => _simulateFailure = false);
    await _submitReport();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CampusHub • Campus Reports'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Campus Issue Reports',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF16324F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Report a campus concern or check reports made during this demo session.',
                    style: TextStyle(color: Color(0xFF657386), height: 1.5),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: [
                      OutlinedButton.icon(
                        onPressed: _isLoading ? null : () => _openForm(),
                        icon: const Icon(Icons.edit_note_rounded),
                        label: const Text('Report Form'),
                      ),
                      OutlinedButton.icon(
                        onPressed: _isLoading ? null : _showReportList,
                        icon: const Icon(Icons.list_alt_rounded),
                        label: Text('View Reports (${_reports.length})'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                      side: const BorderSide(color: Color(0xFFE7ECF2)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(26),
                      child: _showReports ? _buildReportList() : _buildForm(),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Activity 9 demo: requests and failures are simulated. '
                    'Reports are stored in memory only and disappear when the app restarts.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Color(0xFF657386)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Submit a new report',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Fields marked with * are required.',
            style: TextStyle(color: Color(0xFF657386)),
          ),
          const SizedBox(height: 22),
          AppTextField(
            controller: _titleController,
            label: 'Report title *',
            hint: 'e.g., Broken classroom projector',
            icon: Icons.title_rounded,
            enabled: !_isLoading,
            validator: (value) {
              final text = value?.trim() ?? '';
              if (text.isEmpty) return 'Please enter a report title.';
              if (text.length < 5) return 'Use at least 5 characters.';
              return null;
            },
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<String>(
            key: ValueKey(_selectedCategory),
            value: _selectedCategory,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Category *',
              prefixIcon: Icon(Icons.category_outlined),
            ),
            hint: const Text('Choose a concern category'),
            items: const [
              DropdownMenuItem(value: 'IT Support', child: Text('IT Support')),
              DropdownMenuItem(value: 'Facilities', child: Text('Facilities')),
              DropdownMenuItem(value: 'Safety', child: Text('Safety')),
              DropdownMenuItem(value: 'Other', child: Text('Other')),
            ],
            onChanged: _isLoading
                ? null
                : (value) => setState(() => _selectedCategory = value),
            validator: (value) => value == null
                ? 'Please select a report category.'
                : null,
          ),
          const SizedBox(height: 18),
          AppTextField(
            controller: _descriptionController,
            label: 'Description *',
            hint: 'Explain what happened and what needs attention.',
            icon: Icons.description_outlined,
            maxLines: 4,
            enabled: !_isLoading,
            validator: (value) {
              final text = value?.trim() ?? '';
              if (text.isEmpty) return 'Please describe the issue.';
              if (text.length < 15) {
                return 'Use at least 15 characters in the description.';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          AppTextField(
            controller: _locationController,
            label: 'Campus location (optional)',
            hint: 'e.g., Computer Lab 2',
            icon: Icons.place_outlined,
            enabled: !_isLoading,
          ),
          const SizedBox(height: 14),
          SwitchListTile.adaptive(
            contentPadding: EdgeInsets.zero,
            title: const Text('Simulate an error'),
            subtitle: const Text('Enable to test Error and Retry states.'),
            value: _simulateFailure,
            onChanged: _isLoading
                ? null
                : (value) => setState(() => _simulateFailure = value),
          ),
          const SizedBox(height: 14),
          AppButton(
            label: _isLoading ? 'Submitting...' : 'Submit Report',
            icon: Icons.send_rounded,
            onPressed: _isLoading ? null : _submitReport,
            expanded: true,
          ),
          const SizedBox(height: 18),
          if (_uiState == ReportUiState.loading)
            const _FeedbackPanel(
              icon: Icons.hourglass_top_rounded,
              title: 'LOADING: Submitting report...',
              message: 'Simulated request in progress. Please do not submit twice.',
              color: Color(0xFF1A6AB0),
              showProgress: true,
            ),
          if (_uiState == ReportUiState.success) ...[
            const _FeedbackPanel(
              icon: Icons.check_circle_outline_rounded,
              title: 'SUCCESS: Report submitted',
              message: 'Your report was added to this demo session only. '
                  'No database record was created.',
              color: Color(0xFF087F78),
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'View submitted reports',
              icon: Icons.list_alt_rounded,
              onPressed: _showReportList,
              expanded: true,
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => _openForm(clearFields: true),
              child: const Text('Create another report'),
            ),
          ],
          if (_uiState == ReportUiState.error) ...[
            const _FeedbackPanel(
              icon: Icons.error_outline_rounded,
              title: 'ERROR: Submission failed',
              message: 'This is a deliberately simulated request failure. '
                  'Your report was not added. Retry to send it successfully.',
              color: Color(0xFFC2413B),
            ),
            const SizedBox(height: 12),
            AppButton(
              label: 'Retry submission',
              icon: Icons.refresh_rounded,
              onPressed: _retryReport,
              expanded: true,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildReportList() {
    if (_reports.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _FeedbackPanel(
            icon: Icons.inbox_outlined,
            title: 'EMPTY: No reports yet',
            message: 'No report records are available in this browser session. '
                'This is an empty result, not a request failure.',
            color: Color(0xFF576B7B),
          ),
          const SizedBox(height: 18),
          AppButton(
            label: 'Create your first report',
            icon: Icons.add_rounded,
            onPressed: () => _openForm(clearFields: true),
            expanded: true,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Session reports (${_reports.length})',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Demo entries only — not stored on a server.',
          style: TextStyle(color: Color(0xFF657386)),
        ),
        const SizedBox(height: 16),
        for (final report in _reports) ...[
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F7FA),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFE7ECF2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(report.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text('${report.category} • ${report.location}',
                    style: const TextStyle(color: Color(0xFF087F78))),
                const SizedBox(height: 8),
                Text(report.description),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
        AppButton(
          label: 'Create another report',
          icon: Icons.add_rounded,
          onPressed: () => _openForm(clearFields: true),
          expanded: true,
        ),
      ],
    );
  }
}

class _CampusReport {
  const _CampusReport({
    required this.title,
    required this.category,
    required this.description,
    required this.location,
  });

  final String title;
  final String category;
  final String description;
  final String location;
}

class _FeedbackPanel extends StatelessWidget {
  const _FeedbackPanel({
    required this.icon,
    required this.title,
    required this.message,
    required this.color,
    this.showProgress = false,
  });

  final IconData icon;
  final String title;
  final String message;
  final Color color;
  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showProgress)
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: color,
              ),
            )
          else
            Icon(icon, color: color, size: 26),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: color, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(message),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
