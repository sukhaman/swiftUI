// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Build a Sentence
  internal static let buildASentence = L10n.tr("Build a sentence", fallback: "Build a Sentence")
  /// Clear
  internal static let clear = L10n.tr("clear", fallback: "Clear")
  /// Hello
  internal static let hello = L10n.tr("hello", fallback: "Hello")
  /// I
  internal static let i = L10n.tr("i", fallback: "I")
  /// Know
  internal static let know = L10n.tr("know", fallback: "Know")
  /// Select Language
  internal static let selectLanguage = L10n.tr("Select Language", fallback: "Select Language")
  /// Sentence:
  internal static let sentence = L10n.tr("sentence", fallback: "Sentence:")
  /// Speak
  internal static let speak = L10n.tr("speak", fallback: "Speak")
  /// You
  internal static let you = L10n.tr("you", fallback: "You")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: nil)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
