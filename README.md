# 🗄️ SQL Server: Rule ve Default Yönetimi

Bu proje, MS SQL Server (T-SQL) üzerinde veri bütünlüğünü sağlamak ve varsayılan değerleri yönetmek amacıyla kullanılan `CREATE RULE` ve `CREATE DEFAULT` işlemlerini örneklerle açıklamaktadır.

# 🎯 Kodun Amacı
Veritabanı yönetiminde, tablolara girilen verilerin belirli formatlara uymasını zorunlu kılmak (**Validation**) ve boş bırakılan alanlara otomatik değer atamak (**Default Value**) için kullanılan prosedürel yöntemleri öğrenmek ve uygulamaktır.

# 🚀 İçerik ve Özellikler

Bu repo içerisinde aşağıdaki T-SQL işlemlerinin örnekleri bulunmaktadır:

## 1. Kurallar (RULES) ile Veri Doğrulama
Veritabanına girilecek verinin belirli şartları sağlayıp sağlamadığını kontrol eder.

* **TC Kimlik No Kontrolü:** 11 haneli olma, ilk hanenin 0 olmaması ve son hanenin çift sayı olması.
* **Puan Aralığı:** Not girişlerinin 0 ile 100 arasında olması zorunluluğu.
* **Ders Kodu Sınırı:** Kodların belirli bir aralıkta (0-8) tutulması.

**Örnek: TC Kimlik Numarası için Kural Oluşturma**
```sql
CREATE RULE KURAL_TC as 
len(@x)=11 and @x like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0,2,4,6,8]'
```
## 2. Varsayılan Değerler (DEFAULTS)
Bir sütuna veri girilmediğinde otomatik olarak atanacak değerleri belirler.

Metin Alanları: Boş geçilen alanlara "Bilinmiyor" yazılması.

Sayısal Alanlar: Boş geçilen sayısal alanlara "0" atanması.

**Örnek: Varsayılan Değer Oluşturma**
```sql
CREATE DEFAULT BILINMEYENTC as 'Bilinmiyor'
```

## 3. Prosedürel İşlemler (Stored Procedures)
Kuralların ve varsayılanların tablolara nasıl bağlanıp koparılacağını gösterir.

* sp_bindrule / sp_unbindrule: Kural bağlama ve koparma.

* sp_bindefault / sp_unbindefault: Default değer bağlama ve koparma.

## 🛠️ Nasıl Kullanılır?
Kodları çalıştırmak için SQL Server Management Studio (SSMS) üzerinde aşağıdaki adımları izleyebilirsiniz:

* Önce CREATE RULE veya CREATE DEFAULT komutlarını çalıştırarak nesneyi oluşturun.

* exec sp_bindrule veya exec sp_bindefault komutları ile oluşturduğunuz nesneyi ilgili tablonun ilgili kolonuna bağlayın.

* Test etmek için tabloya veri girişi yapın (INSERT).

* Kuralı kaldırmak için önce sp_unbindrule ile bağı koparın, sonra DROP RULE ile silin.

* Default değerini kaldırmak için önce sp_unbindefault ile bağı koparın, sonra DROP DEFAULT ile silin.

## ⚠️ Önemli Bilgi
Bu projede kullanılan CREATE RULE ve CREATE DEFAULT komutları, SQL Server'ın eski sürümlerinden (Backward Compatibility) gelen özelliklerdir.

Modern veritabanı mimarilerinde bu yapıların yerine:

* Rule yerine -> CHECK CONSTRAINTS

* Default yerine -> DEFAULT CONSTRAINTS

kullanılması önerilmektedir. Ancak bu proje, T-SQL'in prosedürel geçmişini ve çalışma mantığını anlamak adına oluşturulmuş bir eğitim kaynağıdır. Kodlar güncel SQL Server sürümlerinde de sorunsuz çalışmaktadır.

Bora Avcu - README Updated on 22.11.2025

