//
//  File.swift
//  File
//
//  Created by Evans Domina Attafuah on 01/09/2021.
//

import UIKit
import SwiftUI

public typealias SocialButtonStyle = Klug.Social.Style
public typealias SocialButton = HStack<TupleView<(Image, Text)>>

public extension Klug {
    
    struct Social {
        public struct Style: PrimitiveButtonStyle {
            
            public func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .padding()
                    .background(Color(red: 0, green: 0, blue: 0.5))
                    .foregroundColor(.white)
            }
        }
    }
}

extension PrimitiveButtonStyle where Self == SocialButtonStyle {
    internal static var social: SocialButtonStyle { SocialButtonStyle() }
}

public extension Button where Label == SocialButton {
    init(_ social: Social, title: String = "Sign in", action: @escaping () -> Void) {
        var opt: (text: String, color: Color) = (text: .apple, color: .black)
        if social == .google {  opt = (text: .google, color: .red) }
        self.init(action: action) {
            HStack(spacing: 10) {
                social == .google ? Image.google : Image.apple
                Text(title)
            }
           // .buttonStyle(.social) as! SocialButton
        }
    }
}

struct Buttons_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            
            Button(.google) {
                print("chicken")
            }
            
            Button(.apple) {
                print("chicken")
            }
            
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}

//public extension UIButton {
//    convenience init(_ social: Social, title: String = "Sign in") {
//
//        var configuration = UIButton.Configuration.plain()
//        configuration.title = title
//        configuration.image = social == .google ? .google : .apple
////        configuration.titlePadding = 10
//        configuration.imagePadding = 10
//        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
//        configuration.buttonSize = .mini
//
//
//        self.init(configuration: configuration)
//
//
//        var opt: (text: String, color: UIColor) = (text: .apple, color: .vulcan)
//        if social == .google {
//            opt = (text: .google, color: .valencia)
//        }
//
//        setTitle(title, for: .normal)
//        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
//      //  setImage(social == .google ? .google : .apple, for: .normal)
//      //  imageEdgeInsets.left = -30
//        backgroundColor = opt.color
//        setTitleColor(.white, for: .normal)
//
//
//       // self.configuration = configuration
//
//    }
//}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct ButtonsPreview: UIViewRepresentable {
//
//    let button: UIButton
//
//    func makeUIView(context: Context) -> UIView {
//        return button
//
//    }
//
//    func updateUIView(_ view: UIView, context: Context) {}
//}
//
//@available(iOS 13.0, *)
//struct Buttons_Preview: PreviewProvider {
//    static var previews: some View {
//        Group {
//
//            ButtonsPreview(button: .init(.google, title: "sign in"))
//
//
//            ButtonsPreview(button: .init(.apple, title: "sign up"))
//        }
//        .previewLayout(.fixed(width: 400, height: 400))
//    }
//}
//#endif
