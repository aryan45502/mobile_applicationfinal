import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:wedding_planner/features/home/domain/entity/court_entity.dart';
import 'package:wedding_planner/features/home/presentation/view_model/booking_cubit.dart';
import 'package:wedding_planner/features/home/presentation/view_model/booking_state.dart';

class BookingView extends StatefulWidget {
  final CourtEntity court;
  final String userId;

  const BookingView({super.key, required this.court, required this.userId});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  DateTime? selectedDate;
  String? selectedTimeSlot;

  final List<String> timeSlots = [
    '6:00 - 7:00am',
    '7:00 - 8:00am',
    '8:00 - 9:00am',
    '9:00 - 10:00am',
    '10:00 - 11:00am',
    '11:00 - 12:00pm',
    '12:00 - 1:00pm',
    '1:00 - 2:00pm',
    '2:00 - 3:00pm',
    '3:00 - 4:00pm',
    '4:00 - 5:00pm',
    '5:00 - 6:00pm',
    '6:00 - 7:00pm',
    '7:00 - 8:00pm',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book ${widget.court.name}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF800000), // Maroon color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Picker Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading:
                    const Icon(Icons.calendar_today, color: Color(0xFF800000)),
                title: Text(
                  selectedDate == null
                      ? 'Select Date'
                      : DateFormat('yyyy-MM-dd').format(selectedDate!),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_drop_down, color: Color(0xFF800000)),
                onTap: _pickDate,
              ),
            ),
            const SizedBox(height: 20),

            // Time Slot Dropdown Section
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<String>(
                  value: selectedTimeSlot,
                  hint: const Text(
                    'Select Time Slot',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  isExpanded: true,
                  underline: const SizedBox(), // Remove default underline
                  icon: const Icon(Icons.arrow_drop_down,
                      color: Color(0xFF800000)),
                  items: timeSlots.map((slot) {
                    return DropdownMenuItem(
                      value: slot,
                      child: Text(
                        slot,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) =>
                      setState(() => selectedTimeSlot = value),
                ),
              ),
            ),
            const Spacer(),

            // Confirm Booking Button
            BlocConsumer<BookingCubit, BookingState>(
              listener: (context, state) {
                if (state is BookingError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is BookingLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Booking Successful!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _confirmBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF800000), // Maroon color
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: state is BookingLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Confirm Booking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (date != null) setState(() => selectedDate = date);
  }

  void _confirmBooking() {
    if (selectedDate == null || selectedTimeSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select date and time slot'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<BookingCubit>().addBooking({
      'courtName': widget.court.name,
      'dateTime': selectedDate!.toIso8601String(),
      'timeSlot': selectedTimeSlot,
      'userId': widget.userId,
    });
  }
}
