// lib/services/full_screen.dart

// No necessitem kIsWeb ni els imports de SystemServices o DesktopWindow aquí,
// perquè els importarà la implementació real.
// Tampoc necessitem platform_stub/platform_io aquí, els seus usos ara són dins
// de l'implementació de full_screen_mobile_desktop.dart si la necessita.

// Importació condicional de la implementació correcta de FullScreenService
export 'full_screen_mobile_desktop.dart'
    if (dart.library.html) 'full_screen_web.dart';