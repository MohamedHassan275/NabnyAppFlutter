import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nabny/core/servies/storage_service.dart';
import 'package:nabny/screens/login_screen/login_screen.dart';
import 'package:nabny/utils/Themes.dart';

abstract class GuestHelper {
  /// Returns true if the user is currently browsing in Guest Mode (not logged in).
  static bool get isGuest {
    final token = Get.find<StorageService>().GetToken;
    return token.toString().trim().isEmpty;
  }

  /// Checks if the user is a guest.
  /// If logged in, returns false (not blocked).
  /// If guest, shows login pop-up dialog and returns true (blocked).
  static bool checkGuestAndShowDialog({BuildContext? context}) {
    if (!isGuest) return false;

    showLoginRequiredDialog();
    return true;
  }

  /// Shows the login required dialog popup.
  static void showLoginRequiredDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Themes.ColorApp1.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  color: Themes.ColorApp1,
                  size: 32,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'must_login_to_continue'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Themes.ColorApp2,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: const BorderSide(color: Themes.ColorApp2),
                      ),
                      onPressed: () => Get.back(),
                      child: Text(
                        'cancel'.tr,
                        style: const TextStyle(
                          color: Themes.ColorApp2,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Themes.ColorApp1,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Get.back();
                        Get.to(() => const LoginScreen());
                      },
                      child: Text(
                        'login'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }
}
