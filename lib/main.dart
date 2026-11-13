import 'package:flutter/material.dart';

void main() => runApp(const BlushBloomApp());

class BrandColors {
  static const rose = Color(0xFFE7799D);
  static const deepRose = Color(0xFF7B294B);
  static const blush = Color(0xFFFFF1F5);
  static const lavender = Color(0xFFF3EEFF);
  static const ink = Color(0xFF3D2632);
  static const muted = Color(0xFF8B707B);
}

class BlushBloomApp extends StatelessWidget {
  const BlushBloomApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blush & Bloom',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: BrandColors.rose),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Arial',
        ),
        home: const HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => AppShell(
        title: 'Blush & Bloom',
        eyebrow: 'BEAUTY, BUT MAKE IT YOU',
        subtitle: 'Little touches. Big confidence.',
        index: 0,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset('assets/makeup_hero.jpg', height: 220, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 24),
          const Text('Home Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: BrandColors.deepRose)),
          const SizedBox(height: 9),
          const Text('Discover your next makeup mood with our soft, playful beauty collection.', style: TextStyle(fontSize: 16, height: 1.5, color: BrandColors.muted)),
          const SizedBox(height: 22),
          const Row(children: [
            MiniFeature(icon: Icons.auto_awesome_rounded, label: 'Glow picks'),
            SizedBox(width: 12),
            MiniFeature(icon: Icons.favorite_rounded, label: 'Made for you'),
          ]),
          const SizedBox(height: 18),
          const Row(children: [
            ProductCard(image: 'assets/lipstick_product.jpg', name: 'Rose Kiss'),
            SizedBox(width: 12),
            ProductCard(image: 'assets/blush_product.jpg', name: 'Soft Bloom'),
          ]),
          const SizedBox(height: 26),
          PrimaryButton(label: 'Meet the brand', icon: Icons.arrow_forward_rounded, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AboutPage()))),
        ]),
      );
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) => AppShell(
        title: 'Our story',
        eyebrow: 'ABOUT BLUSH & BLOOM',
        subtitle: 'Makeup that celebrates your everyday glow.',
        index: 1,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const FeatureIcon(icon: Icons.auto_awesome_rounded, color: BrandColors.rose),
          const SizedBox(height: 22),
          const Text('About Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: BrandColors.deepRose)),
          const SizedBox(height: 12),
          const Text('Blush & Bloom is a cheerful beauty space for effortless looks, pretty details, and a little more confidence every day.', style: TextStyle(fontSize: 16, height: 1.6, color: BrandColors.muted)),
          const SizedBox(height: 22),
          Container(padding: const EdgeInsets.all(18), decoration: BoxDecoration(color: BrandColors.lavender, borderRadius: BorderRadius.circular(20)), child: const Row(children: [Icon(Icons.spa_rounded, color: BrandColors.deepRose, size: 28), SizedBox(width: 14), Expanded(child: Text('Soft colors, kind formulas, and looks that feel like you.', style: TextStyle(fontWeight: FontWeight.w700, height: 1.4, color: BrandColors.ink)))])),
          const SizedBox(height: 24),
          PrimaryButton(label: 'Get in touch', icon: Icons.mail_outline_rounded, onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ContactPage()))),
        ]),
      );
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});
  @override
  Widget build(BuildContext context) => AppShell(
        title: 'Say hello',
        eyebrow: 'CONTACT US',
        subtitle: 'We are always happy to chat beauty.',
        index: 2,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const FeatureIcon(icon: Icons.mail_rounded, color: BrandColors.deepRose),
          const SizedBox(height: 22),
          const Text('Contact Page', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: BrandColors.deepRose)),
          const SizedBox(height: 12),
          const Text('Questions, suggestions, or just want to say hi? Find us here.', style: TextStyle(fontSize: 16, height: 1.6, color: BrandColors.muted)),
          const SizedBox(height: 22),
          const ContactTile(icon: Icons.email_outlined, label: 'Email', value: 'hello@blushandbloom.dev'),
          const SizedBox(height: 12),
          const ContactTile(icon: Icons.camera_alt_outlined, label: 'Instagram', value: '@blushandbloom'),
        ]),
      );
}

