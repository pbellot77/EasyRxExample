//
//  Presenter.swift
//  EasyRxExample
//
//  Created by Patrick Bellot on 12/30/16.
//  Copyright © 2016 Bell OS, LLC. All rights reserved.
//

import Foundation
import RxSwift

struct Presenter {
  let count: Observable<Int>
  
  init(eventProvider: EventProvider) {
    self.count =
      eventProvider.buttonTapped.scan(0) {
        (previousValue, _) in
          return previousValue + 1
    }
  }
}
