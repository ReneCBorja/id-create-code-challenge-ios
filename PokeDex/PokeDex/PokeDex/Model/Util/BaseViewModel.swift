//
//  BaseViewModel.swift
//  RmgoApp
//
//  Created by Kevin Pleitez on 6/12/21.
//

import Foundation
import Combine

class BaseViewModel: ObservableObject{
    var cancellableSet: Set<AnyCancellable> = []
    @Published var showLoading = false
    @Published var noDataFound = false 
}
