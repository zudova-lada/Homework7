//
//  ViewController.swift
//  Task 7
//
//  Created by Лада on 31/10/2019.
//  Copyright © 2019 Лада. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewInput {
    
    var presenter: ViewOutput!
    
    let displayButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        let sizes = UIScreen.main.bounds.size
        button.frame = CGRect(x: sizes.width/5, y: sizes.height/1.5, width: sizes.width/5*3, height: sizes.height/12)
        button.setTitle("Отобразить", for: .normal)
        button.addTarget(self, action: #selector(tapDisplayButton), for: .touchDown)
        return button
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        let sizes = UIScreen.main.bounds.size
        button.frame = CGRect(x: sizes.width/5, y: sizes.height/1.5 + sizes.height/10, width: sizes.width/5*3, height: sizes.height/12)
        button.setTitle("Скачать", for: .normal)
        button.addTarget(self, action: #selector(tapDownloadButton), for: .touchDown)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        let sizes = UIScreen.main.bounds.size
        button.frame = CGRect(x: sizes.width/5, y: sizes.height/1.5 + sizes.height/10 * 2, width: sizes.width/5*3, height: sizes.height/12)
        button.setTitle("Очистить кэш", for: .normal)
        button.addTarget(self, action: #selector(tapClearButton), for: .touchDown)
        return button
    }()
    
    var currentImageView: UIImageView = {
        let image = UIImageView()
        let sizes = UIScreen.main.bounds.size
        image.frame = CGRect(x: sizes.width/10, y: sizes.height/10, width: sizes.width/10*8, height: sizes.height/2)
        image.backgroundColor = UIColor.white
        image.alpha = 0.75
        return image
    }()
    
    var textLabel: UITextView = {
        let text = UITextView()
        let sizes = UIScreen.main.bounds.size
        text.frame = CGRect(x: sizes.width/10, y: sizes.height/3.5, width: sizes.width/10*8, height: sizes.height/10)
        text.alpha = 1
        text.text = "Необходимо загрузить картинку"
        text.backgroundColor = UIColor.clear
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        view.addSubview(displayButton)
        view.addSubview(downloadButton)
        view.addSubview(clearButton)
        view.addSubview(currentImageView)
        view.addSubview(textLabel)
    }

    func updateLabel(picture: UIImage?) {
        
        if (picture != nil) {
            textLabel.text = nil
            currentImageView.image = picture
        }
        else {
            textLabel.text = "Необходимо загрузить картинку"
            currentImageView.image = nil
        }
    }
    
    func errorMessage(error: String){
       let errorMessage = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        self.present(errorMessage, animated: true, completion: {
            self.perform(#selector(self.timeoutAler), with: errorMessage, afterDelay: 1.5)
        })
    }
    
    @objc func timeoutAler(_ alertController: UIAlertController) {
        alertController.dismiss(animated: true, completion: nil)
    }
    
    @objc func tapDisplayButton() {
        self.presenter.didTapDisplayButton()
        
    }

    @objc func tapDownloadButton() {
        self.presenter.didTapDownloadButton()
    }
    
    @objc func tapClearButton() {
       self.presenter.didTapClearButton()
    }
    
}
