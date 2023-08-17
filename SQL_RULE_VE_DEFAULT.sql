CREATE RULE KURAL_TC as                               /* Adý KURAL_TC Olan RULE Create Edildi Ve Ýstenilen RULE'a Göre Ýþlemler Yapýlmasýný Zorunlu Kýlar.*/
len(@x)=11 and @x like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0,2,4,6,8]' 
/* Ýlk Rakamý 1 ila 9 arasýnda Son Rakam Hariç Diðerleri 0-9 Arasýnda ve Son Rakamý Çift Sayý Olacak Þekilde Tanýmlanan KURAL_TC Adlý RULE.*/

exec sp_bindrule KURAL_TC,'ogrenci.tckimlik'          /* "ogrenci" Tablosunda "tckimlik" Kolonuna "Rule" Baðlandý.*/

exec sp_unbindrule 'ogrenci.tckimlik'                 /* "ogrenci" Tablosunda "tckimlik" Kolonundan "Rule" Koparýldý. Eðer Ýlgili Kolona Baðlý Birden Fazla RULE Var Ýse RULE Adý Girilerek Bu Ýþlem Yapýlmalýdýr.*/

DROP RULE KURAL_TC                                    /* Adý Verilen RULE Veri Tabanýndan Kaldýrýr.*/

CREATE DEFAULT BILINMEYENTC as 'Bilinmiyor'           /* "BILINMEYENTC" Adlý Ve Deðeri "Bilinmiyor" Olan "Default" Create Edildi.*/

exec sp_bindefault BILINMEYENTC,'ogrenci.tckimlik'    /* "ogrenci" Tablosunda "tckimlik" Kolonuna Veri Default Baðlandý Ve Artýk "tckimlik" Kolonu Boþ Býrakýldýðýnda Default Devreye Girerek "Bilinmiyor" Yazar.*/

exec sp_unbindefault 'ogrenci.tckimlik'               /* Defaultu Baðlanan Kolondan Koparýr, Koparýlan Default Adýna Gerek Yoktur. Çünki Her Kolona Sadece 1 Adet Default Atanabilir.*/

DROP DEFAULT BILINMEYENTC                             /* Adý Verilen Defaultu Veri Tabanýndan Kaldýrýr.*/


/*
CREATE RULE KURAL_ADI as Tanýmlanacak_Kural                                                                                                               CREATE   ÝÞLEMÝ
exec sp_bindrule KURAL_ADI,'TABLO_ADI.KOLON_ADI'                                                                                                          BAÐLAMA  ÝÞLEMÝ
exec sp_unbindrule KURAL_ADI (Kolona Baðlý Tek Kural Var Ýse Kural Adýný Yazmaya Gerek Yoktur.) 'TABLO_ADI.KOLON_ADI'                                     KOPARMA  ÝÞLEMÝ
DROP RULE KOLON_ADI                                                                                                                                       KALDIRMA ÝÞLEMÝ

CREATE DEFAULT DEFAULT_ADI as Tanýmlanacak_Default                                                                                                        CREATE   ÝÞLEMÝ
exec sp_bindefault DEFAULT_ADI,'TABLO_ADI.KOLON_ADI'                                                                                                      BAÐLAMA  ÝÞLEMÝ     
exec spunbindefault 'TABLO_ADI.KOLON_ADI'                                                                                                                 KOPARMA  ÝÞLEMÝ
DROP DEFAULT DEFAULT_ADI                                                                                                                                  KALDIRMA ÝÞLEMÝ
*/

CREATE RULE limit
as
@x>=0 and @x<=8

exec sp_bindrule limit,'ogrenci.derskod'
exec sp_unbindrule 'ogrenci.derskod'
DROP RULE limit

CREATE RULE PUAN as 
@not>=0 and @not<=100                            

exec sp_bindrule PUAN,'ogrenci.bno'                      
exec sp_unbindrule 'ogrenci.bno'        


CREATE DEFAULT Sýfýr as '0'                   
exec sp_bindefault Sýfýr,'ogrenci.kangrubuno' 
exec sp_unbindefault 'ogrenci.kangrubuno'     
DROP DEFAULT Sýfýr                      


