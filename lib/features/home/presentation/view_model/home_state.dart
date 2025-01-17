import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wedplan/features/Saved/presentation/view/saved_view.dart';
import 'package:wedplan/features/booking/presentation/view/booking_view.dart';
import 'package:wedplan/features/message/presentation/view/presentation_view.dart';
import 'package:wedplan/features/profile/presentation/view/profile_view.dart';
import 'package:wedplan/features/home/presentation/view/home_page.dart';

class HomeState extends Equatable {
  final int selectedIndex;
  final List<Widget> views;

  const HomeState({
    required this.selectedIndex,
    required this.views,
  });

  // Initial state
  static HomeState initial() {
    return const HomeState(
      selectedIndex: 0,
      views: [
        HomeContent(),
        BookingView(),
        SavedView(),
        MessageView(),
        ProfileView(),

        

      ],
    );
  }

  HomeState copyWith({
    int? selectedIndex,
    List<Widget>? views,
  }) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      views: views ?? this.views,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, views];
}