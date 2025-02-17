import 'package:flutter/material.dart';
import 'package:untitled/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:untitled/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:untitled/DesignSystem/shared/styles.dart';
import 'package:untitled/Scenes/profilePage/profile_router.dart';

class ProfilePage extends StatelessWidget {
  String email;

  ProfilePage({super.key, required this.email});

  final List functions = [
    'Edit Name',
    'Shipping Info',
    'Notification',
    'Terms & Conditions',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
        titleSpacing: 30,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'AvatarProfile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        email,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'amanda@gmail.com',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            ...functions
                .map((name) => Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(name, style: paragraph1Regular),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ],
                    ))
                .toList(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  ProfileRouter.goToLoginPage(context);
                },
                child: Text(
                  'Logout',
                  style: paragraph1Regular.copyWith(
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
          currentIndex: 3,
          viewModel: BottomTabBarViewModel(
            bottomTabs: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Messages",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.label),
                label: "Label",
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              )
            ],
          )),
    );
  }
}
