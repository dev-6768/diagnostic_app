import 'package:auto_route/auto_route.dart';
import 'package:diagnostic_app/features/contact_details/controller/pod/contact_details_pod.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/address_card.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/contact_item.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/contact_utils.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/message_button.dart';
import 'package:diagnostic_app/features/contact_details/view/widget/section_header.dart';
import 'package:diagnostic_app/shared/riverpod_ext/asynvalue_easy_when.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ContactDetailsPage extends StatelessWidget {
  const ContactDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContactDetailsView();
  }
}

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Contact Us',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final contactDetailsAsync = ref.watch(contactDetailsProvider);
            return contactDetailsAsync.easyWhen(
              data: (contactDetailsModel) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: 'Our Locations'),
                        AddressCard(
                          title: 'Corporate Office',
                          address: contactDetailsModel.contactData.corporateOfficeAddress,
                          icon: Icons.business,
                        ),
                        const SizedBox(height: 16),
                        AddressCard(
                          title: 'Laboratory',
                          address: contactDetailsModel.contactData.laboratoryAddress,
                          icon: Icons.science,
                        ),
                        const SizedBox(height: 24),
                        const SectionHeader(title: 'Contact Information'),
                        const SizedBox(height: 8),
                        ContactItem(
                          icon: Icons.phone,
                          title: 'Toll Free',
                          content: contactDetailsModel.contactData.contactNo1,
                          onTap: () => ContactUtils.makePhoneCall(
                              contactDetailsModel.contactData.contactNo1),
                        ),
                        ContactItem(
                          icon: Icons.phone_android,
                          title: 'Mobile',
                          content: contactDetailsModel.contactData.contactNo2,
                          onTap: () => ContactUtils.makePhoneCall(
                              contactDetailsModel.contactData.contactNo2),
                        ),
                        ContactItem(
                          icon: Icons.email,
                          title: 'Email',
                          content: contactDetailsModel.contactData.contactEmail,
                          onTap: () =>
                              ContactUtils.sendEmail(contactDetailsModel.contactData.contactEmail),
                        ),
                        const SizedBox(height: 32),
                        const MessageButton(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
