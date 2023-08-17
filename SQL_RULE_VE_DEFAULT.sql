CREATE RULE KURAL_TC as                               /* Ad� KURAL_TC Olan RULE Create Edildi Ve �stenilen RULE'a G�re ��lemler Yap�lmas�n� Zorunlu K�lar.*/
len(@x)=11 and @x like '[1-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0,2,4,6,8]' 
/* �lk Rakam� 1 ila 9 aras�nda Son Rakam Hari� Di�erleri 0-9 Aras�nda ve Son Rakam� �ift Say� Olacak �ekilde Tan�mlanan KURAL_TC Adl� RULE.*/

exec sp_bindrule KURAL_TC,'ogrenci.tckimlik'          /* "ogrenci" Tablosunda "tckimlik" Kolonuna "Rule" Ba�land�.*/

exec sp_unbindrule 'ogrenci.tckimlik'                 /* "ogrenci" Tablosunda "tckimlik" Kolonundan "Rule" Kopar�ld�. E�er �lgili Kolona Ba�l� Birden Fazla RULE Var �se RULE Ad� Girilerek Bu ��lem Yap�lmal�d�r.*/

DROP RULE KURAL_TC                                    /* Ad� Verilen RULE Veri Taban�ndan Kald�r�r.*/

CREATE DEFAULT BILINMEYENTC as 'Bilinmiyor'           /* "BILINMEYENTC" Adl� Ve De�eri "Bilinmiyor" Olan "Default" Create Edildi.*/

exec sp_bindefault BILINMEYENTC,'ogrenci.tckimlik'    /* "ogrenci" Tablosunda "tckimlik" Kolonuna Veri Default Ba�land� Ve Art�k "tckimlik" Kolonu Bo� B�rak�ld���nda Default Devreye Girerek "Bilinmiyor" Yazar.*/

exec sp_unbindefault 'ogrenci.tckimlik'               /* Defaultu Ba�lanan Kolondan Kopar�r, Kopar�lan Default Ad�na Gerek Yoktur. ��nki Her Kolona Sadece 1 Adet Default Atanabilir.*/

DROP DEFAULT BILINMEYENTC                             /* Ad� Verilen Defaultu Veri Taban�ndan Kald�r�r.*/


/*
CREATE RULE KURAL_ADI as Tan�mlanacak_Kural                                                                                                               CREATE   ��LEM�
exec sp_bindrule KURAL_ADI,'TABLO_ADI.KOLON_ADI'                                                                                                          BA�LAMA  ��LEM�
exec sp_unbindrule KURAL_ADI (Kolona Ba�l� Tek Kural Var �se Kural Ad�n� Yazmaya Gerek Yoktur.) 'TABLO_ADI.KOLON_ADI'                                     KOPARMA  ��LEM�
DROP RULE KOLON_ADI                                                                                                                                       KALDIRMA ��LEM�

CREATE DEFAULT DEFAULT_ADI as Tan�mlanacak_Default                                                                                                        CREATE   ��LEM�
exec sp_bindefault DEFAULT_ADI,'TABLO_ADI.KOLON_ADI'                                                                                                      BA�LAMA  ��LEM�     
exec spunbindefault 'TABLO_ADI.KOLON_ADI'                                                                                                                 KOPARMA  ��LEM�
DROP DEFAULT DEFAULT_ADI                                                                                                                                  KALDIRMA ��LEM�
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


CREATE DEFAULT S�f�r as '0'                   
exec sp_bindefault S�f�r,'ogrenci.kangrubuno' 
exec sp_unbindefault 'ogrenci.kangrubuno'     
DROP DEFAULT S�f�r                      


