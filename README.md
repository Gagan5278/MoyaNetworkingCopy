# MoyaNetworkingCopy
Moya Network layer building using Combine iOS Swift
An example of how to build a network layer using Combine, with a structure similar to Moya.

## NOTE: A complete example is available. Please download and run the sample app.

### Usage

To use the generic API client, you’ll need to define an implementation of the APIEndpoint protocol that represents the endpoint you want to use

```
enum  PostEndpoint: APIEndpoint {
    case getAllPost
    case getPost(id: Int)
    case anotherCase1
    case anotherCase2(String name, String email)

    var baseURL: URL? {
        return  // Set your base URL here
    }
    
    var path: String {
        switch self {
        case .getAllPost:
            return "/posts"
        case .getPost(let id):
            return "/posts/\(id)"
        case .anotherCase1:
             return "somePath"
        case .anotherCase2:
              return "somePath
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllPost, .getPost:
            return .get
        case .anotherCase1:
            return .put
       case .anotherCase2:
            return .post
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .anotherCase2:
            return ["Content-Type": "application/json"]
        default:
            return nil
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .anotherCase2(let name, let email):
            return ["name": name, "email": email]
        default:
            return nil
        }
    }
}
```

How to use in your view model or at your desired place
```
let apiClient = URLSessionAPIClient<PostEndPoint>()
apiClient.request(PostEndPoint.getAllPost)
    .sink(
        receiveCompletion: { completion in
            // Handle errors in failure block
        },
        receiveValue: { users in
            // Handle posts
        }
    )
    .store(in: &cancellables)
```
## NOTE: A complete example is available. Please download and run the app.
