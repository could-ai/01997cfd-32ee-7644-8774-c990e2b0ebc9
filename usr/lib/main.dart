import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HUT RI ke-77 Ngasem Tengah',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const CompetitionHomePage(),
    );
  }
}

class CompetitionHomePage extends StatelessWidget {
  const CompetitionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lomba Kemerdekaan HUT RI ke-77'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildEventInfoCard(context),
          const SizedBox(height: 16),
          Text(
            'Daftar Perlombaan & Pemenang',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          _buildCompetitionCard(
            context: context,
            competition: 'Lomba Makan Kerupuk',
            participants: 'Ibu-ibu & Anak-anak',
            winner: 'Ibu Yatmi',
            icon: Icons.fastfood,
          ),
          _buildCompetitionCard(
            context: context,
            competition: 'Estafet Air',
            participants: 'Anak-anak (Bima, Dila, Ivana, Citra, Reyhan, Revan, dan Rifki)',
            winner: 'Kelompok 1 (Citra)',
            icon: Icons.opacity,
          ),
          _buildCompetitionCard(
            context: context,
            competition: 'Balap Sarung',
            participants: 'Ibu-ibu',
            winner: 'Barisan Pertama',
            icon: Icons.group_work,
          ),
          const SizedBox(height: 16),
          _buildPrizeInfoCard(context),
          const SizedBox(height: 24),
          const Text(
            'Diselenggarakan oleh: Lurah, RT/RW, dan Karang Taruna Ngasem Tengah',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _buildEventInfoCard(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Perayaan HUT RI ke-77',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'Dusun Ngasem Tengah, Kabupaten Wonogiri',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Divider(height: 20, thickness: 1),
            _buildInfoRow(Icons.calendar_today, 'Minggu, 14 Agustus 2022'),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.access_time, 'Pukul 09.00 WIB - Selesai'),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, 'Halaman Rumah Pak Lurah'),
          ],
        ),
      ),
    );
  }

  Widget _buildCompetitionCard({
    required BuildContext context,
    required String competition,
    required String participants,
    required String winner,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(icon, color: Colors.red, size: 40),
              title: Text(
                competition,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text('Peserta: $participants'),
            ),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.emoji_events, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Pemenang: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    winner,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrizeInfoCard(BuildContext context) {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informasi Pengambilan Hadiah',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.blue[800]),
            ),
            const Divider(height: 20, thickness: 1),
            _buildInfoRow(Icons.card_giftcard, 'Hadiah akan diberikan pada:'),
            const Padding(
              padding: EdgeInsets.only(left: 32.0, top: 4.0),
              child: Text(
                'Rabu, 17 Agustus 2022',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow(Icons.location_on, 'Di Halaman Bapak Hartanto'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.black54),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
      ],
    );
  }
}
