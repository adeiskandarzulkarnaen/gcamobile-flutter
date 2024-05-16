import 'package:flutter/material.dart';
import 'package:gcamobile/cctv_list.dart';
import 'package:gcamobile/views/about_screen.dart';
import 'package:gcamobile/views/components/cctv_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "GCA",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    " mobile",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              " Aplikasi CCTV Kabupaten Garut",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            style: const ButtonStyle(
              iconSize: MaterialStatePropertyAll(28.0),
              padding: MaterialStatePropertyAll(
                EdgeInsets.only(
                  top: 8,
                  right: 16,
                  bottom: 8,
                  left: 8,
                ),
              ) 
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                )
              );
            },
            icon: const Icon(Icons.info_outline_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cctvList.length,
        itemBuilder: (context, index) {
          return CctvCard(
            cctv: cctvList[index],
          );
        },
      ),
    );
  }
}
