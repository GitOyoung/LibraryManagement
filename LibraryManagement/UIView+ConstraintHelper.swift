//
//  UIView+ConstraintHelper.swift
//  LibraryManagement
//
//  Created by 骇客 学院 on 15/11/28.
//  Copyright © 2015年 Oyoung. All rights reserved.
//

import UIKit

extension UIView
{
    func makeConstraintOrigin(origin: CGPoint) -> Void
    {
        if self.superview == nil
        {
            return
        }
        if self.translatesAutoresizingMaskIntoConstraints
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.superview?.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: center.x))
        
        self.superview?.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: center.y))
    }
    func makeConstriantCenter(center: CGPoint) -> Void
    {
        if self.superview == nil
        {
            return
        }
        
        if self.translatesAutoresizingMaskIntoConstraints
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.superview?.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: center.x))
        
        self.superview?.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.superview, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: center.y))
    }
    
    func makeConstraintSize(size: CGSize) -> Void
    {
        if self.translatesAutoresizingMaskIntoConstraints
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:[self(theWidth@750)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: ["theWidth": size.width], views: ["self": self]))
        self.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[self(theHeight@750)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: ["theHeight": size.height], views: ["self": self]))
    }
    
    func makeConstraintEdgeInsets(insets: UIEdgeInsets, view: UIView)
    {
        if self.translatesAutoresizingMaskIntoConstraints
        {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: insets.left))
        
        view.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: insets.top))
        
        view.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -insets.right))
        view.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -insets.bottom))
    }
}
