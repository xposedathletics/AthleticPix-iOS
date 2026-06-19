import Foundation
import Combine
 
// ── AthleteStore — loads from Base44 / Comeback Season backend ────────────────
class AthleteStore: ObservableObject {
    @Published var athletes: [Athlete] = []
    @Published var parents:  [Parent]  = []
    @Published var logs:     [TrainingLog] = []
    @Published var loading:  Bool = false
    @Published var selected: Athlete? = nil
 
    private let base44AppID = "69ded3c1e03c8b3a272c497a"
    private var base: String { "https://app.base44.com/api/apps/\(base44AppID)/entities" }
 
    func loadAll() {
        loading = true
        // Fetch athletes from Comeback Season APAthlete entity
        fetchEntities(path:"APAthlete") { [weak self] (result:[Athlete]) in
            DispatchQueue.main.async { self?.athletes = result }
        }
        fetchEntities(path:"APParent") { [weak self] (result:[Parent]) in
            DispatchQueue.main.async { self?.parents = result }
        }
        fetchEntities(path:"APTrainingLog") { [weak self] (result:[TrainingLog]) in
            DispatchQueue.main.async { self?.logs = result; self?.loading = false }
        }
    }
 
    func saveAthlete(_ athlete: Athlete) {
        if let data = try? JSONEncoder().encode(athlete) {
            var req = URLRequest(url:URL(string:"\(base)/APAthlete")!)
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField:"Content-Type")
            req.httpBody = data
            URLSession.shared.dataTask(with:req) { [weak self] data,_,_ in
                if let data, let saved = try? JSONDecoder().decode(Athlete.self, from:data) {
                    DispatchQueue.main.async { self?.athletes.insert(saved, at:0) }
                }
            }.resume()
        }
    }
 
    func saveTrainingLog(_ log: TrainingLog) {
        if let data = try? JSONEncoder().encode(log) {
            var req = URLRequest(url:URL(string:"\(base)/APTrainingLog")!)
            req.httpMethod = "POST"
            req.setValue("application/json", forHTTPHeaderField:"Content-Type")
            req.httpBody = data
            URLSession.shared.dataTask(with:req) { _,_,_ in }.resume()
        }
    }
 
    private func fetchEntities<T:Decodable>(path:String, completion:@escaping([T])->Void) {
        guard let url = URL(string:"\(base)/\(path)?sort=-created_date&limit=100") else { return }
        URLSession.shared.dataTask(with:url) { data,_,_ in
            if let data, let items = try? JSONDecoder().decode([T].self, from:data) {
                completion(items)
            } else {
                completion([])
            }
        }.resume()
    }
}
