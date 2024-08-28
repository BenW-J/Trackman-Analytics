import 'package:trackman_flutter_app1/const/constant.dart';
import 'package:trackman_flutter_app1/data/side_menu_data.dart';
import 'package:trackman_flutter_app1/services/report_service.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;
  final TextEditingController _urlController = TextEditingController(); // Controller to get user input
  final ReportService _reportService = ReportService(); // Instance of the ReportService
  bool _isLoading = false; // To manage loading state
  String? _statusMessage; // To show status messages

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      setState(() {
        _statusMessage = 'Please enter a valid URL.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = null;
    });

    try {
      await _reportService.fetchAndProcessData(url);
      setState(() {
        _statusMessage = 'Data successfully processed and saved.';
      });
    } catch (e) {
      setState(() {
        _statusMessage = 'Error processing data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
        _urlController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: const Color(0xFF171821),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App title
          const Text(
            'Data Driven Golf',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          // Currently logged-in user
          const Text(
            'Ben Wagner-Jordan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          // List of menu entries
          Expanded(
            child: ListView.builder(
              itemCount: data.menu.length,
              itemBuilder: (context, index) => buildMenuEntry(data, index),
            ),
          ),
          // New Report Entry
          const SizedBox(height: 20),
          const Text(
            'Input New Combine Report',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _urlController,
            decoration: const InputDecoration(
              hintText: 'Paste Report Link Here',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isLoading ? null : _handleSubmit,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              backgroundColor: selectionColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  )
                : const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
          ),
          if (_statusMessage != null) ...[
            const SizedBox(height: 20),
            Text(
              _statusMessage!,
              style: TextStyle(
                fontSize: 14,
                color: _statusMessage!.startsWith('Error') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () => setState(() {
          selectedIndex = index;
        }),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.grey,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
