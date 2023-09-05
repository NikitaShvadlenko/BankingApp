// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// %@ Availible
  internal static func amountAvailible(_ p1: Any) -> String {
    return L10n.tr("Localizable", "AmountAvailible", String(describing: p1), fallback: "%@ Availible")
  }
  internal enum AccountDetail {
    /// Account details
    internal static let accountDetails = L10n.tr("Localizable", "AccountDetail.accountDetails", fallback: "Account details")
    /// Anonymous sender
    internal static let anonymous = L10n.tr("Localizable", "AccountDetail.anonymous", fallback: "Anonymous sender")
    /// Search transactions
    internal static let searchTransactions = L10n.tr("Localizable", "AccountDetail.searchTransactions", fallback: "Search transactions")
    /// Transactions
    internal static let transactions = L10n.tr("Localizable", "AccountDetail.transactions", fallback: "Transactions")
  }
  internal enum AccountDetailPage {
    /// Account name:
    internal static let accountName = L10n.tr("Localizable", "AccountDetailPage.accountName", fallback: "Account name:")
    /// Account type:
    internal static let accountType = L10n.tr("Localizable", "AccountDetailPage.accountType", fallback: "Account type:")
    /// Hi, my ANZ account name is %@, and the account number is %@
    internal static func shareString(_ p1: Any, _ p2: Any) -> String {
      return L10n.tr("Localizable", "AccountDetailPage.shareString", String(describing: p1), String(describing: p2), fallback: "Hi, my ANZ account name is %@, and the account number is %@")
    }
  }
  internal enum AccountsScreen {
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "AccountsScreen.cancel", fallback: "Cancel")
    /// Failed to retrieve accounts data.
    internal static let failedToRetrieveData = L10n.tr("Localizable", "AccountsScreen.failedToRetrieveData", fallback: "Failed to retrieve accounts data.")
    /// Retry
    internal static let retry = L10n.tr("Localizable", "AccountsScreen.retry", fallback: "Retry")
    /// Something went wrong.
    internal static let somethigWentWrong = L10n.tr("Localizable", "AccountsScreen.somethigWentWrong", fallback: "Something went wrong.")
    /// Accounts
    internal static let title = L10n.tr("Localizable", "AccountsScreen.title", fallback: "Accounts")
  }
  internal enum NavigationBar {
    /// Log out
    internal static let loguot = L10n.tr("Localizable", "NavigationBar.loguot", fallback: "Log out")
  }
  internal enum OverlayScreen {
    /// ANZgoMoney.
    internal static let appName = L10n.tr("Localizable", "OverlayScreen.appName", fallback: "ANZgoMoney.")
    /// Loading your details
    /// from ANZ...
    internal static let connecting = L10n.tr("Localizable", "OverlayScreen.connecting", fallback: "Loading your details\nfrom ANZ...")
  }
  internal enum ServicesScreen {
    /// Apply for card
    internal static let applyForCard = L10n.tr("Localizable", "ServicesScreen.applyForCard", fallback: "Apply for card")
    /// Close
    internal static let close = L10n.tr("Localizable", "ServicesScreen.close", fallback: "Close")
    /// View my cards
    internal static let viewCards = L10n.tr("Localizable", "ServicesScreen.viewCards", fallback: "View my cards")
  }
  internal enum TabBar {
    /// Accounts
    internal static let accounts = L10n.tr("Localizable", "TabBar.accounts", fallback: "Accounts")
    /// Payments
    internal static let payments = L10n.tr("Localizable", "TabBar.payments", fallback: "Payments")
    /// Services
    internal static let services = L10n.tr("Localizable", "TabBar.services", fallback: "Services")
    /// Settings
    internal static let settings = L10n.tr("Localizable", "TabBar.settings", fallback: "Settings")
    /// Transfer
    internal static let transfer = L10n.tr("Localizable", "TabBar.transfer", fallback: "Transfer")
  }
  internal enum TransactionDetail {
    /// at
    internal static let at = L10n.tr("Localizable", "TransactionDetail.at", fallback: "at")
    /// Balance after transaction: %@
    internal static func balanceAfterTransaction(_ p1: Any) -> String {
      return L10n.tr("Localizable", "TransactionDetail.balanceAfterTransaction", String(describing: p1), fallback: "Balance after transaction: %@")
    }
    /// Details:
    internal static let details = L10n.tr("Localizable", "TransactionDetail.details", fallback: "Details:")
    /// Processed on: %@
    internal static func processedOn(_ p1: Any) -> String {
      return L10n.tr("Localizable", "TransactionDetail.processedOn", String(describing: p1), fallback: "Processed on: %@")
    }
    /// Share transaction details
    internal static let share = L10n.tr("Localizable", "TransactionDetail.share", fallback: "Share transaction details")
  }
  internal enum TransactionDetailPage {
    ///  of %@
    internal static func pageNumber(_ p1: Any) -> String {
      return L10n.tr("Localizable", "TransactionDetailPage.pageNumber", String(describing: p1), fallback: " of %@")
    }
  }
  internal enum TransactionDetailSharePage {
    /// Share
    internal static let share = L10n.tr("Localizable", "TransactionDetailSharePage.share", fallback: "Share")
  }
  internal enum TransferScreen {
    /// Cancel
    internal static let cancel = L10n.tr("Localizable", "TransferScreen.cancel", fallback: "Cancel")
    /// From:
    internal static let from = L10n.tr("Localizable", "TransferScreen.from", fallback: "From:")
    /// Transfer funds
    internal static let title = L10n.tr("Localizable", "TransferScreen.title", fallback: "Transfer funds")
    /// To:
    internal static let to = L10n.tr("Localizable", "TransferScreen.to", fallback: "To:")
    /// Transfer
    internal static let transfer = L10n.tr("Localizable", "TransferScreen.transfer", fallback: "Transfer")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
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
