import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? name, initials;
  const CustomAppbar({super.key, this.name, this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
      ),
      height: preferredSize.height,
      child: Column(
        children: [
          Container(
            color: Colors.green,
            height: 10,
          ),
          Divider(
            color: Colors.blue,
            thickness: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.menu),
              Text(
                "Good Morning, ${name ?? ""} ${initials ?? ""}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: 4),
                  Icon(Icons.logout)
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
