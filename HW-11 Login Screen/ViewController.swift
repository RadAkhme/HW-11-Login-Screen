//
//  ViewController.swift
//  HW-11 Login Screen
//
//  Created by Радик Ахметзянов on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
          let image = UIImage(named: "bg2")
          let imageView = UIImageView(image: image)
          imageView.contentMode = .scaleAspectFill
          imageView.translatesAutoresizingMaskIntoConstraints = false
        
          return imageView
      }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .white
        loginTextField.placeholder = "login"
        loginTextField.textAlignment = .center
        loginTextField.layer.cornerRadius = 20
        loginTextField.setLeftIcon(UIImage(systemName: "person")!)
        loginTextField.setRightIcon(UIImage(systemName: "checkmark.circle.fill")!, .green)
        
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .white
        passwordTextField.placeholder = "password"
        passwordTextField.textAlignment = .center
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.setLeftIcon(UIImage(systemName: "lock")!)
        passwordTextField.setRightIcon(UIImage(systemName: "eye")!, .lightGray)
        
        return passwordTextField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor(named: "bgColor")
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        
        return button
    }()
    
    private lazy var passwordQuestionButton: UIButton = {
        let passwordQuestionButton = UIButton()
        passwordQuestionButton.setTitle("Forgot your password?", for: .normal)
        passwordQuestionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        passwordQuestionButton.addTarget(self, action: #selector(passwordQuestionButtonPressed), for: .touchUpInside)
        passwordQuestionButton.translatesAutoresizingMaskIntoConstraints = true
        
        return passwordQuestionButton
    }()
    
    private lazy var horizontalLine: UIView = {
        let horizontalLine = UIView()
        horizontalLine.backgroundColor = .lightGray
        horizontalLine.layer.cornerRadius = 10
        horizontalLine.translatesAutoresizingMaskIntoConstraints = false
        
        return horizontalLine
    }()
    
    private lazy var horizontalLine2: UIView = {
        let horizontalLine2 = UIView()
        horizontalLine2.backgroundColor = .lightGray
        horizontalLine2.layer.cornerRadius = 10
        horizontalLine2.translatesAutoresizingMaskIntoConstraints = false
        
        return horizontalLine2
    }()
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "or connect with"
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        return textLabel
    }()
    
    private lazy var facebookButton: UIButton = {
        let facebookButton = UIButton()
        facebookButton.backgroundColor = UIColor(named: "facebook")
        facebookButton.setTitle("Facebook", for: .normal)
        facebookButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        facebookButton.setImage(UIImage(named: "facebook"), for: .normal)
        facebookButton.imageEdgeInsets.left = -30
        facebookButton.contentEdgeInsets.top = 3
        facebookButton.contentEdgeInsets.bottom = 3
        facebookButton.layer.cornerRadius = 18
        facebookButton.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
        facebookButton.translatesAutoresizingMaskIntoConstraints = false

        return facebookButton
    }()
    
    private lazy var twitterButton: UIButton = {
        let twitterButton = UIButton()
        twitterButton.backgroundColor = UIColor(named: "twitter")
        twitterButton.setTitle("Twitter", for: .normal)
        twitterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        twitterButton.setImage(UIImage(named: "twitter"), for: .normal)
        twitterButton.imageEdgeInsets.left = -30
        twitterButton.contentEdgeInsets.top = 3
        twitterButton.contentEdgeInsets.bottom = 3
        twitterButton.layer.cornerRadius = 18
        twitterButton.addTarget(self, action: #selector(twitterButtonPressed), for: .touchUpInside)
        twitterButton.translatesAutoresizingMaskIntoConstraints = false

        return twitterButton
    }()
    
    private lazy var stack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var accoundQuestionLabel: UILabel = {
        let accoundQuestionLabel = UILabel()
        accoundQuestionLabel.text = "Dont have account?"
        accoundQuestionLabel.textColor = .white
        accoundQuestionLabel.font = .boldSystemFont(ofSize: 14)
        accoundQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return accoundQuestionLabel
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        signUpButton.setTitleColor(UIColor(named: "signUp"), for: .normal)
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        signUpButton.translatesAutoresizingMaskIntoConstraints = true
        
        return signUpButton
    }()
    
    private lazy var footerStack: UIStackView = {
        let footerStack = UIStackView()
        footerStack.axis = .horizontal
        footerStack.distribution = .fill
        footerStack.spacing = 15
        footerStack.alignment = .center
        footerStack.translatesAutoresizingMaskIntoConstraints = false
        
        return footerStack
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupHierarchy()
            setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(label)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(button)
        view.addSubview(passwordQuestionButton)
        view.addSubview(horizontalLine)
        view.addSubview(horizontalLine2)
        view.addSubview(textLabel)
        view.addSubview(facebookButton)
        view.addSubview(twitterButton)
        view.addSubview(stack)
        stack.addArrangedSubview(facebookButton)
        stack.addArrangedSubview(twitterButton)
        view.addSubview(footerStack)
        footerStack.addArrangedSubview(accoundQuestionLabel)
        footerStack.addArrangedSubview(signUpButton)

       }
    
    private func setupLayout() {
        
    }

    // MARK: - Actions

    @objc private func buttonPressed() {
    
    }
    
    @objc private func passwordQuestionButtonPressed() {
        
    }
    
    @objc private func facebookButtonPressed() {
    
    }
    
    @objc private func twitterButtonPressed() {
    
    }
    
    @objc private func signUpButtonPressed() {
    
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 20, y: 6, width: 20, height: 18))
        iconView.image = image
        iconView.tintColor = .lightGray
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UITextField {
    func setRightIcon(_ image: UIImage,_ theTintColor: UIColor) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 6, width: 20, height: 18))
        iconView.image = image
        iconView.tintColor = theTintColor
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
