//
//  ViewController.swift
//  MyScrollView
//
//  Created by Justinus Andjarwirawan on 3/16/16.
//  Copyright © 2016 Petra Christian University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView!
    var scrollView: UIScrollView!
    var gambar = UIImage(named: "nature")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(image: self.gambar)
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView) // penting!
        view.addSubview(scrollView)
    }


}

