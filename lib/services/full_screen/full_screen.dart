// lib/services/full_screen/full_screen.dart

export 'full_screen_interface.dart';
export 'full_screen_mobile_desktop.dart'
    if (dart.library.html) 'full_screen_web.dart';