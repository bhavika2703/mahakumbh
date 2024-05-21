import 'package:kumb_mela/utility/show_msg_snack.dart';
import 'package:url_launcher/url_launcher.dart';

void launchPhone(String url) async {
  url = "tel:$url";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    ShowSnack.showToast("Invalid phone number...");
    throw 'Could not launch $url';
  }
}

void launchWebURL(String? link) async {
  if (link != null) {
    var url = Uri.parse(link);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Invalid url';
      }
    } catch (e) {
      ShowSnack.showToast(e.toString());
    }
  } else {
    ShowSnack.showToast("Invalid url");
  }
}

void launchWhatsapp({required String? number, required String? message}) async {
  if (number != null) {
    number = !number.startsWith("91") ? "+91$number" : number;
    String url = "whatsapp://send?phone=$number&text=$message";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ShowSnack.showToast("Invalid Number...");
      throw 'Could not launch $url';
    }
  } else {
    ShowSnack.showToast("Mobile Number not found...");
  }
}

void launchMail(String? emailId) async {
  if (emailId != null && emailId.isNotEmpty) {
    String url = "mailto:$emailId";
    if (await launchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ShowSnack.showToast("Invalid email id...");
      throw 'Could not launch $url';
    }
  } else {
    ShowSnack.showToast("Email id not found...");
  }
}
