import UIKit

class ToDoItem {
    var text: String
    var dueDate: Date
    
    init(text: String, dueDate: Date) {
        self.text = text
        self.dueDate = dueDate
    }
}

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    var toDoItems: [ToDoItem] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {
        // Show an alert to allow the user to add a new To-Do item
        let alert = UIAlertController(title: "Add To-Do Item", message: "Enter the text for the new item and the due date:", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Item text"
        }
        
        alert.addTextField { (textField) in
            textField.placeholder = "Due date (mm/dd/yyyy)"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (action) in
            // Get the text and due date from the alert's text fields
            let textField = alert.textFields![0] as UITextField
            let text = textField.text ?? ""
            let dueDateTextField = alert.textFields![1] as UITextField
            let dueDateText = dueDateTextField.text ?? ""
            
            // Parse the due date from the string entered by the user
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "mm/dd/yyyy"
            let dueDate = dateFormatter.date(from: dueDateText)
            
            // Create a new To-Do item with the text and due date
            let toDoItem = ToDoItem(text: text, dueDate: dueDate ?? Date())
            self.toDoItems.append(toDoItem)
            
            // Reload the table view to show the new item
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func removeButtonTapped(_ sender: Any) {
        // Show an alert to allow the user to specify which item to remove
        let alert = UIAlertController(title: "Remove To-Do Item", message: "Enter the text of the item you want to remove:", preferredStyle: .alert)
        
        alert.addText
