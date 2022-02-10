//
//  GenericAPIPresenterView.swift
//  News
//
//  Created by Akhilesh Kumar Singh on 08/02/22.
//

import Foundation

protocol GenericAPIPresenterView : AnyObject {
    func willLoadData()
    func didLoadData<T>( _ obj: T?)
    func didFailToLoadData<T>(_ message: T?)
}
