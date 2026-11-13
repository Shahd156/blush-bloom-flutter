import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const NavigationApp());
}

class AppColors {
  static const navy = Color(0xFF182B49);
  static const blue = Color(0xFF3D7BF4);
  static const mint = Color(0xFFE7F7F2);
  static const text = Color(0xFF243447);
  static const muted = Color(0xFF6B7A90);
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BrightPath',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blue),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'BrightPath',
      pageTitle: 'Welcome home',
      pageSubtitle: 'A simple space for ideas, people, and possibilities.',
      currentIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: SvgPicture.asset(
              'assets/home_illustration.svg',
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Home Page',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.navy),
          ),
          const SizedBox(height: 10),
          const Text(
            'Explore our little corner of the world and discover what makes BrightPath special.',
            style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 26),
          PrimaryButton(
            label: 'Go to About',
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage())),
          ),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'About us',
      pageTitle: 'Our story',
      pageSubtitle: 'Built with curiosity, care, and a clear direction.',
      currentIndex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageIcon(icon: Icons.auto_awesome_rounded, color: AppColors.blue),
          const SizedBox(height: 24),
          const Text('About Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.navy)),
          const SizedBox(height: 12),
          const Text(
            'BrightPath is a friendly demo app created to show clean Flutter navigation and thoughtful interface design.',
            style: TextStyle(fontSize: 16, height: 1.6, color: AppColors.muted),
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            label: 'Contact us',
            icon: Icons.arrow_forward_rounded,
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage())),
          ),
        ],
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShell(
      title: 'Contact',
      pageTitle: 'Let’s connect',
      pageSubtitle: 'We would love to hear from you.',
      currentIndex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageIcon(icon: Icons.mail_outline_rounded, color: Color(0xFFE68A4A)),
          const SizedBox(height: 24),
          const Text('Contact Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.navy)),
          const SizedBox(height: 12),
          const Text('Have a question or a new idea? Send us a message and we will get back to you soon.', style: TextStyle(fontSize: 16, height: 1.6, color: AppColors.muted)),
          const SizedBox(height: 24),
          ContactTile(icon: Icons.email_outlined, label: 'Email', value: 'hello@brightpath.dev'),
          const SizedBox(height: 12),
          ContactTile(icon: Icons.phone_outlined, label: 'Phone', value: '+20 100 000 0000'),
        ],
      ),
    );
  }
}

class AppShell extends StatelessWidget {
  final String title;
  final String pageTitle;
  final String pageSubtitle;
  final int currentIndex;
  final Widget child;

  const AppShell({super.key, required this.title, required this.pageTitle, required this.pageSubtitle, required this.currentIndex, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.navy)),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.bolt_rounded, color: AppColors.blue))],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 22, 24, 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(pageTitle, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.blue)),
            const SizedBox(height: 8),
            Text(pageSubtitle, style: const TextStyle(fontSize: 15, color: AppColors.muted)),
            const SizedBox(height: 28),
            child,
          ]),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          if (index == currentIndex) return;
          final page = [const HomePage(), const AboutPage(), const ContactPage()][index];
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.info_outline_rounded), selectedIcon: Icon(Icons.info_rounded), label: 'About'),
          NavigationDestination(icon: Icon(Icons.mail_outline_rounded), selectedIcon: Icon(Icons.mail_rounded), label: 'Contact'),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.label, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: FilledButton.icon(onPressed: onPressed, icon: Icon(icon), label: Text(label), style: FilledButton.styleFrom(backgroundColor: AppColors.navy, padding: const EdgeInsets.symmetric(vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),),
  );
}

class PageIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const PageIcon({super.key, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) => Container(width: 68, height: 68, decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(20)), child: Icon(icon, color: color, size: 32));
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const ContactTile({super.key, required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: AppColors.mint, borderRadius: BorderRadius.circular(18)), child: Row(children: [Icon(icon, color: AppColors.navy), const SizedBox(width: 14), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 12, color: AppColors.muted)), const SizedBox(height: 3), Text(value, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.navy))]) ]));
}
