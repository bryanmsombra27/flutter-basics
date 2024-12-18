import 'package:miscelaneos/config/config.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();

    quickActions.initialize((shortcutType) {
      switch (shortcutType) {
        case 'biometric':
          routes.push('/biometrics');
          break;
        case 'compass':
          routes.push('/compass');
          break;
        case 'pokemons':
          routes.push('/pokemons');
          break;
        case 'charmander':
          routes.push('/pokemons/4');
          break;
      }

      // More handling code...
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // los iconos se configurar por proyecto movil, es decir los recursos deben de estar en la carpeta de  android/app/src/main/res/drawable en ios es en otro proyecto movil (ios)
      const ShortcutItem(
          type: 'biometric', localizedTitle: 'Biometric', icon: 'finger'),
      const ShortcutItem(
          type: 'compass', localizedTitle: 'Compass', icon: 'compass'),
      const ShortcutItem(
          type: 'pokemons', localizedTitle: 'Pokemons', icon: 'pokemons'),
      const ShortcutItem(
          type: 'charmander', localizedTitle: 'Charmander', icon: 'charmander'),
    ]);
  }
}
