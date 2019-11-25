//
//  Protocols.swift
//  Task 7
//
//  Created by Лада on 31/10/2019.
//  Copyright © 2019 Лада. All rights reserved.
//

import UIKit

/// Отвечает за прием данных во ViewController из Presenter'а
protocol ViewInput: class {
    func updateLabel(picture: UIImage?)
    func errorMessage(error: String)
}

/// Отвечает за прием данных в Presenter из ViewController'а
protocol ViewOutput {
    func didTapDisplayButton()
    func didTapDownloadButton()
    func didTapClearButton()
}

/// Отвечает за прием данных в Interactor из Presenter'а
protocol InteractorInput {
    func loadPicture()
    func downloadPictureFromURL(urlString: String)
    func deletePicture()
}

/// Отвечает за прием данных в Presenter из Interactor'а
protocol InteractorOutput: class {
    func dataFromInteractor(picture: UIImage?)
    func badResultFromInteractor(error: String)
}
