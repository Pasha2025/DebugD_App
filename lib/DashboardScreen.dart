import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            _buildDashboardCard(
              context,
              title: "User Admin",
              icon: Icons.admin_panel_settings,
              color: Colors.blue,
              screen: const UserAdminScreen(),
            ),
            _buildDashboardCard(
              context,
              title: "User Interview",
              icon: Icons.video_call,
              color: Colors.green,
              screen: const UserInterviewScreen(),
            ),
            _buildDashboardCard(
              context,
              title: "User Candidate",
              icon: Icons.people,
              color: Colors.orange,
              screen: const UserCandidateScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Widget screen}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // ignore: deprecated_member_use
        color: color.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// User Admin Screen with Calendar
class UserAdminScreen extends StatefulWidget {
  const UserAdminScreen({super.key});

  @override
  State<UserAdminScreen> createState() => _UserAdminScreenState();
}

class _UserAdminScreenState extends State<UserAdminScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Admin")),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: const CalendarStyle(
              todayDecoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _selectedDay == null
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Interview scheduled for $_selectedDay")),
                    );
                  },
            child: const Text("Confirm Interview Date"),
          ),
        ],
      ),
    );
  }
}

// User Interview Screen with Scheduling
class UserInterviewScreen extends StatefulWidget {
  const UserInterviewScreen({super.key});

  @override
  State<UserInterviewScreen> createState() => _UserInterviewScreenState();
}

class _UserInterviewScreenState extends State<UserInterviewScreen> {
  final List<String> interviews = ["Interview 1", "Interview 2", "Interview 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Interview")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: interviews.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(interviews[index]),
              subtitle: const Text("Scheduled interview details"),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

// User Candidate Screen with Candidate List
class UserCandidateScreen extends StatelessWidget {
  const UserCandidateScreen({super.key});

  final List<String> candidates = const [
    "Candidate A",
    "Candidate B",
    "Candidate C"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Candidate")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: candidates.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(candidates[index]),
              subtitle: const Text("Candidate details"),
              trailing: IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
