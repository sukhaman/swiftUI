//
//  NetworkStatus.swift
//  ListView
//
//  Created by Sukhaman Singh on 10/16/24.
//

import Foundation

enum NetworkStatus<T> {
    case idle
    case loading
    case loaded(T)
    case error(String)
}
