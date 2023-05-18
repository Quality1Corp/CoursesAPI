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
    
    let networkManager = NetworkManager.shared
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLesson.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTest.text = "Number of tests: \(course.numberOfTests)"
        
        networkManager.fetchData(from: course.imageUrl) { [weak self] result in
            switch result {
                case .success(let imageData):
                    self?.courseImage.image = UIImage(data: imageData)
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
}
