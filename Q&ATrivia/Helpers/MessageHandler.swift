import UIKit
import SwiftMessages

class MessageHandler: NSObject {

    class func errorHandlerWithString(_ errorMessage: String) {
        showMessage(theme: .error, title: "Error", subtitle: errorMessage, backgroundColor: Constants.Colors.Error)
    }

    class func successHandler(_ successMessage: String) {
        showMessage(theme: .success, title: "Success", subtitle: successMessage, backgroundColor: Constants.Colors.Success)
    }

    class func warningHandler(_ warningMessage: String) {
        showMessage(theme: .warning, title: "Warning", subtitle: warningMessage, backgroundColor: Constants.Colors.Warning)
    }

    class func information(_ informationMessage: String) {
        showMessage(theme: .info, title: "Information", subtitle: informationMessage, backgroundColor: Constants.Colors.Info)
    }

    class func showMessage(theme: Theme, title: String, subtitle: String, backgroundColor: UIColor? = nil) {
        SwiftMessages.show(config: SwiftMessages.Config(),
                           view: setupMessageView(theme: theme, title: title, subtitle: subtitle, backgroundColor: backgroundColor))
    }

    class func setupMessageDuration() -> SwiftMessages.Config {
        var config = SwiftMessages.Config()
        config.duration = .forever
        return config
    }

    class func setupMessageView(theme: Theme, title: String, subtitle: String, backgroundColor: UIColor? = nil) -> MessageView {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureContent(title: title, body: subtitle)
        view.button?.isHidden = true
        view.configureDropShadow()

        if backgroundColor != nil {
            view.backgroundView.backgroundColor = backgroundColor
            view.button?.tintColor = backgroundColor
        }

        return view
    }
}
