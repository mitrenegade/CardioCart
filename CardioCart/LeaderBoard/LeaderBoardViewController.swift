import UIKit

internal final class LeaderBoardViewController: UIViewController {

    private let viewModel: LeaderBoardViewModel

    private static let CellReuseIdentifier = "LeaderBoardCell"

    private let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.bounces = false

        view.register(UITableViewCell.self, forCellReuseIdentifier: CellReuseIdentifier)
        return view
    }()

    init(viewModel: LeaderBoardViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    // MARK: - Private Functions
    private func setupViews() {
        tableView.backgroundColor = .yellow
        tableView.dataSource = self

        view.addSubview(tableView)

        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}

extension LeaderBoardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeaderBoardViewController.CellReuseIdentifier, for: indexPath) 

        do {
            let place = try viewModel.place(at: indexPath.row)
            let title = try viewModel.title(at: indexPath.row)
            let steps = try viewModel.steps(at: indexPath.row)
            cell.textLabel?.text = "\(place) - \(title): \(steps)"
        } catch let error {
            print("LeaderBoard cell error \(error) at row \(indexPath)")
            cell.textLabel?.text = nil
        }
        return cell
    }

}

