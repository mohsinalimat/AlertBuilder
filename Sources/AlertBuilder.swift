//
//  AlertBuilder.swift
//  AlertBuilder
//
//  Created by Okan Yücel on 23.04.2019.
//  Copyright © 2019 Okan Yücel. All rights reserved.
//

import Foundation
import UIKit

public class AlertViewBuilder {
    static let shared = AlertViewBuilder()
    private var buttons: [UIButton] = [UIButton]()
    private var scrollView: UIScrollView!
    private var stackView: UIStackView!
    private var alertView = UIView()
    public typealias buildAlertViewClosure = (AlertViewBuilder) -> Void
    private var viewHeightCounter:CGFloat = 0
    private var widthConstraintStackView: NSLayoutConstraint?
    private var widthConstraintScrollView: NSLayoutConstraint?
    
    private var widthScale:CGFloat = 0.8
    
    private init(){
        
    }
    
    public func build(widthScale: CGFloat = 0.8) -> AlertViewBuilder {
        
        if widthScale > 1{
             self.widthScale = 1
            print("widthScale can not be '> 1'.")
        }else if widthScale <= 0{
             self.widthScale = 1
            print("widthScale can not be '< 0'.")
        }else{
           self.widthScale = widthScale
        }
        
        if  AlertViewBuilder.shared.buttons.count == 2{
            let subStackView = UIStackView()
            subStackView.translatesAutoresizingMaskIntoConstraints = false
            subStackView.axis = .horizontal
            subStackView.distribution = .fillEqually
            subStackView.alignment = .center
            subStackView.spacing = 0
            
            let height:CGFloat = AlertViewBuilder.shared.buttons[0].tag > AlertViewBuilder.shared.buttons[1].tag ?  CGFloat(AlertViewBuilder.shared.buttons[0].tag):CGFloat(AlertViewBuilder.shared.buttons[1].tag)
            
            subStackView.heightAnchor.constraint(equalToConstant: height).isActive = true
            self.stackView.addArrangedSubview(subStackView)
            for item in  AlertViewBuilder.shared.buttons{
                
                if item == AlertViewBuilder.shared.buttons.first{
                    item.roundCorners([.bottomLeft],.layerMinXMaxYCorner, radius: 5)
                }
                
                if item == AlertViewBuilder.shared.buttons.last{
                    item.roundCorners([.bottomRight],.layerMaxXMaxYCorner, radius: 5)
                }
                
                
                subStackView.addArrangedSubview(item)
            }
            
        }else{
            for item in  AlertViewBuilder.shared.buttons{
                
                if item == AlertViewBuilder.shared.buttons.last{
                    item.roundCorners([.bottomLeft, .bottomRight], [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 5)
                }
                
                self.stackView.addArrangedSubview(item)
            }
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        
        self.rotated()
        
        AlertViewBuilder.shared.buttons.removeAll(keepingCapacity: false)
        return self
    }
    
    @objc func rotated() {
        
        self.scrollView.removeFromSuperview()
        self.alertView.addSubview(self.scrollView)
        self.setCenterYConstraints(self.scrollView)
        
        self.stackView.removeFromSuperview()
        self.scrollView.addSubview(self.stackView)
        
        guard let window = UIApplication.shared.keyWindow else{
            print("UIApplication.shared.keyWindow is nil")
            return
        }
        
        var heightOfScreen = UIScreen.main.bounds.height
        if #available(iOS 11.0, *) {
            let topPadding = window.safeAreaInsets.top
            let bottomPadding = window.safeAreaInsets.bottom
            heightOfScreen -= (topPadding + bottomPadding)
        }
        
        if self.viewHeightCounter >= heightOfScreen{
            self.setAllConstraints(self.stackView)
        }else{
            self.setCenterXYConstraints(self.stackView)
        }
        
        var leftSafeArea: CGFloat = 0
        var rightSafeArea: CGFloat = 0
        
        if #available(iOS 11.0, *) {
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            leftSafeArea = safeFrame.minX
            rightSafeArea = window.frame.maxX - safeFrame.maxX
        }
        
        let width = (UIScreen.main.bounds.width - leftSafeArea - rightSafeArea) * widthScale
        
        self.widthConstraintStackView?.isActive = false
        self.widthConstraintStackView = self.stackView.widthAnchor.constraint(equalToConstant: width)
        self.widthConstraintStackView?.isActive = true
        
        self.widthConstraintScrollView?.isActive = false
        self.widthConstraintScrollView = self.scrollView.widthAnchor.constraint(equalToConstant: width)
        self.widthConstraintScrollView?.isActive = true
        scrollView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        
    }
    
