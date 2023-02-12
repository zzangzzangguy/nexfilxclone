//
//  heroHeaderUIview.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/01.
//

import UIKit

class heroHeaderUIview: UIView {
    
    private let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let playbutton: UIButton = {
        
        let button = UIButton()
        button.setTitle("play", for: .normal)
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    
    private let heroimageview: UIImageView = {
        
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "best of")
        return imageview
    }()
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroimageview)
        addGradient()
        addSubview(playbutton)
        addSubview(downloadButton)
        applyconstraints()
        
        
    }
    
    private func applyconstraints () {
        
        let playButtonconstraints = [
            playbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playbutton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
            ]
            
        NSLayoutConstraint.activate(playButtonconstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroimageview.frame = bounds
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }

}
