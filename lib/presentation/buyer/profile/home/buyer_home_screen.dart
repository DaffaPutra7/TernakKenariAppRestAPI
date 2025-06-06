import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pamlanjut_restapi/core/core/components/spaces.dart';
import 'package:pamlanjut_restapi/presentation/bloc/get_all_burung_tersedia/get_all_burung_tersedia_bloc.dart';
import 'package:pamlanjut_restapi/presentation/auth/login_screen.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
   @override
  void initState() {
    super.initState();
    context.read<GetBurungTersediaBloc>().add(GetAllBurungTersediaEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah anda yakin ingin keluar?'),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<GetBurungTersediaBloc>().add(
            GetAllBurungTersediaEvent(),
          );
        },
        child: Column(
          children: [
            const SpaceHeight(10),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Daftar Burung Tersedia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SpaceHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari burung...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}