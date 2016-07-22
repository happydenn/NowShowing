# NowShowing 電影報報
顯示目前上映中的電影。  
(資料來源：開眼電影網)

## 功能
1. 顯示目前正在上映中的首輪電影
2. 顯示各項跟電影相關的基本資訊
3. 顯示場次及時間

## 注意事項
1. 本project使用CocoaPods，請記得開啟 `NowShowing.xcworkspace` 而不是 `NowShowing.xcodeproj`
2. 本project在場次部分使用了 `UICollectionViewController` ，這部分為補充的內容，可以試著看看有沒有辦法看懂！
3. 本project也示範了很多在真正上架的app中常出現的UI pattern跟一些設計元素，大家也可以試著讓自己的project看起來更專業一點喔！

## CocoaPods使用
本project使用了下列的第三方library：

1. __Alamofire__ HTTP用戶端，用來從網路上面下載檔案
2. __SwiftyJSON__ 更簡便的處理JSON資料
3. __GradientView__ 漸層的view架構，主要用來做圖片上面顯示資訊的overlay
4. __SDWebImage__ 簡易的處理網路圖檔專用library

本app主要作為 [iOS App開發基礎班](https://www.csie.ntu.edu.tw/train/?page=course_info.html&courseid=1548) 展示用範例。
