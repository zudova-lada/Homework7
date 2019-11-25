//
//  Interactor.swift
//  Task 7
//
//  Created by Лада on 31/10/2019.
//  Copyright © 2019 Лада. All rights reserved.
//

import UIKit

class Interactor: InteractorInput {

    var presenter: InteractorOutput!
    
    var picture: UIImage? = UIImage(named: "Mail") ?? nil
    
    func loadPicture() {
        switch picture {
        case nil:
            self.presenter.badResultFromInteractor(error: "Отсутствует картинка")
        default:
            self.presenter.dataFromInteractor(picture: picture!)
        }
    }
    
    func downloadPictureFromURL(urlString: String) {
        
        downloadImage { image, error in
            DispatchQueue.main.async {
                self.picture = image
            }
        }
    }
    
    func downloadImage(completion: @escaping (UIImage?, Error?) -> Void) {
        guard let url = URL(string:"http://icons.iconarchive.com/icons/dtafalonso/ios8/512/Calendar-icon.png")
            else {
                self.presenter.badResultFromInteractor(error: "Не удается получить URL")
                return
            }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let currentError = error {
                completion(nil, currentError)
                self.presenter.badResultFromInteractor(error: "Ошибка при загрузке изображения")
                return
            }
            
            guard let currentData = data
                else {
                    self.presenter.badResultFromInteractor(error: "Не удается получить данные")
                    return
                }
            
            let image = UIImage(data: currentData)
            completion(image, nil)
        }
        
        task.resume()
    }
    
    func deletePicture() {
        picture = nil
        self.presenter.dataFromInteractor(picture: nil)
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
