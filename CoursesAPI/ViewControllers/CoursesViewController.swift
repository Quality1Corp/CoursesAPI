//
//  CoursesViewController.swift
//  CoursesAPI
//
//  Created by MikhaiL on 14.05.2023.
//

import UIKit

protocol NewCourseViewControllerDelegate: AnyObject {
    func sendPostRequest(with data: Course)
}

final class CoursesViewController: UITableViewController {
    
    private var courses: [Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        fetchCourses()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController else { return }
        guard let newCourseVC = navigationVC.topViewController as? NewCourseViewController else { return }
        newCourseVC.delegate = self
    }
    
    private func fetchCourses() {
        // TODO: - fetch courses
    }
}

// MARK: - NewCourseViewControllerDelegate
extension CoursesViewController: NewCourseViewControllerDelegate {
    func sendPostRequest(with data: Course) {
        print(data)
    }
}

// MARK: - UITableViewDataSource
extension CoursesViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        courses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? CourseCell else { return UITableViewCell() }
        let course = courses[indexPath.row]
        cell.configure(with: course)
        return cell
    }
}
