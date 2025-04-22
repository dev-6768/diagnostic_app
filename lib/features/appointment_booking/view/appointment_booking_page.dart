import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/bootstrap.dart';
import 'package:diagnostic_app/features/appointment_booking/controller/appointment_booking_pod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final appointmentFormProvider = StateNotifierProvider<AppointmentFormNotifier, Map<String, String>>(
  (ref) => AppointmentFormNotifier(),
);

class AppointmentFormNotifier extends StateNotifier<Map<String, String>> {
  AppointmentFormNotifier() : super({});

  void updateField(String key, String value) {
    state = {...state, key: value};
  }

  void reset() => state = {};
}

@RoutePage()
class AppointmentBookingPage extends ConsumerStatefulWidget {
  const AppointmentBookingPage({super.key});

  @override
  ConsumerState<AppointmentBookingPage> createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends ConsumerState<AppointmentBookingPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late AnimationController _animController;
  late Animation<double> _opacityAnim;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _opacityAnim = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeIn,
    );
    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final formData = ref.read(appointmentFormProvider);

      await ref.read(userAppointmentBookingProvider(
        UserAppointmentBookingData(
          name: formData["name"] ?? "Unknown", 
          email: formData["email"] ?? "Unknown", 
          phone: formData["phone"] ?? "1111111111", 
          doctorName: formData["doctorName"] ?? "Unknown", 
          date: formData["date"] ?? "1970-01-01",
        )
      ).future);
      talker.debug(formData);
    }
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      _dateController.text = formattedDate;
      ref.read(appointmentFormProvider.notifier).updateField('date', formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade900, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FadeTransition(
          opacity: _opacityAnim,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Appointment Details',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 24),
                        _buildTextField('Name', 'name'),
                        _buildTextField('Email', 'email', keyboardType: TextInputType.emailAddress),
                        _buildTextField('Phone', 'phone', keyboardType: TextInputType.phone),
                        _buildTextField('Doctor Name', 'doctorName'),
                        _buildDateField(),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _submit,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Book', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String key,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.person),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        onSaved: (value) => ref.read(appointmentFormProvider.notifier).updateField(key, value!),
      ),
    );
  }

  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: _dateController,
        readOnly: true,
        onTap: _selectDate,
        decoration: const InputDecoration(
          labelText: 'Date',
          prefixIcon: Icon(Icons.calendar_today),
        ),
        validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}
