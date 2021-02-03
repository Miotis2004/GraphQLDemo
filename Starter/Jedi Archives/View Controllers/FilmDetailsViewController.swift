

import UIKit

class FilmDetailsViewController: UITableViewController {
    private let film: AllFilmsQuery.Data.AllFilm.Film

  required init?(coder: NSCoder) {
    fatalError("init(coder:) is not implemented")
  }


    init?(film: AllFilmsQuery.Data.AllFilm.Film, coder: NSCoder) {
    self.film = film

    super.init(coder: coder)
  }

  @IBSegueAction func showCharacterDetails(_ coder: NSCoder, sender: Any?) -> CharacterDetailsViewController? {
    return nil
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = film.title
  }
}

extension FilmDetailsViewController {
  override func numberOfSections(in tableView: UITableView) -> Int {
    return film.characterConnection?.characters?.count ?? 0
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      // swiftlint:disable:next force_unwrapping
      let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell")!

        if indexPath.row == 0 {
          cell.textLabel?.text = "Episode"
          if let episodeNumber = film.episodeId {
            cell.detailTextLabel?.text = "\(episodeNumber)"
          }
        } else if indexPath.row == 1 {
          cell.textLabel?.text = "Released"
          cell.detailTextLabel?.text = film.releaseDate
        } else if indexPath.row == 2 {
          cell.textLabel?.text = "Director"
          cell.detailTextLabel?.text = film.director
        }
        
      return cell
    }
    // swiftlint:disable:next force_unwrapping
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell")!
    cell.textLabel?.text = film.characterConnection?.characters?[indexPath.row]?.name
    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 3
    }
    return 0
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return section == 0 ? "Info" : "Characters"
  }
}
