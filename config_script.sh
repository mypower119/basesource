#!/bin/bash
#eval "dart update_app_info.dart"


# update launcher icon for Android and IOS
eval "flutter packages pub run flutter_launcher_icons:main"
eval "flutter packages get"


# gen development code again for mobx and database floor
#eval "flutter packages pub run build_runner build --delete-conflicting-outputs"
