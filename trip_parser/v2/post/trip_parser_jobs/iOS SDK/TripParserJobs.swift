import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Create base64 content from file
let jsonString: String = """
{
"data": {
"type": "trip-parser-job",
"content": "XXX"
}
}
"""
let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString!)

    amadeus.travel.tripParserJobs.post(body: body,
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
} catch _ as NSError {
    assertionFailure("JSON not valid")
}
