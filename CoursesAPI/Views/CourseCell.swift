//
//  CourseCell.swift
//  CoursesAPI
//
//  Created by MikhaiL on 15.05.2023.
//

import UIKit

final class CourseCell: UITableViewCell {
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLesson: UILabel!
    @IBOutlet var numberOfTest: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLesson.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTest.text = "Number of tests: \(course.numberOfTests)"
    }
}
