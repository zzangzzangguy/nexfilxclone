//
//  HomeViewController.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/01.
//

import UIKit

enum Sections: Int {
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcoming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectiontiles : [String] = ["Trending Movies","popular", "Trending Tv", "UP comming Moves ", "Top rated"]

    
    private let homefeedtable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homefeedtable)
        
        homefeedtable.delegate = self
        homefeedtable.dataSource = self
        
        configureNavbar()
        
        
        let headerview = heroHeaderUIview(frame:  CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        homefeedtable.tableHeaderView = headerview
        

    }
    
    private func configureNavbar() {
        var image = UIImage(named : "nexflixLogo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)

        ]
        
        
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homefeedtable.frame = view.bounds
    }
}




    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

        func numberOfSections(in tableView: UITableView) -> Int {
            return sectiontiles.count
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            guard let cell = tableView.dequeueReusableCell(withIdentifier:          CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else  {
                return UITableViewCell()
            }

            cell.delegate = self

            switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APIcaller.shared.getTrendingMovies { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TrendingTv.rawValue:
            APIcaller.shared.getTrendingTvs { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Popular.rawValue:
            APIcaller.shared.getpopular { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.Upcoming.rawValue:
            APIcaller.shared.getupcomingMovies { result in
                switch result {
                case .success(let titles):
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        case Sections.TopRated.rawValue:
            APIcaller.shared.getTopRated { result in
                switch result {
                case .success(let titles):
                    cell.configure(with: titles)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            default:
                return UITableViewCell()
        }

            return cell
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 200
        }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }

        func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            guard let header = view as? UITableViewHeaderFooterView else {return}
            header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
            header.textLabel?.textColor = .white
            header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
        }


        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sectiontiles[section]
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let defaultOffset = view.safeAreaInsets.top
            let offset = scrollView.contentOffset.y + defaultOffset

            navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))

        }
    }
    


extension HomeViewController: CollectionViewTableViewCellDelegate {
    func collectionViewTableViewCellDidTapCell(_ cell: CollectionViewTableViewCell, viewModel: TitlePreviewViewModel) {
        DispatchQueue.main.async { [weak self] in
            let vc = TitlePreviewViewController()
            vc.configure(with: viewModel)
            self?.navigationController?.pushViewController(vc, animated: true)
        }

    }
}

