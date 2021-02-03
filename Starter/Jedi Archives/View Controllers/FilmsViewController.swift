

import UIKit

class FilmsViewController: UITableViewController {
    var films: [AllFilmsQuery.Data.AllFilm.Film] = []

  @IBSegueAction func showFilmDetails(_ coder: NSCoder, sender: Any?) -> FilmDetailsViewController? {
    guard
      let cell = sender as? UITableViewCell,
      let indexPath = tableView.indexPath(for: cell)
      else {
        return nil
    }
    return FilmDetailsViewController(film: films[indexPath.row], coder: coder)

  }

  override func viewDidLoad() {
    super.viewDidLoad()

    loadData()
  }
}

extension FilmsViewController {
  func loadData() {
    let query = AllFilmsQuery()
    
    Apollo.shared.client.fetch(query: query) { result in
        switch result {
        case .success(let graphQLResult):
            if let films = graphQLResult.data?.allFilms?.films?.compactMap({ $0 }) {
                self.films = films
                self.tableView.reloadData()
            }
        case .failure(let error):
            print("Error loading data \(error)")
        }
    }
  }
}

extension FilmsViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable:next force_unwrapping
    let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell")!
    let film = films[indexPath.row]
    cell.textLabel?.text = film.title
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return films.count
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Films"
  }
}