class AppShell extends StatelessWidget {
  final String title, eyebrow, subtitle;
  final int index;
  final Widget child;
  const AppShell({super.key, required this.title, required this.eyebrow, required this.subtitle, required this.index, required this.child});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: BrandColors.deepRose)), backgroundColor: Colors.white, elevation: 0, actions: const [Padding(padding: EdgeInsets.only(right: 20), child: Icon(Icons.favorite_rounded, color: BrandColors.rose))]),
        body: SafeArea(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(24, 22, 24, 32), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(eyebrow, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.2, color: BrandColors.rose)), const SizedBox(height: 8), Text(subtitle, style: const TextStyle(fontSize: 15, color: BrandColors.muted)), const SizedBox(height: 28), child]))),
        bottomNavigationBar: NavigationBar(
          selectedIndex: index,
          indicatorColor: BrandColors.blush,
          onDestinationSelected: (next) { if (next == index) return; final page = [const HomePage(), const AboutPage(), const ContactPage()][next]; Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page)); },
          destinations: const [NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded, color: BrandColors.deepRose), label: 'Home'), NavigationDestination(icon: Icon(Icons.auto_awesome_outlined), selectedIcon: Icon(Icons.auto_awesome_rounded, color: BrandColors.deepRose), label: 'About'), NavigationDestination(icon: Icon(Icons.mail_outline_rounded), selectedIcon: Icon(Icons.mail_rounded, color: BrandColors.deepRose), label: 'Contact')],
        ),
      );
}

class PrimaryButton extends StatelessWidget {
  final String label; final IconData icon; final VoidCallback onPressed;
  const PrimaryButton({super.key, required this.label, required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) => SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: onPressed, icon: Icon(icon), label: Text(label), style: FilledButton.styleFrom(backgroundColor: BrandColors.deepRose, padding: const EdgeInsets.symmetric(vertical: 17), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)))));
}

class FeatureIcon extends StatelessWidget {
  final IconData icon; final Color color;
  const FeatureIcon({super.key, required this.icon, required this.color});
  @override
  Widget build(BuildContext context) => Container(width: 68, height: 68, decoration: BoxDecoration(color: color.withOpacity(.12), borderRadius: BorderRadius.circular(20)), child: Icon(icon, color: color, size: 32));
}

class MiniFeature extends StatelessWidget {
  final IconData icon; final String label;
  const MiniFeature({super.key, required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Expanded(child: Container(padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12), decoration: BoxDecoration(color: BrandColors.blush, borderRadius: BorderRadius.circular(16)), child: Row(children: [Icon(icon, size: 20, color: BrandColors.rose), const SizedBox(width: 8), Flexible(child: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: BrandColors.ink)))])));
}

class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  const ProductCard({super.key, required this.image, required this.name});
  @override
  Widget build(BuildContext context) => Expanded(child: Container(decoration: BoxDecoration(color: BrandColors.blush, borderRadius: BorderRadius.circular(18)), clipBehavior: Clip.antiAlias, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Image.asset(image, height: 95, width: double.infinity, fit: BoxFit.cover), Padding(padding: const EdgeInsets.fromLTRB(12, 10, 12, 12), child: Text(name, style: const TextStyle(fontWeight: FontWeight.w700, color: BrandColors.deepRose)))])));
}

class ContactTile extends StatelessWidget {
  final IconData icon; final String label, value;
  const ContactTile({super.key, required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: BrandColors.blush, borderRadius: BorderRadius.circular(18)), child: Row(children: [Icon(icon, color: BrandColors.deepRose), const SizedBox(width: 14), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 12, color: BrandColors.muted)), const SizedBox(height: 3), Text(value, style: const TextStyle(fontWeight: FontWeight.w700, color: BrandColors.deepRose))])]));
}
