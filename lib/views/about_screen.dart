import 'package:flutter/material.dart';
import 'package:gcamobile/utils.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about app"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setDeviceOrientation(MediaQuery.of(context).orientation);
        },
        tooltip: 'Rotate Screen',
        child: const Icon(Icons.sync),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24,),
              const DevCard(name: 'Ade Iskandar Zulkarnaen', role: 'Fullstack Developer', assetImage: 'assets/images/ade.jpeg',),
              const SizedBox(height: 24,),
              const DevCard(name: 'Abdul Latif', role: 'Ui/Ux Design || Flutter Enthusiast', assetImage: 'assets/images/abdul.jpeg',),
              const SizedBox(height: 24,),
              const DevCard(name: 'Ulfah Masripah', role: 'Flutter Enthusiast', assetImage: 'assets/images/ulfah.jpeg',),
              const SizedBox(height: 24,),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.transparent,
                child: const Column(
                  children: [
                    Text(
                      "Garut CCTV Application",
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      "© 2024 itg.ac.id",
                      style: TextStyle(
                        // color: Colors.grey,
                        fontSize: 12.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DevCard extends StatelessWidget {
  final String name;
  final String role;
  final String assetImage;

  const DevCard({
    super.key,
    required this.name,
    required this.role,
    required this.assetImage
  });

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) { 
        double scala = deviceOrientation == Orientation.landscape ? 4.2 : 1.2;
        double avatarWidth = constraints.maxWidth / scala;

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: avatarWidth,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: CircleAvatar(
                  radius: avatarWidth,
                  backgroundColor: Colors.red,
                  child: CircleAvatar(
                    radius: avatarWidth * 0.49,
                    backgroundImage: AssetImage(assetImage),
                  ),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24
              ),
            ),
            Text(
              role,
              style: const TextStyle(
                fontSize: 14
              ),
            ),
          ],
        );
      },
    );
  }
}