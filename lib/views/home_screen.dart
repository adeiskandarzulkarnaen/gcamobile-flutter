
import 'package:flutter/material.dart';
import 'package:gcamobile/cctv_list.dart';
import 'package:gcamobile/utils.dart';
import 'package:gcamobile/views/about_screen.dart';
import 'package:gcamobile/views/components/cctv_card.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setDeviceOrientation(MediaQuery.of(context).orientation);
        },
        tooltip: 'Rotate Screen',
        child: const Icon(Icons.sync),
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
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
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => const AboutScreen(),)
                          );
                        }, 
                        icon: const Icon(Icons.info_outline_rounded),
                      )
                    ],
                  ),
                  const Text(
                    " Aplikasi CCTV Kabupaten Garut",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: cctvList.length,
              itemBuilder: (context, index) {
                return CctvCard(
                  cctv: cctvList[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
