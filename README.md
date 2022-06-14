# flutter_hs

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1 создать в фаербейзе проект для флатера
2 дальше по шагам скачать иде фаербейза с помощью команды curl -sL https://firebase.tools | bash
3 залогиниться в иде
4 dart pub global activate flutterfire_cli (комада прописана при созданни проекта в фаербейз)
4.а если возникли проблемы с этой командой то мы открывем home - дальше скрытые файлы - дальше .zshrc и добавляем путь 5. flutterfire configure --project=hsnew-a78fd(эта команда тоже пр создании формируеться) 6. дальше добавляем в меин инициализацию - при этом import 'package:firebase_core/firebase_core.dart'; добавляем отдельно

WidgetsFlutterBinding.ensureInitialized(); - необходимо добавить если инициализейшен будет с ошибкой
