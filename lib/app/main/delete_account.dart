import 'package:flutter/material.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/app/main/mypacel/app_button.dart';
import 'package:unitycargo/bll/login_logic.dart';
import 'package:unitycargo/resources/app_authentication.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool loading = false;
  @override
  void initState() {
    super.initState();
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Delete Account',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(kDefaultFontSize * 2),
          color: Colors.white,
          width: double.maxFinite,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Icon(
                Icons.mood_bad,
                color: Colors.redAccent,
                size: kDefaultFontSize * 4,
              ),
              const SizedBox(
                height: 10,
              ),
              Title(
                  color: Colors.black,
                  child: const Text(
                    "Delete Account?",
                    style: TextStyle(
                        fontSize: kDefaultFontSize + 6,
                        fontWeight: FontWeight.w700),
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Deleting your account will remove all of your information from our database. This cannot be undone.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                  hasIcon: false,
                  text: loading ? "Please wait..." : "Delete Account",
                  size: const Size(double.maxFinite, 45),
                  onpress: () async {
                    if (loading) return;
                    setState(() => loading = true);
                    String deleteAcct = await deleteAccount();
                    if (deleteAcct == "success") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("Account deleted successfully"),
                          backgroundColor: Colors.green.withOpacity(0.6),
                        ),
                      );

                      AppAuthentication appAuthentication = AppAuthentication();
                      await appAuthentication.logout();
                      appAuthentication.navigatePageReal(
                          context, const LoginScreen());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(deleteAcct.toString()),
                          backgroundColor: Colors.red.withOpacity(0.6),
                        ),
                      );
                    }
                    setState(() => loading = false);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
