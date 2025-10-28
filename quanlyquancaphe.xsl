<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="html" encoding="UTF-8" indent="yes" />

  <!-- Template gốc -->
  <xsl:template match="/">
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Quản lý Quán Cà Phê</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; background-color: #fafafa; }
          h1 { color: #222; margin-bottom: 10px; }
          h2 { color: #333; border-bottom: 2px solid #999; padding-bottom: 5px; }
          table { width: 100%; border-collapse: collapse; margin-bottom: 30px; }
          th, td { border: 1px solid #666; padding: 6px; text-align: left; }
          th { background-color: #d8d8d8; }
          tr:nth-child(even) { background-color: #f2f2f2; }
        </style>
      </head>
      <body>
        <h1>Hệ thống Quản lý Quán Cà Phê</h1>
        <xsl:call-template name="bangKhachHang" />
        <xsl:call-template name="bangNhanVien" />
        <xsl:call-template name="bangCaLamViec" />
        <xsl:call-template name="bangPhanCong" />
        <xsl:call-template name="bangSanPham" />
        <xsl:call-template name="bangDonHang" />
        <xsl:call-template name="bangChiTietDonHang" />
        <xsl:call-template name="bangHoaDon" />
      </body>
    </html>
  </xsl:template>


  <!-- KHÁCH HÀNG -->
  <xsl:template name="bangKhachHang">
    <h2>Danh sách Khách hàng</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã KH</th>
        <th>Họ tên</th>
        <th>Số điện thoại</th>
        <th>Địa chỉ</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/khachhang">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="khachhang_id" />
          </td>
          <td>
            <xsl:value-of select="hoten" />
          </td>
          <td>
            <xsl:value-of select="sodienthoai" />
          </td>
          <td>
            <xsl:value-of select="diachi" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  <!-- NHÂN VIÊN -->
  <xsl:template name="bangNhanVien">
    <h2>Danh sách Nhân viên</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã NV</th>
        <th>Họ tên</th>
        <th>Chức vụ</th>
        <th>Lương</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/nhanvien">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="nhanvien_id" />
          </td>
          <td>
            <xsl:value-of select="hoten" />
          </td>
          <td>
            <xsl:value-of select="chucvu" />
          </td>
          <td>
            <xsl:value-of select="format-number(luong, '#,###')" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- CA LÀM VIỆC -->
  <xsl:template name="bangCaLamViec">
    <h2>Danh sách Ca làm việc</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã Ca</th>
        <th>Giờ bắt đầu</th>
        <th>Giờ kết thúc</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/calamviec">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="ca_id" />
          </td>
          <td>
            <xsl:value-of select="thoigianbatdau" />
          </td>
          <td>
            <xsl:value-of select="thoigianketthuc" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- PHÂN CÔNG -->
  <xsl:template name="bangPhanCong">
    <h2>Danh sách Phân công</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã NV</th>
        <th>Mã Ca</th>
        <th>Ngày làm</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/phancong">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="nhanvien_id" />
          </td>
          <td>
            <xsl:value-of select="ca_id" />
          </td>
          <td>
            <xsl:value-of select="ngaylam" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  <!-- SẢN PHẨM -->
  <xsl:template name="bangSanPham">
    <h2>Danh sách Sản phẩm</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã SP</th>
        <th>Tên sản phẩm</th>
        <th>Loại</th>
        <th>Mô tả</th>
        <th>Giá</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/sanpham">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="sanpham_id" />
          </td>
          <td>
            <xsl:value-of select="tensanpham" />
          </td>
          <td>
            <xsl:value-of select="loaisanpham" />
          </td>
          <td>
            <xsl:value-of select="mota" />
          </td>
          <td>
            <xsl:value-of select="format-number(gia, '#,###')" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>


  <!-- ĐƠN HÀNG -->
  <xsl:template name="bangDonHang">
    <h2>Danh sách Đơn hàng</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã ĐH</th>
        <th>Mã KH</th>
        <th>Mã NV</th>
        <th>Ngày đặt</th>
        <th>Tổng tiền</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/donhang">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="donhang_id" />
          </td>
          <td>
            <xsl:value-of select="khachhang_id" />
          </td>
          <td>
            <xsl:value-of select="nhanvien_id" />
          </td>
          <td>
            <xsl:value-of select="ngaydat" />
          </td>
          <td>
            <xsl:value-of select="format-number(tongtien, '#,###')" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

  <!-- CHI TIẾT ĐƠN HÀNG -->
  <xsl:key name="kDonHang" match="chitietdonhang" use="donhang_id" />

  <xsl:template name="bangChiTietDonHang">
    <h2>Danh sách Chi tiết đơn hàng</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã ĐH</th>
        <th>Danh sách sản phẩm (Mã SP - Số lượng)</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/chitietdonhang[generate-id() = generate-id(key('kDonHang', donhang_id)[1])]">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="donhang_id" />
          </td>
          <td>
            <xsl:for-each select="key('kDonHang', donhang_id)">
              <xsl:value-of select="concat(sanpham_id, ' (SL: ', soluong, ')')" />
              <xsl:if test="position() != last()">, </xsl:if>
            </xsl:for-each>
          </td>
        </tr>
      </xsl:for-each>

    </table>
  </xsl:template>


  <!-- HÓA ĐƠN -->
  <xsl:template name="bangHoaDon">
    <h2>Danh sách Hóa đơn</h2>
    <table>
      <tr>
        <th>STT</th>
        <th>Mã HĐ</th>
        <th>Mã ĐH</th>
        <th>Ngày lập</th>
        <th>Phương thức thanh toán</th>
      </tr>
      <xsl:for-each select="/quanlyquancaphe/hoadon">
        <tr>
          <td>
            <xsl:value-of select="position()" />
          </td>
          <td>
            <xsl:value-of select="hoadon_id" />
          </td>
          <td>
            <xsl:value-of select="donhang_id" />
          </td>
          <td>
            <xsl:value-of select="ngaylaphoadon" />
          </td>
          <td>
            <xsl:value-of select="phuongthucthanhtoan" />
          </td>
        </tr>
      </xsl:for-each>
    </table>
  </xsl:template>

</xsl:stylesheet>