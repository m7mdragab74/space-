import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final Color color;
  final List<Widget> pages;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    required this.color,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context,
            0,
            Icons.home_rounded,
            'Home',
          ),
          const Spacer(flex: 1),
          _buildBottomNavItem(
            context,
            1,
            Icons.search,
            'Search',
          ),
          const Spacer(flex: 1),
          _buildBottomNavItem(
            context,
            2,
            Icons.favorite_border,
            'Favorite',
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(
      BuildContext context, int index, IconData icon, String label) {
    return InkWell(
      onTap: () {
        onItemSelected(index);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pages[index]),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color:
                selectedIndex == index ? Colors.yellow.shade700 : Colors.black,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: selectedIndex == index
                  ? Colors.yellow.shade700
                  : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
