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
  private let disposeBag = DisposeBag()
	private lazy var presenter: Presenter = {
		let eventProvider = EventProvider(buttonTapped: self.button.rx.tap.asObservable())
		return Presenter(eventProvider: eventProvider)
	}()
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
		self.presenter.count
			.asDriver(onErrorJustReturn: 0)
			.map { currentCount in
				return "You have tapped that button \(currentCount) times."
			}
			.drive(self.label.rx.text)
			.addDisposableTo(disposeBag)
  }

 }