    public init(build: @escaping buildAlertViewClosure) {
        
        alertView.backgroundColor = .clear
        alertView.tag = 1995
        
        let visualEffectView = VisualEffectView(frame: .zero)
        visualEffectView.colorTint =  .black
        visualEffectView.colorTintAlpha = 0.2
        visualEffectView.blurRadius = 10
        visualEffectView.scale = 1
        visualEffectView.alpha = 0
        visualEffectView.tag = 9999
        alertView.addSubview(visualEffectView)
        self.setAllConstraints(visualEffectView)
        
        scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        alertView.addSubview(scrollView)
        self.setAllConstraints(scrollView)
        
        stackView = RoundedShadowStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        //stackView.distribution = .equalCentering
        stackView.alignment = .fill
        
        
        stackView.spacing = 0
        scrollView.addSubview(stackView)
        //self.setCenterConstraints(stackView)
        //self.stackView.widthAnchor.constraint(equalTo: self.alertViewController.mainView.widthAnchor).isActive = true
        
        
        build(self)
        
        guard let window = UIApplication.shared.keyWindow else{
            print("UIApplication.shared.keyWindow is nil")
            return
        }
        
        UIView.transition(with: window, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            
            visualEffectView.alpha = 1
            window.addSubview(self.alertView)
            self.setAllConstraints(self.alertView)
            
        }, completion: nil)
        
        
    }
    
    @discardableResult
    public func addView(with view: UIView, tag: Int, height: CGFloat) -> AlertViewBuilder {
        view.tag = tag
        stackView.addArrangedSubview(view)
        
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        self.viewHeightCounter += height
        return self
    }
    
    @discardableResult
    public func addViewWithAction(with view: UIView, tag: Int, height: CGFloat, action: @escaping () -> Void) -> AlertViewBuilder {
        view.tag = tag
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer { (gr) in
            action()
        })
        
        stackView.addArrangedSubview(view)
        
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.viewHeightCounter += height
        return self
    }
    
    @discardableResult
    public func addButton(with title: String?, backgroundColor: UIColor,titleColor: UIColor, font: UIFont, height: CGFloat, action: @escaping () -> Void) -> AlertViewBuilder {
        
        let button = UIButton.init(frame: .zero)
        stackView.addArrangedSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.viewHeightCounter += height
        button.isUserInteractionEnabled = true
        
        button.addGestureRecognizer(UITapGestureRecognizer { (gr) in
            action()
            self.closeAlertView()
        })
        
        button.tag = Int(height)
        AlertViewBuilder.shared.buttons.append(button)
        
        return self
    }
    
    public func getView(viewWithTag: Int) -> UIView{
        
        if let view = self.stackView.viewWithTag(viewWithTag){
            return view
        }
        
        return UIView.init()
    }
    
    public func closeAlertView(){
        guard let window = UIApplication.shared.keyWindow else{
            print("UIApplication.shared.keyWindow is nil")
            return
        }
        
        UIView.transition(with: window, duration: 0.5, options: [.transitionCrossDissolve], animations: {
            
            if let w = window.viewWithTag(1995){
                if let vis = w.viewWithTag(9999) as? VisualEffectView{
                    vis.alpha = 0
                }
                w.removeFromSuperview()
            }
            
        }, completion: nil)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setAllConstraints(_ view: UIView) {
        
        guard let superView = view.superview else{
            return
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setCenterYConstraints(_ view: UIView) {
        
        guard let superView = view.superview else{
            return
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: 0).isActive = true
        view.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        
    }
    
    
    
    private func setCenterXYConstraints(_ view: UIView) {
        
        guard let superView = view.superview else{
            return
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(greaterThanOrEqualTo: superView.bottomAnchor, constant: 0).isActive = true
        //view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 5).isActive = true
        //view.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: 5).isActive = true
        view.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
    
}

