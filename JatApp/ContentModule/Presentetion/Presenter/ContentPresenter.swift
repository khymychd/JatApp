//
//  ContentPresenter.swift
//  JatApp
//
//  Created by Dima Khymych on 20.01.2021.
//

import Foundation



protocol ContentPresenterInput {
    var dataSource:[ContentViewModel]? {get}
    func viewIsReady()
}

protocol ContentPresenterOutput:class{
    func show()
}


final class ContentPresenter {
    weak var view:ContentPresenterOutput?
    let contentProvider:ContentProviderProtocol
    var dataSource:[ContentViewModel]?{
        didSet{
            view?.show()
        }
    }
    
   
    
    
    init(view:ContentPresenterOutput,contentProvider:ContentProviderProtocol) {
        self.contentProvider = contentProvider
        self.view = view 
    }
    
}

extension ContentPresenter:ContentPresenterInput {

    
    func viewIsReady() {
        DispatchQueue.global(qos: .userInteractive).async {
            self.contentProvider.getContent {[weak self] (dictionary) in
                DispatchQueue.main.async {
                    self?.dataSource = dictionary.map({ContentViewModel(char: String($0.key), count: "\($0.value)")})
                }
            }
        }
        
        

    }
    
    
}



