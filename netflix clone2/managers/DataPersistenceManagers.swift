//
//  DataPersistenceManagers.swift
//  netflix clone2
//
//  Created by 김기현 on 2023/02/22.
//
import Foundation
import UIKit
import CoreData

class DataPersistenceManagers {

    enum DatabaseError: Error {
        case failedToSaveData}

    static let shared = DataPersistenceManagers()

    func downloadTitleWith(model: Title, completion: @escaping (Result<Void,Error>) -> Void) {

        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }

        let context = appdelegate.persistentContainer.viewContext

        let item = TitleItem(context: context)

        item.original_title = model.original_title
        item.id = Int64(model.id)
        item.original_name = model.original_name
        item.overview = model.overview
        item.media_type = model.media_type
        item.poster_path = model.poster_path
        item.release_date = model.release_date
        item.vote_count = Int64(model.vote_count)
        item.vote_average = model.vote_average

        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(DatabaseError.failedToSaveData))
        }


        }

    }

