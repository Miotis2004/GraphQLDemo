
import UIKit

class CharacterDetailsViewController: UITableViewController {
  private let character: String

  required init?(coder: NSCoder) {
    fatalError("init(coder:) is not implemented")
  }

  init?(character: String, coder: NSCoder) {
    self.character = character

    super.init(coder: coder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension CharacterDetailsViewController {
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // swiftlint:disable:next force_unwrapping
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell")!

    if indexPath.row == 0 {
      cell.textLabel?.text = "Birth Year"
    } else if indexPath.row == 1 {
      cell.textLabel?.text = "Eye Color"
    } else if indexPath.row == 2 {
      cell.textLabel?.text = "Hair Color"
    } else if indexPath.row == 3 {
      cell.textLabel?.text = "Home Planet"
    }

    return cell
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Info"
  }
}
