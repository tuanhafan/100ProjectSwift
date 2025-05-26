//
//  ZoomingViewController.swift
//  TixAura
//
//  Created by Alex Tran on 16/5/25.
//

import UIKit

protocol ZoomingViewController {
    func zoomingImageView(for trasiton: ZoomAnimator) -> UIImageView?
    func zoomingBackgroundView(for transition: ZoomAnimator) -> UIView?
}

