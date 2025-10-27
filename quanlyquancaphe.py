from lxml import etree

xml_file = "quanlyquancaphe_XSD.xml"

xml_tree = etree.parse(xml_file)
root = xml_tree.getroot()

# 1. Danh sách khách hàng
print("1. Danh sách khách hàng")

for kh in root.xpath("/quanlyquancaphe/khachhang"):
    makh = kh.findtext("khachhang_id")
    tenkh = kh.findtext("hoten")
    print(f"   - Mã KH: {makh} | Tên KH: {tenkh}")

# 2. Nhân viên có chức vụ "Phục vụ"
print("2. Nhân viên có chức vụ phục vụ")

for nv in root.xpath("/quanlyquancaphe/nhanvien[chucvu='Phục vụ']"):
    manv = nv.findtext("nhanvien_id")
    tennv = nv.findtext("hoten")
    chucvu = nv.findtext("chucvu")
    print(f"   - Mã NV: {manv} | Tên NV: {tennv} | Chức vụ: {chucvu}")

# 3. Nhân viên có lương cao nhất
print("3. Nhân viên có lương cao nhất")

max_salary = 0
highest_paid_nv = None
for nv in root.xpath("/quanlyquancaphe/nhanvien"):
    luong = int(nv.findtext("luong", default=0))
    if luong > max_salary:
        max_salary = luong
        highest_paid_nv = nv

if highest_paid_nv is not None:
    manv = highest_paid_nv.findtext("nhanvien_id")
    tennv = highest_paid_nv.findtext("hoten")
    chucvu = highest_paid_nv.findtext("chucvu")
    print(f"   - Mã NV: {manv} | Tên NV: {tennv} | Chức vụ: {chucvu} | Lương: {max_salary}đ")

# 4. Sản phẩm thuộc loại "Đồ uống"
print("4. Sản phẩm thuộc loại Đồ uống")

for sp in root.xpath("/quanlyquancaphe/sanpham[loaisanpham='Đồ uống']"):
    masp = sp.findtext("sanpham_id")
    tensp = sp.findtext("tensanpham")
    loai = sp.findtext("loaisanpham")
    print(f"   - Mã SP: {masp} | Tên SP: {tensp} | Loại: {loai}")

# 5. Sản phẩm có giá trên 30.000đ
print("5. Sản phẩm có giá trên 30.000đ")

for sp in root.xpath("/quanlyquancaphe/sanpham[gia>30000]"):
    masp = sp.findtext("sanpham_id")
    tensp = sp.findtext("tensanpham")
    gia = sp.findtext("gia")
    print(f"   - Mã SP: {masp} | Tên SP: {tensp} | Giá: {gia}đ")

# 6. Mã và tên của khách hàng ở "Đà Nẵng"
print("6. Mã và tên của khách hàng ở Đà Nẵng")

for kh in root.xpath("/quanlyquancaphe/khachhang[diachi='Đà Nẵng']"):
    makh = kh.findtext("khachhang_id")
    tenkh = kh.findtext("hoten")
    print(f"   - Mã KH: {makh} | Tên KH: {tenkh}")

# 7. Các đơn do nhân viên "NV01" lập
print("7. Các đơn do nhân viên NV01 lập")

for dd in root.xpath("/quanlyquancaphe/donhang[nhanvien_id='NV01']"):
    madd = dd.findtext("donhang_id")
    ngaydd = dd.findtext("ngaydat")
    tong = dd.findtext("tongtien")
    print(f"   - Mã Đơn: {madd} | Ngày đặt: {ngaydd} | Tổng tiền: {tong}đ")

# 8. Lấy tên sản phẩm trong đơn hàng "DH02"
print("8. Lấy tên sản phẩm trong đơn hàng DH02")

sanpham_ids = root.xpath("/quanlyquancaphe/chitietdonhang[donhang_id='DH02']/sanpham_id/text()")

for sp_id in sanpham_ids:
    tensp = root.xpath(f"/quanlyquancaphe/sanpham[sanpham_id='{sp_id}']/tensanpham/text()")
    if tensp:
        print(f"   - Tên SP: {tensp[0]}")

#  9. Lấy tất cả tên nhân viên từng được phân công làm việc vào ngày 01-09-2025
print("9. Tên nhân viên làm việc ngày 01-09-2025")

nhanvien_ids = root.xpath("/quanlyquancaphe/phancong[ngaylam='2025-09-01']/nhanvien_id/text()")

for nv_id in nhanvien_ids:
    tennv = root.xpath(f"/quanlyquancaphe/nhanvien[nhanvien_id='{nv_id}']/hoten/text()")
    if tennv:
        print(f"   - Tên NV: {tennv[0]}")