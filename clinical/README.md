<h1 align="center">Đồ án tốt nghiệp - ĐẠI HỌC GIAO THÔNG VẬN TẢI <br/>
    Ứng dụng FLUTTER hỗ trợ bệnh nhân đăng ký khám  bệnh 
</h1>
<p align="center">
    <img src="ReadMe_images/logo.png" />
</p>

# **Table Of Content**
- [**Giới thiệu**](#giới-thiệu)
- [**📅 Kế Hoạch Phát Triển Ứng Dụng 📅**](#-kế-hoạch-phát-triển-ứng-dụng-)
- [**Database**](#database)
- [**Giao diện cho bệnh nhân**](#giao-diện-cho-bệnh-nhân)
  - [**1. Launch**](#1-launch)
  - [**2. Login**](#2-login)
  - [**3. Home**](#3-home)
  - [**4. Booking**](#4-booking)
  - [**5. Schedule**](#5-schedule)
  - [**6. QA**](#6-qa)
  - [**7. Setting**](#7-setting)
    - [***7.1 Edit Profile***](#71-edit-profile)
    - [***7.2 Change Password***](#72-change-password)
    - [***7.3 Medical Profiles***](#73-medical-profiles)
    - [***7.4 Dark Mode***](#74-dark-mode)
- [**Giao diện cho bác sĩ**](#giao-diện-cho-bác-sĩ)
  - [**1. Home**](#1-home)
  - [**2. Schedule Screen**](#2-schedule-screen)
- [**Firebase Cloud Messaging**](#firebase-cloud-messaging)
- [**Conclusion**](#conclusion)


# **Giới thiệu**

Chào các bạn, mình tên là Vũ Bảo Lâm.

Mã sinh viên: 211241205.

Lớp: CNTT1-K62

Đây là đồ án tốt nghiệp của mình, 1 ứng dụng app mobile phát triển bằng Flutter.

Link Demo App: https://www.youtube.com/watch?v=gMzhO5pKP-M

Ứng dụng là nền tảng trung gian hỗ trợ các phòng khám và bác sĩ trong việc quản lý lịch hẹn khám bệnh, cũng như hỗ trợ bệnh nhân đăng ký lịch hẹn khám đối với các trường hợp y tế thông thường, khám định kỳ hoặc theo dõi sức khỏe dưới sự giám sát của bác sĩ. Các tình huống khẩn cấp hoặc đe dọa tính mạng cần được xử lý trực tiếp tại bệnh viện và không thuộc phạm vi hỗ trợ của ứng dụng.

Ứng dụng sẽ được chia thành 2 giao diện dành cho 2 loại người dùng chính: bác sĩ và bệnh nhân

**Patient:** ứng dụng cần phải đáp ứng chức năng đặt lịch khám bệnh trực tuyến với bác sĩ; chức năng tìm kiếm thông tin bác sĩ, chuyên ngành, phòng khám; chức năng quản lý lịch đặt khám; chức năng quản lý tài khoản

**Doctor** ứng dụng cần phải đáp ứng chức năng lên lịch làm việc của bác sĩ; chức năng quản lý lịch đặt khám với bệnh nhân; chức năng quản lý bệnh án, đơn thuốc của bệnh nhân; chức năng quản lý tài khoản.

•	Ứng dụng cần có chức năng hỏi đáp chia sẻ thông tin giữa bác sĩ và bệnh nhân

•	Ứng dụng cần đảm bảo chức năng xác thực người dùng như đăng ký, đăng nhập, quên mật khẩu.

•	Ứng dụng cần có chức năng thông báo



# **📅 Kế Hoạch Phát Triển Ứng Dụng 📅**

| STT | Nội dung công việc                                                                                                                                     | Thời gian dự kiến                     | Ghi chú                                                                                                    |
|-----|--------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------------------------|
| 1   | Thiết kế giao diện UI/UX cho trang đăng nhập và đăng ký tài khoản                                                                                      | 10/03/2025 - 11/03/2025               |                                                                                                            |
| 2   | • Thiết lập và liên kết Firebase CLI <br> • Thiết kế Logo ứng dụng và `splash_screen.dart` <br> • Thêm các extension vào ứng dụng                      | 12/03/2025                            | Extension trong `pubspec.yaml`                                                                             |
| 3   | Làm back-end cho `sign_up_screen`                                                                                                                      | 13/03/2025                            |                                                                                                            |
| 4   | Làm back-end cho `sign_in_screen`                                                                                                                      | 14/03/2025                            | Sửa lỗi button bị lỗi <br> Đăng nhập theo role                                                             |
| 5   | Làm back-end `google_auth`                                                                                                                             | 15/03/2025                            |                                                                                                            |
| 6   | • Học và làm back-end `forgot_password`, gửi link reset password qua email xác thực <br> • Sửa lỗi Splash screen <br> • Sửa back-end đăng ký tài khoản | 16/03/2025 - 17/03/2025               |                                                                                                            |
| 7   | Thiết kế `main_page` và `home_screen` <br> • Bottom Navigation Bar <br> • Patient's Home Screen                                                        | 18/03/2025 - ??/03/2025               | Sửa lỗi Material Page Route khiến bị đen màn hình                                                          |
| 8   | Thiết kế cơ sở dữ liệu: Bảng `users`, bảng `doctors`                                                                                                   | 19/03/2025 - 20/03/2025               |                                                                                                            |
| 9   | • Code FE cho `list_specialization` và `list_doctors` <br> • Thêm collection `specializations` và 8 chuyên khoa <br> • Thêm một số field cho `doctors` | 20/03/2025                            |                                                                                                            |
| 10  | Thiết kế giao diện cho `doctor_detail_screen`                                                                                                          | 21/03/2025                            |                                                                                                            |
| 11  | Code giao diện và back-end cho `doctor_detail_screen`                                                                                                  | 22/03/2025                            |                                                                                                            |
| 12  | Thiết kế cơ sở dữ liệu collection `schedule` và model `schedule.dart`                                                                                  | 23/03/2025                            |                                                                                                            | 
| 13  | Code giao diện và BE `doctor_main_screen` <br>• Có `table_calendar` cho chọn ngày <br/>                                                                | 24/03/2025 - 30/03/2025               | Thêm `table_calendar: ^3.0.9` vào pub                                                                      |  
| 14  | Code giao diện và BE `booking_screen` cho Patient                                                                                                      | 31/03/2025                            |
| 15  | Code giao diện cho `schedule_screen` & sửa `doctor_main_screen` cho bác sĩ update `schedule`                                                           |                                       |
| 16  | Code giao diện và BE `specilization_detail_screen` cho Patient                                                                                         | 9/04/2025                             | Thêm onTap trong `list_specialization`                                                                     |                         |                                                   | 
| 17  | Update lại `schedule_screen` hiển thị lịch theo đúng uid của tài khoản tránh hiển thị hết                                                              | 10/04/2025                            | update `fetchBookingByStatus`                                                                              | 
| 18  | Update lại `doctor_schedule_screen`hiển thị lịch làm việc theo từng bác sĩ ứng với bệnh nhân book                                                      | 11/04/2025                            |                                                                                                            | 
| 19  | Update `booking_screen` thêm trường `patientId` giúp `schedule_screen` hiển thị lịch hẹn theo đúng bác sĩ & bệnh nhân                                  | 14/04/2025                            |                                                                                                            | 
| 20  | Update `AndroidManifest` phần `activity` & `receiver` giúp đẩy thông báo local_notification                                                            | 21-22/04/2025                         | Thêm  `flutter_local_notifications: ^17.2.3` ,`permission_handler: ^11.3.1`, `permission_handler: ^11.3.1` | 
| 21  | Code  `doctor_schedule_screen` giúp bác sĩ thêm `prescription` cho bệnh nhân                                                                           | 23/04/2025                            |                                                                                                            | 
| 22  | Code `schedule_screen` giúp bệnh nhân xem đơn thuốc bác sĩ cho và đặt thông báo uống thuốc                                                             | 23/04/2025                            |                                                                                                            | 
| 23  | Code `search_screen` cho phép tra cứu bác sĩ, phòng khám khả dụng                                                                                      | 24/04/2025                            |                                                                                                            | 
| 24  | Code `setting_screen`  và `edit_profile_screen` và `change_password_screen`                                                                            | 25/04/2025                            |                                                                                                            | 
| 25  | Code `theme_notifier`đổi màu giao diện , chỉnh sửa `setting_screen` và `main` để thay đổi màu cũng như các thay đổi UI 1 số trang để đổi theme         | 26/04/2025                            | Thêm `provider: ^6.1.4`hỗ trợ đổi theme                                                                    | 
| 26  | Code `qa_screen` và `qa_detail_screen`                                                                                                                 |                                       |                                                                                                            | 
| 27  | Code tạo thêm thông báo đặt thông báo cho lịch hẹn được accepted cho `schedule_screen`                                                                 |                                       | Thêm `_showAppointmentReminderDialog` & `_scheduleCustomAppointmentReminder`                               | 
| 28  | Thêm trường [`booking`][`doctorInfo`][`clinicAddress`]                                                                                                 |                                       |                                                                                                            | 
| 29  | Code `about_us_screen`                                                                                                                                 |                                       |
| 30  | Code `medical_profile_screen` và `add_medical_profile_screen` giúp bệnh nhân tạo hồ sơ khám bệnh                                                       | 05/05/2025                            |
| 31  | Sửa `booking_screen`, tạo [`_showProfileSelectionDialog`] và [`_fetchMedicalProfiles`]                                                                 | 05/05/2025                            |                                                                                                            |
| 32  | Tạo `notification_helper` giúp bệnh nhân tạo local_notidication uống thuốc                                                                             | 6-9/05/2025                           |
| 33  | Tạo `booking_notification_service` tạo thông báo FcmToken thông báo khi lịch hẹn thay đổi trạng thái                                                   | 10-11/05/2025                         |
| 34  | Update `booking_screen` cho `confirm_booking` giúp đẩy thông báo cho bác sĩ khi bệnh nhân tạo lịch khám                                                | 12-13/05/2025                         |                                                                                                            |                                                                                                |
| 35  | Update `doctor_schedule_screen` void `updateBookingStatus` giúp bác sĩ gửi thông báo đến bệnh nhân nếu trạng thái là "accepted"                        | 14/05/2025                            | Thêm trạng thái `rejected`                                                                                 |
| 37  | Update all Model related files                                                                                                                         |                                       |                                                                                                            |
| 38  |                                                                                                                                                        |                                       |                                                                                                            |
| 39  |                                                                                                                                                        |                                       |                                                                                                            |

# **Database**
Vì dữ liệu theo mô hình phân cấp và linh hoạt, nên sơ đồ ERD truyền thống không mô tả được mối quan hệ lồng nhau của subcollection.Thay vào đó sơ đồ cây sẽ phù hợp với mô hình với cấu trúc dữ liệu. Mỗi node đại diện cho collection hoặc document, các nhánh thể hiện mối quan hệ cha-con (parent-child).
<p align="center">
    <img src="ReadMe_images/DATN-NOSQL.drawio.png" height="1080" />
</p>
<h3 align="center"> Sơ đồ cơ sở dữ liệu</h3>

# **Giao diện cho bệnh nhân**
## **1. Launch**
<p align="center">
    <img src="ReadMe_images/splash_screen.png" style="width: 200px; height: auto;"/>
</p>
<h3 align="center">***Màn hình khởi chạy khi mở ứng dụng***</h3>

## **2. Login**

Ứng dụng hỗ trợ người dùng hai tùy chọn để đăng nhập vào chương trình, bao gồm:

1. Đăng nhập bằng tài khoản tạo

2. Đăng nhập bằng tài khoản Google
<table>
  <tr>
    <td>
      <img src="ReadMe_images/sign_up_screen.png"  style="width: 200px; height: auto;">  
      <br>
      <p align="center">Màn hình đăng ký tài khoản</p>
    </td>
    <td>
      <img src="ReadMe_images/sign_in_screen.png"  style="width: 200px; height: auto;">  
      <br>
      <p align="center">Màn hình đăng nhập </p>
    </td>
  </tr>
</table>

## **3. Home**
- Khi đăng nhập thành công, với tài khoản bệnh nhân sẽ chuyển đến màn hình trang chủ
<table>
  <tr>
    <td><img src="ReadMe_images/patient_home_screen.png" width="1440"><br><p align="center">Trang chủ</p></td>
    <td><img src="ReadMe_images/patient_detail_specialization_screen.png"  width="1440"><br><p align="center">Chi tiết chuyên khoa</p></td>
    <td><img src="ReadMe_images/patient_detail_clinic_screen.png"  width="1440"><br><p align="center">Chi tiết phòng khám</p></td>
<td><img src="ReadMe_images/patient_detail_doctor_screen.png" width="1440"><br><p align="center">Chi tiết bác sĩ</p></td>
  </tr>
</table>

Màn hình Home với hình ảnh minh họa bên từ trái qua là trình tự nội dung mà chúng ta sẽ nhìn thấy trên màn hình khi vuốt từ trên xuống dưới

Màn hình này bao gồm các thành phần như sau:
1. Chào theo thời gian buổi sáng-chiều-tối
2. Nút đăng xuất
3. Tên hiển thị của tài khoản
4. Thanh tìm kiếm bác sĩ hoặc phòng khám
5. Danh mục chuyên khoa
6. Danh mục phòng khám nổi bật
7. Danh mục bác sĩ nổi bật sử dụng để hiển thị các bác sĩ đang làm việc trong bệnh viện
8. Thanh điều hướng với 4 menu chính: Trang chủ 🏠, Cộng đồng QA hỏi đáp , Lịch hẹn 📆,  và cá nhân😀

## **4. Booking**
- Ở trang Đặt lịch khám, người dùng chọn ngày để xem lịch làm việc khả dụng của bác sĩ, chọn khung thời gian và nhập thông tin cá nhân để đặt lịch. Ứng dụng có hỗ trợ lưu hồ sơ y tế để tự động nhập thông tin cho đặt lịch khám.

<p align="center">
    <img src="ReadMe_images/patient_booking_screen.png" height="600px" />
</p>

## **5. Schedule**

Sau khi đặt lịch thành công, người dùng chuyển sang giao diện "lịch hẹn của bạn" để theo dõi trạng thái của lịch hẹn. Lịch hẹn có 4 trạng thái chính:

**Đang xử lý/Pending:** Tại trạng thái này, cần đợi bác sĩ chấp nhận lịch đặt hẹn, người dùng có thể huỷ lịch hẹn khi ở trạng thái này

**Đã chấp nhận/accepted:** Khi bác sĩ chấp nhận lịch hẹn, người dùng sẽ nhận được thông báo gửi tới điện thoại là lịch hẹn đã được chấp nhận và Người dùng không thể huỷ được cuộc hẹn nữa. Tại trạng thái này, người dùng có thể đặt thời gian nhắc nhở gần tới lịch khám

<p align="center">
    <img src="ReadMe_images/patient_schedule_notify.png" height="600px" />
</p>

**Hoàn thành/finished:** Sau khi khám xong, bác sĩ cập nhật trạng thái lịch hẹn là hoàn thành, người dùng có thể nhận được đơn thuốc nếu bác sĩ kê đơn sau khám. Người dùng có thể chọn thời gian nhắc nhở uống thuốc.

<table>
  <tr>
    <td><img src="ReadMe_images/patient_schedule_finish_screen.png" height="600px"><br><p align="center">Lịch hẹn hoàn thành</p></td>
    <td><img src="ReadMe_images/patient_prescription_notify.png" height="600px"><br><p align="center"> Đặt thời gian nhắc nhở uống thuốc</p></td>
  </tr>
</table>

**Huỷ/cancel_rejected:** Cuộc hẹn nếu bệnh nhân huỷ hoặc là bác sĩ huỷ sẽ được lưu ở màn hình này

<p align="center">
    <img src="ReadMe_images/patient_schedule_cancel.png" height="600px" />
</p>

## **6. QA**
Phần này là 1 chức năng nhỏ trong hệ thống của mình, vốn là mình định làm phần nhắn tin chat thời gian thực nhưng thời gian không đủ và sức lực có hạn nên mình chỉ làm 1 phần màn hình cho phép bệnh nhân và bác sĩ đặt câu hỏi và có thể bình luận trả lời. Và đương nhiên có lọc theo chuyên ngành để giúp tìm kiếm

<table>
  <tr>
    <td><img src="ReadMe_images/patient_qa_screen.png"  width="600"><br><p align="center">Hỏi đáp  bác sĩ</p></td>
    <td><img src="ReadMe_images/patient_qa_comment_screen.png"  width="600"><br><p align="center"> Bình luận</p></td>
  </tr>
</table>

## **7. Setting**
Phần cài đặt này mình sẽ giới thiệu với các tính năng nhỏ mang tinh thần là hỗ trợ, nâng cao trải nghiệm của người sử dụng.

<p align="center">
    <img src="ReadMe_images/patient_setting_screen.png" height="600"/>
</p>

### ***7.1 Edit Profile***
Phần này cho phép người dùng chỉnh sửa tên hiển thị của tài khoản
<p align="center">
    <img src="ReadMe_images/patient_setting_edit_profile_screen.png" height="600" />
</p>

### ***7.2 Change Password***
Phần này cho phép người dùng thay đổi mật khẩu cho tài khoản, yêu cầu cần có mật khẩu hiện tại
<p align="center">
    <img src="ReadMe_images/patient_setting_change_password.png" height="600px"  />
</p>

### ***7.3 Medical Profiles***
Phần này cho phép người dùng tạo hồ sơ y tế. Vì 1 tài khoản có thể đặt lịch khám cho người thân cho gia đình k chỉ cho mỗi bản thân. Chức năng giúp mỗi lần đặt lịch khám thì k phải điền thông tin lại
<table>
  <tr>
    <td><img src="ReadMe_images/patient_setting_medical_profiles_screen.png"  height="600px"><br><p align="center">Hồ sơ y tế</p></td>
    <td><img src="ReadMe_images/patient_setting_medical_profiles_add.png" height="600px"><br><p align="center"> Thêm hồ sơ y tế</p></td>
  </tr>
</table>

### ***7.4 Dark Mode***
Hỗ trợ chế độ ban đêm và người sử dụng có thể chủ động bật tắt vì theo ý muốn
<table>
  <tr>
    <td><img src="ReadMe_images/patient_setting_dark_mode.png" alt="vocabA1" height="600px"><br><p align="center">Dark Mode</p></td>
  </tr>
</table>

## **Giao diện cho bác sĩ**
## **1. Home**
- Khi đăng nhập thành công, với tài khoản bác sĩ sẽ chuyển đến màn hình trang chủ
<table>
  <tr>
    <td><img src="ReadMe_images/doctor_home_screen.png"  height="600px" ><br><p align="center">Trang chủ</p></td>
    <td><img src="ReadMe_images/doctor_add_existing_time_slot.png" height="600px"  ><br><p align="center">Thêm time Slot đã tồn tại</p></td>
  </tr>
</table>

## **2. Schedule Screen**
Chức năng cho phép bác sĩ truy cập danh sách các lịch hẹn đã được bệnh nhân đặt, xem chi tiết từng lịch hẹn, và thực hiện cập nhật trạng thái của lịch hẹn (ví dụ: chấp nhận, từ chối, hoặc đánh dấu đã hoàn tất sau khi khám). Hệ thống sẽ cập nhật trạng thái trong cơ sở dữ liệu và gửi thông báo đến bệnh nhân tương ứng.

<table>
  <tr>
    <td><img src="ReadMe_images/booking_status_pending.png"  width="1080" ><br><p align="center">Chờ duyệt</p></td>
    <td><img src="ReadMe_images/booking_choose_accept.png" width="1080"  ><br><p align="center">Đồng ý lịch hẹn</p></td>
    <td><img src="ReadMe_images/booking_choose_reject.png" width="1080"  ><br><p align="center">Từ chối lịch hẹn</p></td>
  </tr>
</table>

Sau khi cập nhật trạng thái lịch hẹn đã hoàn thành, bác sĩ có thể chọn kê đơn thuốc cho bệnh nhân để gửi cho tài khoản bệnh nhân cũng như tạo bệnh án cho bệnh nhân đó (nếu là lần đầu) hoặc cập nhật vào bệnh án (nếu là tái khám). 

<table>
  <tr>
    <td><img src="ReadMe_images/booking_status_accept.png"  width="1080" ><br><p align="center">Chờ duyệt</p></td>
    <td><img src="ReadMe_images/booking_status_finish.png" width="1080"  ><br><p align="center">Màn hình lịch hẹn đã hoàn thành</p></td>
    <td><img src="ReadMe_images/booking_bottom_sheet.jpg" width="1080"  ><br><p align="center">Bottom Sheet</p></td>
  </tr>
</table>

### Bottom Sheet hiển thị list những tác vụ như:

<table>
  <tr>
    <td><img src="ReadMe_images/booking_prescription_list.png"  width="1080" ><br><p align="center">Bác sĩ có thể chọn kê đơn thuốc cho từng lịch hẹn với bệnh nhân, đơn thuốc sẽ được xem bởi cả bệnh nhân và bác sĩ</p></td>
    <td><img src="ReadMe_images/booking_prescription_add.png" width="1080"  ><br><p align="center">Bác sĩ có thể chọn kê đơn thuốc cho từng lịch hẹn với bệnh nhân, đơn thuốc sẽ được xem bởi cả bệnh nhân và bác sĩ</p></td>
    <td><img src="ReadMe_images/booking_record.jpg" width="1080"  ><br><p align="center">Bác sĩ có thể tạo hồ sơ bệnh án cho bệnh nhân để quản lý những lần tái khám sau đó.</p></td>
  </tr>
</table>

## **Firebase Cloud Messaging**
Và quan trọng nhất, chức năng mình làm mất thời gian nhất và theo mình thấy 
khó nhất là chức năng gửi thông báo khi bác sĩ nhận được lịch đặt hẹn mới từ bệnh nhân, 
thông báo sẽ gửi qua Firebase Cloud Messaging và bằng FCM Token 

Là 1 chức năng khá phức tạp khi cần phải lấy id của 1 số thứ như 

    "type": 
    "project_id": "clinical-b9614",
    "private_key_id": "..................",
    "private_key": "-----BEGIN PRIVATE KEY-----\n-----END PRIVATE KEY-----\n",
    "client_email": "...............",
    "client_id": "..................",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "...........................",
    "universe_domain": "googleapis.com"

cách lấy thì vào Project Setting -> Service accounts --> Generate new private key

Rồi còn phải làm 7749 thứ code để sử dụng những keys này, và đương nhiên là mình có sự trợ giúp của AI khá nhiều để làm chức năng này. Và kết quả là như này: 

<p align="center">
    <img src="ReadMe_images/new_booking_notify.png" height="600px" />
</p>

## **Conclusion**

Phía trên là toàn bộ các chức năng và giao diện mà mình đã thực hiện trong trong đồ án tốt nghiệp này.

Có thể nói tất cả những tính năng kết kể trên là toàn bộ những tính năng phức tạp nhất mà mình có thể thực hiện được ở Đồ án tốt nghiệp đại học.

Mong rằng phần chia sẻ ở phía trên sẽ ít nhiều đem lại hữu ích cho các bạn.