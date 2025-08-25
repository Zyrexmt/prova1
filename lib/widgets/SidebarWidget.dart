import 'package:flutter/material.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  int selectedIndex = 0;
  
  final List<Map<String, dynamic>> menuItems = [
    {"label": "Meu Perfil", "route": '/profile'},
    {"label": "Ranking", "route": '/welcome'},
    {"label": "Matérias", "route": '/matter'},
  ];

  @override
  void initState () {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedIndex();
    });
  }

  void _updateSelectedIndex() {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final index = menuItems.indexWhere((item) => item["route"] == currentRoute);
    if(index != -1) {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
            Icon(Icons.flutter_dash, size: 100, color: Colors.blue,),

            Padding(padding: EdgeInsets.symmetric(vertical: 50)),            
            Column(
              children: [
                ...List.generate(menuItems.length, (index) {
              final item = menuItems[index];
              final isSelected = selectedIndex == index;

              return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Navigator.of(context).pushReplacementNamed(item["route"]);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      color: isSelected ? Colors.black : Colors.transparent,
                    ),
                    child: Text(item["label"], 
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ), textAlign: TextAlign.center,
                    ),
                  ),
                );
              }),
            ],
          ),

          Spacer(),


            TextButton(onPressed: () {
              Navigator.of(context).pushReplacementNamed('/welcome');
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
            ),
            child:  SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 30, color: Colors.white,),
                    Text('Log out')
                  ],
              ),
            ))  
          ]),
        ),
      ),
    );
  }
}


