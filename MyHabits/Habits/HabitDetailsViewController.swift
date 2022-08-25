//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Konstantin Bolgar-Danchenko on 16.08.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {

    // MARK: - DATA
    
    var habit = Habit(name: "Выпить стакан воды перед завтраком", date: Date(), color: .systemRed)
    
    private lazy var habitDates: [Date] = {
        HabitsStore.shared.dates.reversed()
    }()
    
    // MARK: - SUBVIEWS
    
    private lazy var habitTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(
            HabitDetailViewCell.self,
            forCellReuseIdentifier: HabitDetailViewCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.doesRelativeDateFormatting = true
        return formatter
    }()
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = false
        
        setupView()
        setupSubview()
        setupConstraints()
    }
    
    private func setupView() {
        navigationController?.navigationBar.tintColor = Styles.purpleColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Править",
            style: .done,
            target: self,
            action: #selector(editButtonPressed)
        )
        navigationItem.title = habit.name
    }
    
    private func setupSubview() {
        view.addSubview(habitTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            habitTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            habitTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            habitTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - ACTIONS
    
    @objc func editButtonPressed(_ sender: Any) {
        let viewController = AddHabitController()
        viewController.habit = habit
        viewController.addHabitType = .edit(removeAction: { [weak self] in
            self?.navigationController?.popToRootViewController(animated: true)
        })
        viewController.nameTextField.text = habit.name
        viewController.colorPickerView.backgroundColor = habit.color
        viewController.datePicker.date = habit.date
        viewController.nameTextField.textColor = habit.color
//        viewController.habitDetailsViewCallback = self
        present(viewController, animated: true, completion: nil)
    }
}

// MARK: - EXTENSIONS

extension HabitDetailsViewController: UITableViewDelegate {
    //empty
}

extension HabitDetailsViewController: UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return habitDates.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HabitDetailViewCell.reuseID,
            for: indexPath
        ) as! HabitDetailViewCell
        
        cell.textLabel?.text = dateFormatter.string(from: habitDates[indexPath.row])
        if HabitsStore.shared.habit(
            habit,
            isTrackedIn: habitDates[indexPath.row]
        ) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
        ) -> String? {
        return "АКТИВНОСТЬ"
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
        ) {
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
    }
}
