# [PRD] Receiving from Department

| **Document owner** | Duration | Type  | Release Target | Version | Version Notes |
|----|----|----|----|----|----|
| @[Alwin](mention://a7a0257a-5b37-4c19-b150-11e7a02278f4/user/ee49f247-f293-46c8-a76a-62e52f527235)  | 1 Weeks | `Menu` |    | * Draft 16/10/24 |    |

| Name | Language | Menu Code | Type  | Doc Type  | Doc Abreviation / Shortcode  | Docno template |
|----|----|----|----|----|----|----|
| Receiving from Department | EN |    | menu | Receiving from Department | RDEP | * format = (auto increment 5 digit, reset by month) /(entitycode)/(document month)/RDEP/(document  year)
* example :  00001/BBT/RDEP/11/24 |

## Problem 

## Objective

### Functional Objective


1. Perusahaan dapat melakukan pencatatan pengembalian barang yang tidak jadi dikonsumsi, dari departemen ke gudang

### User Story

| Story | Acceptance Criteria |
|----|----|
| \[Story\] Sebagai Admin saya ingin melakukan pembuatan data Receiving from Department baru | - [ ] Admin dapat membuat  Receiving from Department baru 
- [ ] Validasi mandatory field |
| \[Story\] Sebagai Admin saya ingin melihat detail dari  Receiving from Department yang sudah dibuat sebelumnya  | - [ ] Admin dapat melihat detail dari Receiving from Department  yang sudah dibuat sebelumnya |
| \[Story\] Sebagai Admin saya ingin melakukan perubahan pada data Receiving from Department yang sudah dibuat | - [ ] Admin dapat melakukan perubahan data Receiving from Department berdasarkan master data Receiving from Department yang sudah disimpan sebelumnya
- [ ] Validasi mandatory field |
| \[Story\] Sebagai Admin saya ingin melihat list Receiving from Department yang sudah dibuat sebelumnya | - [ ] Admin dapat menampilkan seluruh data Receiving from Department yang sudah dibuat |
| \[Story\] Sebagai Admin saya ingin melihat history perubahan atas suatu data  Receiving from Department  | - [ ] Admin dapat melihat history perubahan atas suatu data Receiving from Department  |

### Flow Process

User Journey


Business Process

 ![](attachments/adf187c5-c3c1-4039-839a-8923e7782b27.png " =332x266")

### UI/UX

* link Figma : 
* reference **:**

  Receiving Item From Department (Based on DO)

 ![](attachments/8a307c6c-d2d7-4ffb-986d-8f5232d17965.png)

 ![](attachments/a03337a8-38d7-446e-b4ce-7534914b14f9.png)


\
# Requirement Detail

## Menu Receiving from Department

### Requirement

a. Halaman Insert

| **Field/Section** | **Function** | Type | **Requirement Detail** | Setting/Validation |
|----|----|----|----|----|
| **==Header ==** |    |    |    |    |
| Document # | untuk menampilkan document number  | text | * auto generate ketika berhasil save data
  * format = (auto increment 5 digit, reset by month) /(entitycode)/(document month)/MTCS/(document  year)
  * example :  00001/BBT/MTCS/11/24 |    |
| Date | Untuk Input tanggal dokumen  | datepicker | * Mandatory |    |
| Local Document# | Untuk Input dokumen number internal user | text | * free text |    |
| Warehouse | Untuk memilih lokasi warehouse tempat penerimaan barang | select | * Mandatory
* source Warehouse,
* filter: active, Data Access: Warehouse
* label: Warehouse name | * master group → warehouse |
| Department | Untuk memilih department yang mengirimkan barang | select | * Mandatory
* source Department
* filter active, data access: department 
* label: Department name | * master group → department |
| Remark |    | text area | * free text |    |
| Attachment | Untuk upload file attachment | media |    |    |
|    |    |    |    |    |
| additional field 1 | untuk tambahan field yang bisa di configure user (nonrelational data)   |    |    | * tidak ditampilkan pada FE
* Setting additional field 1
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
| additional field 2 | untuk tambahan field yang bisa di configure user (nonrelational data) |    |    | * tidak ditampilkan pada FE
* Setting additional field 2
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
| additional field 3 | untuk tambahan field yang bisa di configure user (nonrelational data) |    |    | * tidak ditampilkan pada FE
* Setting additional field 3
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
|    |    |    |    |    |
| **==Detail==** |    |    |    |    |
| Material Consumption# | untuk memilih dokumen Material Consumption yang menjadi dasar Receiving from Department | button to modal | * multiple select, 
* title : 'List of Material Consumption'* source : dokumen Material Consumption aktif
* Filter: 
  * Data access: Item category, Department
* Filter Option: Item Category (Dropdown), Item (free text), Batch# (free text)
* Field : Item Code, Item Name,  Item Category, Batch, Source, Available DO Quantity, UoM, Remark | * ==Master Group → item's Category : validasi terhadap item yang bisa dipilih berdasarkan item category==  |
| Date | Untuk menampilkan tanggal dokumen Material Consumption | text | * disabled |    |
| Item Code |    | text | * disabled
* value from Item Code |    |
| Item Name |    | text | * disabled
* value from Item Name |    |
| Local Code |    | text | * disabled
* value from Local Code |    |
| Batch |    | text | * disable | * ambil batch di dokumen Material Consumption |
| Available Quantity |    | decimal | * disable | * ambil quantity di dokumen Material Consumption |
| Quantity  |    | decimal | * mandatory
* Ada sum total |    |
| UoM |    | text | * disabled
* value from Item UoM, label UoM name |    |
| Material Consumption's Remark |    | text | * disable | * ambil dari remark di dokumen Material Consumption |
| Remark |    | text | * enable |    |
| additional field 1 | untuk tambahan field yang bisa di configure user (nonrelational data)   |    |    | * tidak ditampilkan pada FE
* Setting additional field 1
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
| additional field 2 | untuk tambahan field yang bisa di configure user (nonrelational data) |    |    | * tidak ditampilkan pada FE
* Setting additional field 2
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
| additional field 3 | untuk tambahan field yang bisa di configure user (nonrelational data) |    |    | * tidak ditampilkan pada FE
* Setting additional field 3
  * Label Name
  * ==Type : freetext, number, checkbox==
  * Length
  * Active non active (default non active) |
|    |    |    |    |    |
| **==Button==** |    |    |    |    |
| Save | Untuk menyimpan data | Button | * Setelah berhasil save akan ke halaman detail data yang di save
* mengupdate Stock summary (stock bertambah)
* Insert Stock Movement, sebagai transaksi penambah stock . Type = Receiving from Department  |    |
| Back | Untuk kembali ke halaman sebelumnya | Button | ke halaman list |    |

b. Halaman detail

| **Field/Section** | **Function** | Type | **Requirement Detail** | Setting/Validation |
|----|----|----|----|----|
| **==Header ==** |    |    |    |    |
| Document # | untuk menampilkan document number  | text | disabled |    |
| Cancel | Untuk menampilkan status cancel sebuah dokumen | check box | disabled   |    |
| Cancel Reason | untuk menampilkan alasan cancel dokumen Receiving from Department | long text | disabled |    |
| Approval Status | untuk menampilkan status approval | text | disabled |    |
| Date | Untuk menampilkan tanggal dokumen  | datepicker | disabled |    |
| Local Document# | Untuk Input dokumen number internal user | text | disabled |    |
| Warehouse | Untuk menampilkan lokasi warehouse yang menerima barang | select | disabled |    |
| Department | Untuk menampilkan department yang mengirim barang | select | disabled |    |
| Remark |    | text area | disabled |    |
| Attachment | Untuk upload file attachment | media | * disabled |    |
| **==Detail==** |    |    |    |    |
| Material Consumption# | Untuk menampilkan nomor dokumen Material Consumption | text | disabled |    |
| Date | Untuk menampilkan tanggal dokumen Material Consumption | text | disabled |    |
| Item Code |    | text | disabled |    |
| Item Name |    | text | disabled |    |
| Local Code |      | text | disabled |    |
| Batch |    | text | disabled |    |
| Available Quantity |    | decimal | * disable |    |
| Quantity  |    | decimal | * disable |    |
| UoM |    | text | * disable |    |
| Material Consumption's Remark |    | text | * disable | * ambil dari remark di dokumen Material Consumption |
| Remark |    | text | disabled |    |
| **==Side Bar==** |    |    |    |    |
| History | Untuk menampilkan log perubahan data  |    |    |    |
| Approval |    |    |    |    |
|    |    |    |    |    |
| **==Button==** |    |    |    |    |
| Add | Untuk menambahkan data  | Button | Direct ke halaman add |    |
| Edit | Untuk merubah data  | Button | Direct ke halaman edit |    |
| History | untuk membuka sidebar History | Button | Menampilkan history perubahan data yang sedang dibuka |    |
| Approval | untuk membuka sidebar approval | Button |    |    |

c. Halaman update 

| **Field/Section** | **Function** | Type | **Requirement Detail** | Setting/Validation |
|----|----|----|----|----|
| **==Header ==** |    |    |    |    |
| Document # | untuk menampilkan document number  | text | * disabled |    |
| Date | Untuk Input tanggal dokumen  | datepicker | * disabled |    |
| Cancel | Untuk menampilkan status cancel sebuah dokumen | check box | * editable | * apabila sudah dicancel maka tidak bisa di uncancel lagi  |
| Cancel Reason | untuk input alasan cancel dokumen Receiving from Department | long text | * disabled → enable apabila cancel di check
* editable
* mandatory apabila cancel di check |    |
| Approval Status | untuk menampilkan status approval | text | disabled |    |
| Local Document# | Untuk Input dokumen number internal user | text | * disabled |    |
| Warehouse | Untuk menampilkan lokasi warehouse yang menerima barang | select | * disabled |    |
| Department | Untuk menampilkan department yang mengirim barang | select | * disabled |    |
| Remark |    | text area | * disabled |    |
| Attachment |    | media attachment | * disabled |    |
|    |    |    | * disabled |    |
| **==Detail==** |    |    |    |    |
| Material Consumption# | Untuk menampilkan nomor dokumen Material Consumption | text | disabled |    |
| Date | Untuk menampilkan tanggal dokumen Material Consumption | text | disabled |    |
| Item Code |    | text | disabled |    |
| Item Name |    | text | disabled |    |
| Local Code |      | text | disabled |    |
| Batch |    | text | * disabled |    |
| Available Quantity |    | decimal | * disable |    |
| Quantity  |    | decimal | * disable |    |
| UoM |    | text | * disabled |    |
| Material Consumption's Remark |    | text | * disable | * ambil dari remark di dokumen Material Consumption |
| Remark |    | text | * disabled |    |
| **==Side Bar==** |    |    |    |    |
| History | Untuk menampilkan log perubahan data  |    |    |    |
| Approval | untuk melihat progress approval |    |    |    |
|    |    |    |    |    |
| **==Button==** |    |    |    |    |
| Save | Untuk menyimpan data | Button | * setelah berhasil save akan ke halaman detail data yang di save |    |
| History | untuk membuka sidebar History | Button | menampilkan history perubahan data yang sedang dibuka |    |
| Approval | untuk melihat progress approval |    |    |    |

**d. halaman list**

Filter Option:

| Category | Field | Type | Defaut Value | Notes |
|----|----|----|----|----|
| Document | Document# | Free text input document number | Null |    |
|    | Date | Date picker Start- End untuk memfilter Document Date | Start : Current Date - 3 MonthEnd : Current Date |    |
|    | Exclude Cancel | Check Box | Checked |    |
| Detail | Warehouse | Dropdown List (multiple check) dari Warehouse yang mempunyai Receiving from Department | Null | *filter by data akses Warehouse* |
|    | Department | Dropdown List (multiple check) dari Vendor yang mempunyai Receiving from Department | Null | *filter by data akses Department* |
| Item | Category | Dropdown List (multiple check) dari Item Category yang mempunyai Receiving from Department | Null | *filter by data akses Item Category* |


**Tabel List :** 

| No | Document# | Date | Cancel | Warehouse | Department | Material Consumption# | Item Name | Batch | Qty | Uom | Document Remark |
|----|----|----|----|----|----|----|----|----|----|----|----|
|    |    |    |    |    |    | *searchable* | *searchable* | *searchable* |    |    | *searchable* |
|    |    |    |    | *filter by data akses Warehouse* | *filter by data akses Department* |    | *filter by data akses Item Category* |    |    |    |    |
| 1 | 0001/BBT/RDEP/11/24 | 12/Nov/24 |    | Gudang Inventaris YK-001 | General Affairs | 0001/BBT/MTCS/11/24 | Besi tipe A | GSS-0001-121124 | 10 | Pcs | Lorem ipsum 2002 |
| 2 | 0054/BBT/RDEP/10/24 | 30/Okt/24 |    | Gudang Inventaris BDO-005 | Produksi | 0012/BBTMTCS/10/24 | Poly wood  | BNR01-0001-301024 | 15 | Meter | Lorem ipsum 2002 |
| 3 | 0054/BBT/RDEP/10/24 | 30/Okt/24 |    | Gudang Inventaris BDO-005 | Sales | 0013/BBT/MTCS/10/24 | Poly bag | BNR01-0001-301024 | 55 | Meter | Lorem ipsum 2002 |
|    |    |    |    |    |    |    |    |    | **80 (SUM)** |    |    |

### Test Case

| **ID Test Case** | **Test Case** | **Category** | **Action** | **Expected Results** |
|:---:|:---:|:---:|:---:|----|
|    | user melakukan save dengan input field secara lengkap dengan data valid | POS | Insert | 1. sukses melakukan save dengan success message tertampil\n2. Redirect ke halaman detail data yang berhasil di save\n3. data yang tertampil di detail sesuai inputan user
4. data stock summary terupdate - menambah dan langsung mengurangi stock 
5. data stock movement terupdate - tercatat transaksi terima barang dan langsung berkurang |
|    | user melakukan save input field mandatory saja dengan data valid | POS | Insert | 1. sukses melakukan save dengan success message tertampil\n2. Redirect ke halaman detail data yang berhasil di save\n3. data yang tertampil di detail sesuai inputan user
4. data stock summary terupdate - menambah dan langsung mengurangi stock 
5. data stock movement terupdate - tercatat transaksi terima barang dan langsung berkurang |
|    | user melakukan save dengan field mandatory date  kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory warehouse  kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory department kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory Vendor kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory currency  kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory detail - price kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user melakukan save dengan field mandatory detail - quantity kosong | NEG | Insert | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user membuka detail data salah satu data | POS | Detail | 1. Detail data berhasil tampil dengan data yang benar di setiap field |
|    | user mebuka history suatu data  | POS | Detail | 1. History data berhasil tampil dengan data yang benar \n2. sidebar history dapat ditutup |
|    | user melakukan edit field editable dengan data valid | POS | Update | 1. sukses melakukan save dengan success message tertampil\n2. Redirect ke halaman detail data yang berhasil di save\n3. data yang tertampil di detail sesuai inputan user
4. data stock summary terupdate
5. data stock movement terupdate - menghapus / hide transaksi Receiving from Department yang telah dicancel |
|    | user melakukan edit data dengan field mandatory tidak terisi | NEG | Update | 1. gagal melakukan save \n2. menampilkan error state dengan message yang tepat\n3. Error message dapat ditutup |
|    | user ke halaman menu dan melihat list data  | POS | List | 1. List data berhasil tampil dengan data yang benar , sesuai dengan default sorting & filter. \n2. Apabla no data akan menampilkan No Data state |
|    | pada halaman list melakukan grouping & sorting list data  | POS | Detail | 1. List data berhasil tampil dengan data yang benar , sesuai filter & grouping. \n2. Apabla no data akan menampilkan No Data state |

## App Setting


:::info
semua app setting yang bisa di configurasi seperti mandatory field, field default value, validasi(yang bisa disetting), option yang bisa diseting di rekap disini

:::


## Titipan Pertanyaan

* Apakah transaksi Material Consumption bisa di tarik lebih dari 1 x ? Jika tidak apakah sudah ada field untuk flaging nya?

  *Jawab : bisa selagi masih aktif dan tidak melebihi quantity yg tersedia*

  Artinya harus menghitung juga, jumlah yang sudah pernah di receiving?

  *Jawab : betul mas*

  \
* Perlu di konfirmasi untuk behavior save stock.

  *Jawab : Save stock ke warehouse sesuai dengan warehouse yg di pilih di header*

  Berarti ini akan menambah quantity ya? soalnya di prd itu mengurangi stock.

  *Jawab : Menambah stock mas, PRD nya salah, sudah tak benerin, sorry*

  \
* Halaman List ada Field Remark yg searchable, ini di ambilkan dari remark header /  detail ?

  *Jawab : Remark Header*

  Noted.

  \
* Obstacle Search & Pagination dependency ke Trans DO Department

  Anternatif Solusi 1. Join ke Table DO Department Item. 2.Ada penambahan field untuk mencatat beberapa field yg akan ikut ke search.
* \


\