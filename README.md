# HJLogin-Facebook

## Example

FacebookLoginTest - ViewController를 통해 설정 예시를 확인해볼 수 있습니다.

## Requirements
파일을 내려받기 전, FBSDKLoginKit를 podfile을 통해 설치해주시고 페이스북 로그인 기본 설정을 모두 마쳐주세요.

## Installation

Facebook.swift, FacebookModel.swift 두 파일을 복사하셔서 해당 프로젝트에 붙여넣으시면 됩니다.  
(이때 copy items if needed에 꼭 체크해주세요.)

getUserInfo( ) 를 통해 FacebookModel를 parameter로 받아와 사용할 수 있습니다.
```ruby
LoginManager().logIn(permissions: ["email" , "public_profile"], from: self) {
    (result, err) in
    if err != nil {
        print("Custom FB Login Failed", err ?? "")
        return
    }
    if result != nil {
        let facebook = Facebook()
        facebook.getFacebookInfo(imageSize: CGSize(width: 100, height: 100)) { (info) in
            print(info.id)
            print(info.name)
            print(info.profile_image_url)
        }
    }
}
```

## Author

HJKim95, 25ephipany@naver.com

## License

HJLogin-FACEBOOK is available under the MIT license. See the LICENSE file for more info.
