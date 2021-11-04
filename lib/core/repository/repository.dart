import 'package:contacts_service/contacts_service.dart';
import 'package:url_launcher/url_launcher.dart';

class Repository {
  Future<void> voiceCall(String name) async {
    List<Contact> callee = await ContactsService.getContacts(query: name);
    print('What I think the number is: ${callee[0].phones[0].value}');
    if (await canLaunch('tel:${callee[0].phones[0].value}')) {
      await launch('tel:${callee[0].phones[0].value}');
    } else {
      throw 'Could not launch ${callee[0].phones[0].value}';
    }
  }
}
