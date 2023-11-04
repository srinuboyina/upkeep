import UIKit
import Dispatch


// Followed MVVM Design pattern
final class OrdersViewController: UIViewController {
    
    var viewModel: OrdersViewModelProtocol?
    private var tableView: UITableView!
    
    init(viewModel: OrdersViewModelProtocol = OrdersViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        setupUI()
    }
    
    // setup the UI in seperate method
    private func setupUI() {
        if (UIApplication.shared.delegate as! AppDelegate).selectedUserType == nil {
            view.backgroundColor = .green
            navigationItem.title = Constants.viewOnlyUser
        } else if (UIApplication.shared.delegate as! AppDelegate).selectedUserType == Constants.admin {
            view.backgroundColor = .blue
            navigationItem.title = Constants.admin
        }
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(fetchButtonPressed))
        navigationItem.rightBarButtonItem = rightBarButton
        
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        self.tableView = tableView
        self.tableView.accessibilityLabel = Constants.ordersTable
    }
    
    @objc func fetchButtonPressed() {
        viewModel?.fetchOrders()
    }
}

// MARK: Tableview methods
extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.getOrder(indexPath: indexPath)?.title
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let orderViewModel = viewModel?.getOrder(indexPath: indexPath) {
            let orderDetailsVC = OrderDetailsViewController(viewModel: orderViewModel)
            self.navigationController?.pushViewController(orderDetailsVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: OrdersViewDelegate methods
extension OrdersViewController: OrdersViewDelegate {
    func dataFetched() {
        self.tableView.reloadData()
    }
    
    func startLoader() {
        self.view.showBlurLoader()
    }
    
    func stopLoader() {
        self.view.removeBluerLoader()
    }
    
    func showError() {
        let alert = UIAlertController(title: Constants.error, message: Constants.serverError, preferredStyle: .alert)
        let action = UIAlertAction(title: Constants.ok, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}
