import 'package:flutter/material.dart';

void main() {
  runApp(const LeaderBoardScreen());
}

class LeaderBoardScreen extends StatelessWidget {
  const LeaderBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ranking',
      home: RankingScreen(),
    );
  }
}

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 380,
          padding: const EdgeInsets.all(16), // Add padding to the container
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ranking',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rubik',
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 10,
                width: 350,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -8,
                      left: 8,
                      child: Transform.rotate(
                        angle: 45 * 3.14159265 / 180,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -8,
                      right: 8,
                      child: Transform.rotate(
                        angle: 45 * 3.14159265 / 180,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              DataTable(
                columns: const [
                  DataColumn(
                    label: Text(
                      'Number',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Points',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      const DataCell(
                        Center(
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      const DataCell(
                        Center(
                          child: Text(
                            'Ram Ji',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            const Text(
                              '43',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/depositphotos_40481179-stock-photo-medal.jpg',
                              height: 20.0,
                              width: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'Aman Ji',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            '40',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            '3',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'Patil Ji',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            '37',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            'Rathod Ji',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            '35',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
