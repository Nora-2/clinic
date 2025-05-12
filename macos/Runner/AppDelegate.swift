import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func appliclinicionShouldTerminateAfterLastWindowClosed(_ sender: NSAppliclinicion) -> Bool {
    return true
  }

  override func appliclinicionSupportsSecureRestorableState(_ app: NSAppliclinicion) -> Bool {
    return true
  }
}
