import Resolver
import XCTest
@testable import FlickrSwiftUI

class CapturePhotoServiceTests: XCTestCase {
  @LazyInjected var networkService: MockNetworkService
	var sut: CapturePhotoService?

	override func setUp() {
		super.setUp()

		sut = CapturePhotoService()
    Resolver.registerMockServices()
	}

	override func tearDown() {
		sut = nil

		super.tearDown()
	}
}

extension CapturePhotoServiceTests {
  func testFetchCaptureSuccessfully() {
    let photo = mockPhoto()
    networkService.result = .success(photoList())

    sut?.fetchCapture(query: "Albert") { photoList, error in
        XCTAssertEqual(photoList?.photos.photo.count, 1)
      XCTAssertEqual(photoList?.photos.photo.first, photo)
      XCTAssertNil(error)
    }
  }

  func testFetchCaptureFailure() {
    let networkError = AppError.network(description: "Something went wrong!")
    networkService.result = .failure(networkError)

    sut?.fetchCapture(query: "Albert") { photoList, error in
      XCTAssertEqual(networkError, error)
      XCTAssertNil(photoList)
    }
  }
}

extension CapturePhotoServiceTests {
	private func mockPhoto() -> Photo {
		Photo(
            id: "String",
            owner: "String",
            secret: "String",
            server: "String",
            farm: 32,
            title: "String",
            ispublic: 0,
            isfriend: 1,
            isfamily: 1)
	}

  private func photoList() -> Data {
    let photo = mockPhoto()
    let photoListData = try? JSONEncoder().encode(Photos(from: [photo] as! Decoder))
    return photoListData ?? Data()
  }
}
