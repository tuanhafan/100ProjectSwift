//
//  MainView.swift
//  Movies
//
//  Created by AlexTran on 23/02/2025.
//

import UIKit

class MainView: UIView {
    var slider : Slider!
    var moviesView : Movies!
    override init(frame: CGRect) {
        super.init(frame:frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
   
}
