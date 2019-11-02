//
//  Presenter.swift
//  Task 7
//
//  Created by Лада on 31/10/2019.
//  Copyright © 2019 Лада. All rights reserved.
//

import UIKit

class Presenter: ViewOutput, InteractorOutput {
    
    weak var view: ViewInput!
    var interactor:InteractorInput!
    
    func didTapDisplayButton() {
        self.interactor.loadPicture()
    }
    
    func didTapDownloadButton() {
        let url = "http://icons.iconarchive.com/icons/dtafalonso/ios8/512/Calendar-icon.png"
        self.interactor.downloadPictureFromURL(urlString: url)
    }
    
    func didTapClearButton() {
        interactor.deletePicture()
    }
    
    func dataFromInteractor(picture: UIImage?) {
        view.updateLabel(picture: picture)
    }
    
    func badResultFromInteractor(error: String) {
        view.errorMessage(error: error)
    }
    
}
