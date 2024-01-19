//
//  CWButton.swift
//  Card Workout ProgrammaticUI
//
//  Created by Ilya Paddubny on 19.01.2024.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(color: UIColor, title: String, systemImageName: String = "") {
        super.init(frame: .zero)
        
        configuration = .tinted()
        configuration?.title = title
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.cornerStyle = .medium
        configuration?.image = UIImage(systemName: systemImageName)
        configuration?.imagePadding = 5
        
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    

}
