import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    var mainVC: OrdersViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        let buttonsContainerView = UIStackView()
        buttonsContainerView.axis = .vertical
        
        buttonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsContainerView)
        buttonsContainerView.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
        }
        addAdminButton(buttonsContainerView: buttonsContainerView)
        addViewOnlyUserButton(buttonsContainerView: buttonsContainerView)

        navigationItem.backButtonTitle = Constants.sigOut
    }
    
    private func addAdminButton(buttonsContainerView: UIStackView){
        let adminLoginButton = UIButton(type: .system)
        adminLoginButton.translatesAutoresizingMaskIntoConstraints = false
        adminLoginButton.setTitle(Constants.loginAsAdmin, for: .normal)
        adminLoginButton.addTarget(self, action: #selector(loginAsAdmin), for: .touchUpInside)
        adminLoginButton.accessibilityLabel = Constants.adminButton
        buttonsContainerView.addArrangedSubview(adminLoginButton)
    }
    
    private func addViewOnlyUserButton(buttonsContainerView: UIStackView){
        let viewOnlyUserLoginButton = UIButton(type: .system)
        viewOnlyUserLoginButton.translatesAutoresizingMaskIntoConstraints = false
        viewOnlyUserLoginButton.setTitle(Constants.loginAsViewOnlyUser, for: .normal)
        viewOnlyUserLoginButton.addTarget(self, action: #selector(loginAsViewOnlyUser), for: .touchUpInside)
        viewOnlyUserLoginButton.accessibilityLabel = Constants.loginAsViewOnlyUser
        buttonsContainerView.addArrangedSubview(viewOnlyUserLoginButton)
    }
    
    
    @objc private func loginAsAdmin() {
        mainVC = OrdersViewController()
        (UIApplication.shared.delegate as! AppDelegate).selectedUserType = Constants.admin
        navigationController?.pushViewController(mainVC!, animated: true)
    }
    
    @objc private func loginAsViewOnlyUser() {
        mainVC = OrdersViewController()
        navigationController?.pushViewController(mainVC!, animated: true)
    }
}

