import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/education_list_screen.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/experience_list_screen.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menggunakan warna sekunder dari skema tema aplikasi.
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        // Card.
        onTap: () async {
          if (item.name == 'Education' ||
              item.name == 'Edukasi' ||
              item.name == 'View Education') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EducationListScreen(),
              ),
            );
            return;
          }

          if (item.name == 'View Projects' || item.name == 'Lihat Proyek') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectListScreen(),
              ),
            );
            return;
          }

          if (item.name == 'Add Project' || item.name == 'Tambah Proyek') {
            final allowed = await ensureLoggedIn(context);
            if (!allowed || !context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProjectFormPage()),
            );
            return;
          }

          if (item.name == 'View Experiences' ||
              item.name == 'Lihat Pengalaman') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceListScreen(),
              ),
            );
            return;
          }

          if (item.name == 'Add Experience' ||
              item.name == 'Tambah Pengalaman') {
            final allowed = await ensureLoggedIn(context);
            if (!allowed || !context.mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExperienceFormPage(),
              ),
            );
            return;
          }

          if (item.name == 'Logout') {
            final authState = context.read<AuthState>();
            if (!authState.isLoggedIn) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text("You are not logged in.")),
                );
              return;
            }
            await authState.logout();
            if (!context.mounted) return;

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text("Logged out successfully!")),
              );
            return;
          }

          // Menampilkan SnackBar dengan pesan interaktif.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed the ${item.name} button!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
