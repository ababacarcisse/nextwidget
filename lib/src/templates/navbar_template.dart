const String mainNavTemplate = '''
import 'package:flutter/material.dart';

class NavItem {
  final String title;
  final String href;
  final bool disabled;

  NavItem({required this.title, required this.href, this.disabled = false});
}

class SiteConfig {
  final String name;
  final String logo;

  SiteConfig({required this.name, required this.logo});
}

class MainNav extends StatelessWidget {
  final List<NavItem>? items;
  final SiteConfig siteConfig;

  const MainNav({Key? key, this.items, required this.siteConfig}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 600;

        return Row(
          children: [
            _buildLogo(),
            if (items != null && items!.isNotEmpty)
              Expanded(
                child: isSmallScreen
                    ? _buildDropdownMenu(context)
                    : _buildNavItems(context),
              ),
          ],
        );
      },
    );
  }

  Widget _buildLogo() {
    return InkWell(
      onTap: () {
        // Navigation logic for home page
      },
      child: Row(
        children: [
          Image.asset(siteConfig.logo, height: 24, width: 24),
          SizedBox(width: 8),
          Text(
            siteConfig.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItems(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: items!.map((item) => _buildNavItem(context, item)).toList(),
    );
  }

  Widget _buildNavItem(BuildContext context, NavItem item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: item.disabled ? null : () {
          // Navigation logic here
        },
        child: Text(
          item.title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: item.disabled
                ? Theme.of(context).disabledColor
                : Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownMenu(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu),
      onSelected: (String result) {
        // Navigation logic here
      },
      itemBuilder: (BuildContext context) {
        return items!.map((NavItem item) {
          return PopupMenuItem<String>(
            value: item.href,
            enabled: !item.disabled,
            child: Text(item.title),
          );
        }).toList();
      },
    );
  }
}

// Usage example:
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: MainNav(
//         siteConfig: SiteConfig(name: 'My Site', logo: 'assets/logo.png'),
//         items: [
//           NavItem(title: 'Home', href: '/'),
//           NavItem(title: 'About', href: '/about'),
//           NavItem(title: 'Contact', href: '/contact', disabled: true),
//         ],
//       ),
//     ),
//   ));
// }
''';