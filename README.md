# Vietnamese-Traditional-Medicine-Company Azure Cloud Migration - Infrastructure as Code (Terraform)

![Solution Architecture](LeKhanhLinh-Vietnamese-Traditional-Medicine-Company-Azure-Solution-Architech-v2.png)

Dự án này chứa toàn bộ mã nguồn Terraform để triển khai hạ tầng chuẩn Enterprise Scale trên Microsoft Azure cho chiến dịch Cloud Migration của Vietnamese-Traditional-Medicine-Company, bao gồm 27 ứng dụng thuộc 4 nhóm hệ thống cốt lõi:
1. Hệ thống Quản trị Doanh nghiệp (Core ERP)
2. Hệ thống Quản lý Kênh Phân phối và Bán hàng (DMS)
3. Hệ thống Truy xuất Nguồn gốc và Chuỗi Cung ứng
4. Nền tảng Công nghệ Mới và Tiện ích Sự kiện (AI Hub)

## Cấu trúc Thư mục

Mã nguồn được thiết kế theo hướng **Modular**, dễ dàng bảo trì và tái sử dụng:

*   **`/environments`**: Chứa các cấu hình cụ thể cho từng môi trường (ví dụ: `prod`, `staging`). Gọi các module và truyền tham số (tfvars).
    *   Sử dụng **Remote State** lưu trên Azure Storage Account.
*   **`/modules`**: Chứa các component độc lập:
    *   `networking`: Mạng ảo (VNet), Subnets.
    *   `security`: Azure Front Door, WAF, Key Vault.
    *   `compute_aks`: Azure Kubernetes Service (AKS) chạy microservices cho 20+ app.
    *   `databases`: Azure SQL Managed Instance (ERP) và Cosmos DB (IoT/Logs).
    *   `integration`: Azure API Management, Service Bus, Event Hub.
    *   `ai_hub`: Azure OpenAI, Face API, AI Search.
    *   `monitoring`: Log Analytics, Application Insights.

## Hướng dẫn Triển khai (Deployment Guide)

### Yêu cầu trước khi chạy (Prerequisites)
1. Đã cài đặt Terraform CLI (`>= 1.5.0`).
2. Đã cài đặt Azure CLI (`az cli`) và đăng nhập (`az login`).
3. (Tùy chọn) Khởi tạo trước Resource Group và Storage Account để lưu Terraform State.

### Các bước thực hiện cho môi trường Production

```bash
# 1. Di chuyển vào thư mục Production
cd environments/prod

# 2. Khởi tạo Terraform và tải các Provider / Modules
terraform init

# 3. Kiểm tra kế hoạch thay đổi (Khai báo biến trong terraform.tfvars nếu cần)
terraform plan -out=prod.plan

# 4. Thực thi triển khai lên Azure (Cần phê duyệt)
terraform apply prod.plan
```

## Lưu ý Bảo mật & Vận hành
*   Tuyệt đối **không** commit mật khẩu, khóa bí mật vào GitHub. Hãy sử dụng Azure Key Vault hoặc truyền qua biến môi trường (`TF_VAR_sql_admin_password`).
*   Toàn bộ resource được gắn tag `CostCenter = Vietnamese-Traditional-Medicine-Company-IT` để tối ưu mô hình FinOps.
*   Mô hình AKS mặc định cấu hình auto-scaling để chịu tải trong những ngày chốt doanh số cuối tháng.
