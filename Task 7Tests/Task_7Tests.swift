//
//  Task_7Tests.swift
//  Task 7Tests
//
//  Created by Лада on 25/11/2019.
//  Copyright © 2019 Лада. All rights reserved.
//
//
import XCTest
import UIKit

@testable import Task_7
class InteractorToView_mock: ViewInput {
    var imageNil = false
    var errorMessage = String()
    
    func updateLabel(picture: UIImage?) {
        if picture != nil {
            imageNil = true
        } else {
            imageNil = false
        }
    }
    
    func errorMessage(error: String) {
        errorMessage = error
    }
    
    
}

class PresenterFromInteractor_mock: InteractorOutput {
    
    var imageBool = false
    var badResult = ""
    
    func dataFromInteractor(picture: UIImage?) {
        if picture != nil {
            imageBool = true
        }
    }
    
    func badResultFromInteractor(error: String) {
        badResult = error
    }
    
    
}

class PresenterFromInteractorNillPicture_mock: InteractorOutput {
    
    func dataFromInteractor(picture: UIImage?) {
        
    }
    
    func badResultFromInteractor(error: String) {
        
    }
    
    
}

class Task_7Tests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_WhenSetNilImage_ViewImageChangeToNil() {
        // arrange
        let viewController = ViewController()
        
        // act
        viewController.updateLabel(picture: nil)
        
        // assert
        XCTAssertNil(viewController.currentImageView.image, "Not nil")
    }
    
    func test_WhenSetImage_ViewImageNotNil() {
        // arrange
        let viewController = ViewController()
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "Mail", in: bundle, compatibleWith: nil)
        
        // act
        viewController.updateLabel(picture: image)
        
        // assert
        XCTAssert((viewController.currentImageView.image != nil) , "Nil")
    }
    
    func test_WhenSetImage_PresenterSetImageNotNil() {
        // arrange
        let presenter = Presenter()
        let MOCKView = InteractorToView_mock()
        presenter.view = MOCKView
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "Mail", in: bundle, compatibleWith: nil)
        // act
        presenter.dataFromInteractor(picture: image)
        
        // assert
        
        XCTAssert(MOCKView.imageNil, "It's nil")
    }
    
    func test_WhenPresentGetResult_PresenterSetResultView() {
        // arrange
        let presenter = Presenter()
        let MOCKView = InteractorToView_mock()
        presenter.view = MOCKView
        let message = "Test result"
        
        // act
        presenter.badResultFromInteractor(error: message)
        
        // assert
        XCTAssert((MOCKView.errorMessage == message), "Ошибка в отправке сообщения")
    }
    
    func test_WhenImageInteractorSet_PresenterGetImage(){
        // arrange
        let interactor = Interactor()
        let MOCKPresenter = PresenterFromInteractor_mock()
        interactor.presenter = MOCKPresenter
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "Mail", in: bundle, compatibleWith: nil)
        interactor.picture = image
        
        // act
        interactor.loadPicture()
        // assert

        XCTAssert(MOCKPresenter.imageBool, "Not equal")
    }
    
    func test_WhenInteractorSetNil_PresenterGetMessage() {
        // arrange
        let interactor = Interactor()
        let MOCKPresenter = PresenterFromInteractor_mock()
        interactor.presenter = MOCKPresenter
        interactor.picture = nil
        
        // act
        interactor.loadPicture()
        // assert
        XCTAssert((MOCKPresenter.badResult != ""), "Not message")
    }
    
    func test_WhenInteractorDeletePicture_PictureIsNil() {
        // arrange
        let interactor = Interactor()
        let MOCKPresenter = PresenterFromInteractorNillPicture_mock()
        interactor.presenter = MOCKPresenter
        let bundle = Bundle(for: type(of: self))
        let image = UIImage(named: "Mail", in: bundle, compatibleWith: nil)
        interactor.picture = image
        
        // act
        interactor.deletePicture()
        // assert
        XCTAssertNil(interactor.picture, "Удаление не произошло")
    }
}


// arrange
// act
// assert
