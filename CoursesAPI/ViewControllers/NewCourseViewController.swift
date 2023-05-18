//
//  NewCourseViewController.swift
//  CoursesAPI
//
//  Created by MikhaiL on 15.05.2023.
//

import UIKit

final class NewCourseViewController: UIViewController {
    
    @IBOutlet var courseTitleTF: UITextField!
    @IBOutlet var numberOfLessonsTF: UITextField!
    @IBOutlet var numberOfTestsTF: UITextField!
    
    weak var delegate: NewCourseViewControllerDelegate?
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let course = Course(
            name: courseTitleTF.text ?? "No name",
            imageUrl: Link.courseImageURL.url.absoluteString,
            numberOfLessons: Int(numberOfLessonsTF.text ?? "") ?? 0,
            numberOfTests: Int(numberOfTestsTF.text ?? "") ?? 0
        )
        delegate?.sendPostRequest(with: course)
        dismiss(animated: true)
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
