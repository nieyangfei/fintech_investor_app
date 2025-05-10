import 'package:fintech_investor_app/widgets/activity_card.dart';
import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  bool _showFilters = false;
  final List<String> _filterOptions = [
    'Pending',
    'Orders',
    'Transfers',
    'Deposits',
  ];
  String? _selectedFilter;
  final List<Activity> _allActivities = Activities.activities;

  List<Activity> get _filteredActivities {
    if (_selectedFilter == null) return _allActivities;
    return _allActivities.where((t) => t.type == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => setState(() => _showFilters = !_showFilters),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showFilters)
            SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children:
                    _filterOptions.map((option) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(
                          label: Text(option),
                          selected: _selectedFilter == option,
                          onSelected: (selected) {
                            setState(() {
                              _selectedFilter = selected ? option : null;
                            });
                          },
                        ),
                      );
                    }).toList(),
              ),
            ),
          const Divider(height: 1),
          Expanded(
            child:
                _filteredActivities.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                      itemCount: _filteredActivities.length,
                      itemBuilder: (context, index) {
                        final activity = _filteredActivities[index];
                        return ActivityCard(activity: activity);
                      },
                    ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'This list only shows activity from April 1, 2023 onwards.',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: const Text('No Older History!'),
                            content: Text(
                              'There is no older activity available to display.\n\nAll your activity is already shown above.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pop(); // Close the popup
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                    );
                  },
                  child: const Text('View older activity →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            _selectedFilter != null
                ? 'No ${_selectedFilter!.toLowerCase()} transactions found'
                : 'No transactions available',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            _selectedFilter != null
                ? 'Try adjusting your timeframe or criteria'
                : 'Please check back later',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
