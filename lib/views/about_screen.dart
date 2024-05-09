import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about app"),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24,),
              DevCard(name: 'Ade Iskandar Zulkarnaen', role: 'Fullstack developer', assetImage: 'assets/images/ade.jpeg',),
              SizedBox(height: 24,),
              DevCard(name: 'Abdul Latif', role: 'Ui/Ux Design || Flutter Enthusiast', assetImage: 'assets/images/abdul.jpeg',),
              SizedBox(height: 24,),
              DevCard(name: 'Ulfah Masripah', role: 'Flutter Entusiast', assetImage: 'assets/images/ulfah.jpeg',),
              SizedBox(height: 24,),
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