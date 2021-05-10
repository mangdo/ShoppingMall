# ShoppingMallProject
> Spring Framework를 사용한 쇼핑몰 웹 프로젝트입니다.   
> http://54.180.88.148:8080/ 로 접속하실 수 있습니다.

<br>

## 1. 제작 기간 & 참여 인원
+ 2020년 12월 20일 ~ 2021년 4월 6일
+ 2인 1조 팀 프로젝트

<br>

## 2. 사용기술

#### `Back-end`
+ Java 8
+ Spring Framework 5.0.2
+ Maven 2.5.1
+ MyBatis 3.4.1
+ MySQL
+ Spring Security 5.0.6

#### `Front-end`
+ JQuery 3.1.1
+ Bootstrap 템플릿 [Subas](https://wrapbootstrap.com/theme/subas-bootstrap-ecommerce-template-WB0473B2L)을 수정하여 사용

#### `deploy`
+ AWS EC2 (Amazon linux 2)
+ AWS RDS (MySQL)
+ AWS S3

<br>

## 3. ERD 설계

<img src="https://user-images.githubusercontent.com/70243735/117144749-45830180-aded-11eb-8570-53637ef14517.png">

<br>

## 4. 시연 영상

[![https://youtu.be/XGOT1Af8L8g](https://user-images.githubusercontent.com/70243735/117146354-17062600-adef-11eb-95ce-05c695929a52.png)](https://youtu.be/XGOT1Af8L8g)

<br>

## 5. 핵심 기능

### [ 회원 관리 ]

<img src="https://user-images.githubusercontent.com/70243735/117665271-9f187100-b1dd-11eb-992c-9ca70d3c7115.png" width="900px">

- [X] **회원가입** 
   <details>
    <summary> 회원가입 설명 펼치기:pushpin: </summary>
 
   <br>
  
   **[ 기능 설명 ]**   
   : 회원 가입을 할 수 있습니다.   
   : 로그인 이후, 회원 정보 수정을 할 수 있습니다.  

    **[ 상세 구조 ]**

    <img src = "https://user-images.githubusercontent.com/70243735/117245062-2039d600-ae75-11eb-9153-5fbaf3071337.png" width ="800px">

    + **[UserRegisterController](./PhoneMall/src/main/java/com/phonemall/controller/UserRegisterController.java)**

    + **UserService**   
     : UserService.java - [UserServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/UserServiceImpl.java)의 구조를 가집니다.

    + **UserMapper**   
     : [UserMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/ProductMapper.java) - [UserMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/UserMapper.xml)의 구조를 가집니다.

   </details>
  
 - [X] **로그인**

   <details>
   <summary> 로그인 설명 펼치기:pushpin: </summary>

   <br>
  
   **[ 기능 설명 ]**   
     : Spring Security를 사용하여 로그인을 할 수 있습니다.   
     : Spring Security Handler를 이용하여 로그인 성공, 실패, 접근제한을 처리합니다.
     
   **[ 상세 구조 ]**

   <img src ="https://user-images.githubusercontent.com/70243735/117665151-81e3a280-b1dd-11eb-9bb3-84df1ba3fb56.png" width ="800px">

     + **AuthenticaionProvider**    
       : 실제 인증 작업을 진행합니다. 사용자가 인증 요청한 정보와 DB의 사용자 정보가 일치하는지를 확인합니다.  

     + **PasswordEncoder**   
       : 패스워드를 암호화합니다.   
       : 암호화되지 않은 실제 패스워드를 저장하는 일은 위험하기 때문에 암호화된 패스워드로 저장하고, 사용자가 패스워드를 입력하면 이를 암호화해서 저장된 패스워드와 비교합니다.

     + **BCyptPasswordEncoder**   
       : PasswordEncoder구현한 클래스중 하나입니다. 해시 함수로 특정 문자열을 암호화하기 때문에 암호화를 한 후에, 다시 원문으로 돌리지 못합니다.

     + **CustomUserDetailsService**    
       : [CustomUserDetailsService](./PhoneMall/src/main/java/com/phonemall/security/CustomUserDetailsService.java)은 UserDetailsService를 구현하여 DB의 사용자 정보를 조회합니다.    
       : 유일한 메소드인 loadUserByUsername()는 UserDetails를 상속받아 만든 CustomUser를 반환합니다.   

     + **CustomUser**   
       : [CustomUser](./PhoneMall/src/main/java/com/phonemall/security/domain/CustomUser.java)는 조회한 사용자 정보를 담고있습니다.   
       : Spring Security에서 제공하고 있는 UserDetails를 구현한 여러 클래스 중에서 User클래스를 상속받았습니다.

     + **security-context.xml**   
      : [security-context.xml](./PhoneMall/src/main/webapp/WEB-INF/spring/security-context.xml)은 Spring Security와 관련된 설정을 담고 있습니다.   
      : AuthenticationSuccessHandler를 상속받아 [로그인 성공 로직](./PhoneMall/src/main/java/com/phonemall/security/CustomLoginSuccessHandler.java)을 처리합니다.   
      : AuthenticationFailureHandler를 상속받아 [로그인 실패 로직](./PhoneMall/src/main/java/com/phonemall/security/CustomLoginFailHandler.java )을 처리합니다. 로그인의 실패 원인을 알려줍니다.   
      : AccessDeniedHandler를 상속받아 권한이 없는 페이지에 대하여 [접근 제한 로직](./PhoneMall/src/main/java/com/phonemall/security/CustomAccessDeniedHandler.java)을 처리합니다.    
     + **MemberMapper**   
      : MemberMapper.java - [MemberMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/MemberMapper.xml)의 구조를 가집니다.

   </details>

---

### [ 상품 관리 ]   

<img src = "https://user-images.githubusercontent.com/70243735/117666648-0a167780-b1df-11eb-9a23-3f9f9b924b25.png" width ="900px">

- [X] **상품의 CRUD**
  <details>
   <summary> 상품 CRUD 설명 펼치기:pushpin: </summary>
   
   <br>
  
   **[ 기능 설명 ]**    
  : 상품은 메인 **이미지가 필수**이며, 서브 이미지도 등록할 수 있습니다.   
  : 관리자만이 게시물을 등록, 수정, 삭제할 수 있으며, 누구나 조회할 수 있습니다.   
  : 상품은 통신사, 브랜드, 가격대별로 **카테고리**를 지정하거나 **검색**을 통하여 조회할 수 있습니다.   
  : 상품은 **카카오톡 공유하기** 기능이 가능합니다. (kakao Javascript SDK이용)  
  
   **[ 상세 구조 ]**
   
   <img src = "https://user-images.githubusercontent.com/70243735/117245154-52e3ce80-ae75-11eb-9f67-3279ae13e8e1.png" width ="800px">
   
   + **[ProductController](./PhoneMall/src/main/java/com/phonemall/controller/ProductController.java)**  
    : 이미지는 C:\\phoneMall\\upload 폴더에 저장합니다.  
    : 배포 이후에서는 AWS S3에 저장합니다.(이에 관련한 코드는 deploy브랜치에서 확인할 수 있습니다.)  
    
   + **BoardService**   
    : ProductService.java - [ProductServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/ProductServiceImpl.java)의 구조를 가집니다.
  
   + **Mapper**   
    : [ProductMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/ProductMapper.java) - [ProductMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/ProductMapper.xml)의 구조를 가집니다.   
    : [ProductColorListMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/ProductColorListMapper.java) - [ProductColorListMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/ProductColorListMapper.xml)의 구조를 가지며, 상품의 색상 테이블에 관한 쿼리를 처리합니다.   
    : [ProductImageMapper.java](/PhoneMall/src/main/java/com/phonemall/mapper/ProductImageMapper.java) - [ProductImageMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/ProductImageMapper.xml)의 구조를 가지며, 상품의 이미지 테이블에 관한 쿼리를 처리합니다.   

  </details>

- [X] **리뷰와 답글의 CRUD**
   
   <details>
   <summary> 리뷰와 답글의 CRUD 설명 펼치기:pushpin: </summary>
   
   <br>
  
   **[ 기능 설명 ]**    
    : 제품을 **구매한 회원**은 리뷰를 등록, 수정, 삭제할 수 있습니다.   
    : **관리자**는 리뷰에 대한 답글을 등록, 수정, 삭제할 수 있습니다.   
    : 리뷰와 답글에 대한 조회는 **제품의 리뷰 탭** 에서 누구나 가능합니다.   
    : 또는 **MyReviews** 탭에서 자신의 리뷰를 확인할 수 있습니다.
 
    **[ 상세 구조 ]**

   <img src = "https://user-images.githubusercontent.com/70243735/117251025-0bfad680-ae7f-11eb-8445-2902566d844e.png">

    + **ProductReviewRestController**    
     : json를 반환하는 [RestController](./PhoneMall/src/main/java/com/phonemall/controller/ProductReviewRestController.java )를 사용하였고, View단에서 JQuery의 [AJAX](/PhoneMall/src/main/webapp/resources/js/review.js)로 데이터를 주고 받습니다.   
     
    + **[ProductReviewController](./PhoneMall/src/main/java/com/phonemall/controller/ProductReviewController.java)**   
     : **MyReviews** 탭에서 자신의 리뷰를 모아서 확인합니다.   
     
    + **ProductReviewService**    
     : ProductReviewServie.java - [ProductReviewServieImpl.java](./PhoneMall/src/main/java/com/phonemall/service/ProductReviewServieImpl.java)의 구조를 가집니다.
  
    + **Mapper**   
     : [ProductReviewMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/ProductReviewMapper.java) - [ProductReviewMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/ProductReviewMapper.xml)의 구조를 가집니다.   
     : [ProductMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/ProductMapper.java) - [ProductMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/ProductMapper.xml)의 구조를 가지며, 상품 테이블의 리뷰 수와 평점을 업데이트하는 쿼리를 처리합니다.   
     : [PurchaseMapper]는 구매 테이블의 리뷰 작성 여부를 업데이트하는 쿼리를 처리합니다.

  </details>
  
---

### [ 상품 구매 절차 ]

<img src="https://user-images.githubusercontent.com/70243735/117667426-d4be5980-b1df-11eb-8351-6821f7720e05.png" width ="900px">

- [X] **좋아요**
  <details>
  <summary> 좋아요 설명 펼치기:pushpin: </summary>
 
  <br>
  
  **[ 기능 설명 ]**    
  : 회원은 상품에 대한 좋아요를 눌러 **WishList에 저장**할 수 있습니다.   
  : WishList에서 좋아요를 취소할 수도 있습니다.

    **[ 상세 구조 ]**
   <img src = "https://user-images.githubusercontent.com/70243735/117251843-24b7bc00-ae80-11eb-84e5-9fa12d00b62e.png">

    + **[WishListController](./PhoneMall/src/main/java/com/phonemall/controller/WishListController.java)**    
    
    + **[UserRegisterController](./PhoneMall/src/main/java/com/phonemall/controller/UserRegisterController.java)**   
     : WishList를 조회하고 좋아요를 취소할 수 있습니다.

    + **WishListService**   
     : WishListService.java - [WishListServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/WishListServiceImpl.java)의 구조를 가집니다.
  
    + **WishListMapper**   
     : [WishListMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/WishListMapper.java) - [WishListMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/WishListMapper.xml)의 구조를 가집니다.

  </details>

- [X] **장바구니**
  <details>
  <summary> 장바구니 설명 펼치기:pushpin: </summary>
  
  <br>
  
  **[ 기능 설명 ]**   
  : 회원은 원하는 상품의 **수량과 색을 지정**하여 장바구니에 저장할 수 있습니다.  
  : 장바구니에서 담았던 상품을 삭제할 수도 있습니다.   
  : **쿠폰을 적용**할 수 있습니다.   
  : 쿠폰을 적용한 최종 결제 금액을 알려줍니다.  

    **[ 상세 구조 ]**
   <img src = "https://user-images.githubusercontent.com/70243735/117255159-4a46c480-ae84-11eb-8eb3-3ffb46ac5c0d.png">
  
    + **[CartController](./PhoneMall/src/main/java/com/phonemall/controller/CartController.java)**

    + **Service**   
     : CartService.java - [CartServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/CartServiceImpl.java)의 구조를 가집니다.   
     : CouponService.java - [CouponServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/CouponServiceImpl.java)의 구조를 가지며, 보유한 쿠폰을 조회합니다.   
  
    + **Mapper**   
     : [CartMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CartMapper.java) - [CartMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/CartMapper.xml)의 구조를 가집니다.   
     : [CouponMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CouponMapper.java) - [CouponMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/CouponMapper.xml)의 구조를 가집니다.   
     
  </details>
  

- [X] **쿠폰의 등록과 조회**
  
  <details>
   <summary> 쿠폰의 등록과 조회 설명 펼치기:pushpin: </summary>

  <br>

  **[ 기능 설명 ]**    
  : 회원은 쿠폰을 등록할 수 있습니다.   
  : 등록한 쿠폰을 MyCoupon에서 조회할 수 있습니다.   
 
    **[ 상세 구조 ]**
   <img src = "https://user-images.githubusercontent.com/70243735/117262239-0061dc80-ae8c-11eb-8f71-944149b0355a.png">
  
    + **[CouponsController](./PhoneMall/src/main/java/com/phonemall/controller/CouponsController.java)**

    + **CouponService**   
     : CouponService.java - [CouponServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/CouponServiceImpl.java)의 구조를 가집니다.
  
    + **CouponMapper**   
     : [CouponMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CouponMapper.java) - [CouponMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/CouponMapper.xml)의 구조를 가집니다.   

  </details>
    
- [X] **구매**
  
  <details>
  <summary> 구매 설명 펼치기:pushpin: </summary>
  
  <br>
  
  **[ 기능 설명 ]**   
  : **카카오페이**를 이용하여 상품을 결제할 수 있습니다.   
  : 장바구니에 있는 여러 상품들을 **함께 주문**할 수 있습니다.   
  
    **[ 상세 구조 ]**

   <img src = "https://user-images.githubusercontent.com/70243735/117296311-e33f0500-aeaf-11eb-9e48-11bd1fd407df.png">
    
    + **Controller**   
     : [KakaoPayController](./PhoneMall/src/main/java/com/phonemall/controller/KakaoPayController.java)   
     : [CartController](./PhoneMall/src/main/java/com/phonemall/controller/CartController.java)는 주문번호를 랜덤으로 지정하고 장바구니에 있는 상품을 주문합니다.  

    + **Service**   
     : KakaoPayService.java - [KakaoPayServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/KakaoPayServiceImpl.java )의 구조를 가지며, REST API를 사용하여 카카오페이 결제를 진행합니다.  
     : CartService.java - [CartServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/CartServiceImpl.java)의 구조를 가지며, **주문할 장바구니 상품 목록을 조회**합니다.   
     : CouponService.java - [CouponServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/CouponServiceImpl.java)의 구조를 가지며, **사용한 쿠폰**의 상태를 used로 업데이트합니다.   
     : PurchaseService.java - [PurchaseServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/PurchaseServiceImpl.java)의 구조를 가지며, **주문 정보를 저장하고 조회**합니다.
     
    + **Mapper**   
     : [PurchaseMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CouponMapper.java) - [PurchaseMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/PurchaseMapper.xml)의 구조를 가집니다.   
     : [CartMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CartMapper.java) - [CartMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/CartMapper.xml)의 구조를 가집니다.   
     : [CouponMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/CouponMapper.java) - [CouponMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/CouponMapper.xml)의 구조를 가집니다.   

  </details>
  
- [X] **구매 내역 조회**
  
  <details>
   <summary> 구매 내역 조회 설명 펼치기:pushpin: </summary>

  <br>
  
  **[ 기능 설명 ]**
   : 구매한 제품은 **MyPurchase** 에서 확인할 수 있습니다.  
   : MyPurchase에서 주문 번호를 클릭하여 주문 정보를 확인할 수 있습니다.
   
  **[ 상세 구조 ]**
  
   <img src = "https://user-images.githubusercontent.com/70243735/117296574-2e591800-aeb0-11eb-98b1-9b772a3273ec.png">
  
    + **[PurchaseInfoController](./PhoneMall/src/main/java/com/phonemall/controller/PurchaseInfoController.java)**    

    + **PurchaseService**   
     : PurchaseService.java - [PurchaseServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/PurchaseServiceImpl.java)의 구조를 가집니다.
  
    + **PurchaseMapper**   
     : [PurchaseMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/PurchaseMapper.java) - [PurchaseMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/PurchaseMapper.xml)의 구조를 가집니다.

  </details>
  
---
### [ 홈페이지 관리 ] 

<img src = "https://user-images.githubusercontent.com/70243735/117667158-94f77200-b1df-11eb-8c28-f58dadb29b3c.png" width ="800px">

- [X] **공지의 CRUD**
   <details>
   <summary> 공지의 CRUD 설명 펼치기:pushpin: </summary>

   <br>

   **[ 기능 설명 ]**    
   : 관리자는 공지를 등록, 수정, 삭제할 수 있고 누구나 조회할 수 있습니다.    
   : 공지는 **이미지**를 등록할 수 있습니다.

    **[ 상세 구조 ]**
    <img src = "https://user-images.githubusercontent.com/70243735/117270413-28553e00-ae94-11eb-9da5-7fbb053c96e8.png">

     + **[NoticeController](./PhoneMall/src/main/java/com/phonemall/controller/NoticeController.java)**    
      : 이미지는 C:\\phoneMall\\upload 폴더에 저장합니다.  
      : 배포 이후에서는 AWS S3에 저장합니다.(이에 관련한 코드는 deploy브랜치에서 확인할 수 있습니다.)  

     + **NoticeService**   
      : NoticeService.java - [NoticeServiceImpl.java](./PhoneMall/src/main/java/com/phonemall/service/NoticeServiceImpl.java)의 구조를 가집니다.

     + **Mapper**   
      : [NoticeMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/NoticeMapper.java) - [NoticeMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/NoticeMapper.xml)의 구조를 가집니다.   
      : [NoticeImageMapper.java](./PhoneMall/src/main/java/com/phonemall/mapper/NoticeImageMapper.java) - [NoticeImageMapper.xml](./PhoneMall/src/main/resources/com/phonemall/mapper/NoticeImageMapper.xml)의 구조를 가지며, 상품의 이미지 테이블에 관한 쿼리를 처리합니다.   

   </details>
  
- [X] **문의 메일 전송**
  
   <details>
   <summary> 문의 메일 설명 펼치기:pushpin: </summary>
   
   <br>

   **[ 기능 설명 ]**    
   : 누구나 문의 메일을 보낼 수 있습니다.

   **[ 상세 구조 ]**
     + **[servlet-context](./PhoneMall/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml)**    
      : Spring Framework가 제공하는 JavaMailSender 인터페이스의 구현체인 **JavaMailSenderImpl**클래스를 사용하여 **빈을 등록**합니다.  
      : * servlet-context 의 구글 비밀번호는 실제와 다릅니다. 때문에 코드를 그대로 실행할시 동작하지 않을 수 있습니다.   

     + **[MailSendController.java](./PhoneMall/src/main/java/com/phonemall/controller/MailSendController.java)**   
      : 단순한 텍스트만 전송하기 때문에 **SimpleMailMessage**을 이용하여 메일을 전송합니다.

   </details>
  
