//
//  ViewController.swift
//  EasyRxExample
//
//  Created by Patrick Bellot on 12/29/16.
//  Copyright © 2016 Bell OS, LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  // MARK: Outlets
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var button: UIButton!
    
  // MARK: ivars
  private var count = 0
  private let disposeBag = DisposeBag()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.button.rx.tap
        .debug("button tap")
        .subscribe(onNext: { [unowned self] _ in
          self.count += 1
          self.label.text = "You have tapped that button \(self.count) times."
        }).addDisposableTo(disposeBag)
  }

 }

