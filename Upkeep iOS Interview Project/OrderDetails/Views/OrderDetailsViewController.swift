//
//  OrderDetailsViewController.swift
//  Upkeep iOS Interview Project
//
//  Created by apple on 28/10/23.
//

import UIKit

final class OrderDetailsViewController: UIViewController {
    
    private let viewModel: OrderViewModelProtocol
    
    init(viewModel: OrderViewModelProtocol){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @UseAutoLayout private var orderTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    @UseAutoLayout private var orderDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()

    
   private lazy var oderStackView: UIStackView = {
        let detailStack = UIStackView(arrangedSubviews: [orderTitleLabel, orderDescriptionLabel])
        detailStack.backgroundColor = .white
        detailStack.alignment = .fill
        detailStack.distribution = .fillProportionally
        detailStack.axis = .vertical
        detailStack.spacing = 0
        detailStack.translatesAutoresizingMaskIntoConstraints = false
        detailStack.layoutMargins = UIEdgeInsets(top: 0, left: 18, bottom: 10, right: 18)
        detailStack.isLayoutMarginsRelativeArrangement = true
        return detailStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.title = Constants.orderDetails
        self.view.accessibilityLabel = Constants.orderDetails
        self.view.backgroundColor = .white
        self.view.addSubview(oderStackView)
        NSLayoutConstraint.activate([
            oderStackView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
        
        self.orderTitleLabel.text = viewModel.title
        self.orderDescriptionLabel.text = viewModel.description
    }

}
