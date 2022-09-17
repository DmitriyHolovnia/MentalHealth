//
//  UIView+Extension.swift
//  MentalHealth
//
//  Created by Essence K on 17.09.2022.
//

import UIKit
import Combine


extension UIView {

  func addSubview(_ other: UIView, constraints: [NSLayoutConstraint]) {
    addSubview(other)
    other.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints)
  }

  func addSubviews(_ others: [UIView], constraints: [NSLayoutConstraint]) {
    others.forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    NSLayoutConstraint.activate(constraints)
  }

  func addSubview(_ other: UIView, withEdgeInsets edgeInsets: UIEdgeInsets) {
    addSubview(other, constraints: [
      other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left),
      other.topAnchor.constraint(equalTo: topAnchor, constant: edgeInsets.top),
      other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right),
      other.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edgeInsets.bottom)
    ])
  }

  func addSubview(_ other: UIView, withSafeAreaEdgeInsets edgeInsets: UIEdgeInsets) {
    addSubview(other, constraints: [
      other.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.left),
      other.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top),
      other.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -edgeInsets.right),
      other.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -edgeInsets.bottom)
    ])
  }

  func addSubviewToCenter(_ other: UIView, width: CGFloat? = nil, horizontalPadding: CGFloat? = nil, height: CGFloat? = nil) {
    var constraints = [
      other.centerYAnchor.constraint(equalTo: centerYAnchor),
      other.centerXAnchor.constraint(equalTo: centerXAnchor)
    ]
    width.flatMap { other.widthAnchor.constraint(equalToConstant: $0) }.map { constraints.append($0) }

    horizontalPadding.flatMap {
      let leading = other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: $0)
      let trailing = other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -$0)

      constraints.append(contentsOf: [leading, trailing])
    }

    height.flatMap { other.heightAnchor.constraint(equalToConstant: $0) }.map { constraints.append($0) }

    addSubview(other, constraints: constraints)
  }

  func addSubview(
    _ other: UIView,
    leading: CGFloat? = nil,
    trailing: CGFloat? = nil,
    top: CGFloat? = nil,
    bottom: CGFloat? = nil,
    height: CGFloat? = nil,
    width: CGFloat? = nil,
    centerX: CGFloat? = nil,
    centerY: CGFloat? = nil
  ) {
    var constraints: [NSLayoutConstraint] = []

    leading.map { constraints.append(other.leadingAnchor.constraint(equalTo: leadingAnchor, constant: $0)) }
    top.map { constraints.append(other.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: $0)) }
    trailing.map { constraints.append(other.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -$0)) }
    bottom.map { constraints.append(other.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -$0)) }
    height.map { constraints.append(other.heightAnchor.constraint(equalToConstant: $0)) }
    width.map { constraints.append(other.widthAnchor.constraint(equalToConstant: $0)) }
    centerX.map { constraints.append(other.centerXAnchor.constraint(equalTo: centerXAnchor, constant: $0)) }
    centerY.map { constraints.append(other.centerYAnchor.constraint(equalTo: centerYAnchor, constant: $0)) }

    addSubview(other, constraints: constraints)
  }

  func hideKeyboardOnBackgroudTap() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIView.dismissKeyboard))
    tap.cancelsTouchesInView = false
    addGestureRecognizer(tap)
  }

  @objc func dismissKeyboard() {
    endEditing(true)
  }

  func currentFirstResponse() -> UIResponder? {
    guard !isFirstResponder else {
      return self
    }

    for subview in subviews {
      if let responder = subview.currentFirstResponse() {
        return responder
      }
    }

    return nil
  }

  func rounded(_ radius: CGFloat? = nil) {
    if let radius = radius {
      layer.cornerRadius = radius
    } else {
      layer.cornerRadius = min(bounds.width, bounds.height) / 2
    }
  }

  func rounded(
    _ radius: CGFloat,
    by corners: CACornerMask = [
      .layerMaxXMinYCorner,
      .layerMaxXMaxYCorner,
      .layerMinXMaxYCorner,
      .layerMinXMinYCorner
    ]
  ) {
    layer.maskedCorners = corners
    layer.cornerRadius = radius

    if #available(iOS 13.0, *) {
      layer.cornerCurve = .continuous
    }
  }

  func bordered(borderColor: UIColor, borderWidth: CGFloat) {
    layer.borderColor = borderColor.cgColor
    layer.borderWidth = borderWidth
  }

  func shadowed(
    shadowColor: UIColor = .black,
    shadowOpacity: Float,
    shadowOffset: CGSize,
    shadowRadius: CGFloat
  ) {
    layer.shadowColor = shadowColor.cgColor
    layer.shadowOpacity = shadowOpacity
    layer.shadowOffset = shadowOffset
    layer.shadowRadius = shadowRadius
  }
}

public extension UITextField {
  /// A publisher which emits whenever return button tapped.
  var returnPublisher: AnyPublisher<String, Never> {
    NotificationCenter.default
      .publisher(for: UITextField.textDidEndEditingNotification, object: self)
      .map { ($0.object as? UITextField)?.text  ?? "" }
      .eraseToAnyPublisher()
  }
}
