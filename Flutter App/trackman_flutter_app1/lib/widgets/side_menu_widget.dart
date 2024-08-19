import 'package:trackman_flutter_app1/const/constant.dart';
import 'package:trackman_flutter_app1/data/side_menu_data.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: const Color(0xFF171821),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //App title
          const Text(
            'Data Driven Golf',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height:20),
          // Currently logged-in user
          const Text(
            'Ben Wagner-Jordan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height:20),
          //List of menu entries
          Expanded(
            child: ListView.builder(
                itemCount: data.menu.length,
                itemBuilder: (context, index) => buildMenuEntry(data, index),
              ),  
          ),
          // New Report Entry
          const SizedBox(height: 20,),
          const Text(
            'Input New Combine Report',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white
            ),
          ),
          const SizedBox(height:20),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Paste Report Link Here',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height:20),
          ElevatedButton(
            onPressed: () {
              // Add your submit logic here
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              backgroundColor: selectionColor, // Corrected property for button background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),


        ],
      )
      
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
            )
          ],
        ),
      ),
    );
  }
}
