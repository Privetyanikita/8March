//
//  ViewController.swift
//  8March
//
//  Created by NikitaKorniuk   on 07.03.2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("Жмяк сюдой", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let textEnodjLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 35)
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        imageView.image = UIImage(named: "photoSmile")
        return imageView
    }()
    
    private let textLabel:UILabel = {
       let element = UILabel()
        element.text = "C 8 Марта!"
        element.backgroundColor = .clear
        element.textAlignment = .center
        element.font = UIFont(name: "Lobster-Regular", size: 40)
        element.textColor = .label
        element.numberOfLines = 1
        element.isHidden = true
        return element
    }()

//MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        addTargetForButton()
    }

    private func addSubviews() {
        view.addSubview(button)
        view.addSubview(textEnodjLabel)
        view.addSubview(imageView)
        view.addSubview(textLabel)
    }
    
    private func addTargetForButton(){
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        button.isHidden = true
        textForLabel()
    }
    
    private func textForLabel() {
        imageView.alpha = 0
        for i in 0...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                self.textEnodjLabel.text! += "🌹"
                if i == 100 {
                    self.imageView.isHidden = false
                    self.upadteConstraint()
                    UIView.animate(withDuration: 1.0) {
                        self.imageView.alpha = 1
                    }
                    self.stupTextLabel()
                }
            }
        }
    }
    
    private func setupConstraints() {
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(150)
        }
        
        textEnodjLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(textEnodjLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func upadteConstraint(){
        imageView.snp.updateConstraints { make in
            make.top.equalTo(textEnodjLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func stupTextLabel(){
        textLabel.isHidden = false
        textLabel.transform = CGAffineTransform(translationX: -view.bounds.width, y: 0)
        
        textLabel.snp.makeConstraints { make in
            make.center.equalTo(imageView)
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            self.textLabel.transform = .identity
        })
    }

}

