import '../models/trusted_contact.dart';

abstract class ContactsRepository {
  Future<List<TrustedContact>> fetchContacts(String userId);
  Future<void> saveContact(TrustedContact contact);
  Future<void> deleteContact(String contactId);
}

