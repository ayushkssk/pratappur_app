  stack_trace 1.12.0 (1.12.1 available)
  stream_channel 2.1.2 (2.1.3 available)
  string_scanner 1.3.0 (1.4.1 available)
  syncfusion_flutter_core 26.2.14 (28.1.35 available)
  syncfusion_flutter_pdf 26.2.14 (28.1.35 available)
  syncfusion_flutter_pdfviewer 26.2.14 (28.1.35 available)
  syncfusion_flutter_signaturepad 26.2.14 (28.1.35 available)
  syncfusion_pdfviewer_macos 26.2.14 (28.1.35 available)
  syncfusion_pdfviewer_platform_interface 26.2.14 (28.1.35 available)
  syncfusion_pdfviewer_web 26.2.14 (28.1.35 available)
  syncfusion_pdfviewer_windows 26.2.14 (28.1.35 available)
  term_glyph 1.2.1 (1.2.2 available)
  test_api 0.7.3 (0.7.4 available)
  timezone 0.9.4 (0.10.0 available)
  vm_service 14.3.0 (15.0.0 available)
  win32_registry 1.1.5 (2.0.1 available)
Got dependencies!
44 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.
package com.pratappur.app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "flutter.dev/NDPSAESLibrary"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "NDPSAESInit") {
                // Call your encryption function
                val encryptedData = encryptData()
                result.success(encryptedData) // Return the result to Flutter
            } else {
                result.notImplemented()
            }
        }
    }

    // Example AES encryption logic (replace with your real encryption logic)
    private fun encryptData(): String {
        // Add your encryption logic here.
        return "Encrypted Data from Android"
    }
}
