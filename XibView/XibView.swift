//
//  XibView.swift
//  XibView
//
//  Created by catch on 15/10/17.
//  Copyright © 2015年 Limon. All rights reserved.
//

import UIKit

@IBDesignable class XibView: UIView {

    @IBOutlet weak var xibLabel: UILabel!

    var view: UIView!

    @IBInspectable var title: String? {
        get {
            return xibLabel.text
        }
        set {
            xibLabel.text = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        xibSetup()
    }

    func xibSetup() {
        view = loadViewFromNib()

        view.frame = bounds

        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]

        addSubview(view)

        xibLabel.textColor = UIColor.blueColor()
    }

    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "XibView", bundle: bundle)

        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        return view
    }


}
