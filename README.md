# marmara_eee
To archive documents of eee department.


## Ders arşivi düzeni

Dosyalar Marmara Üniversitesi Elektrik-Elektronik Mühendisliği **2020 müfredatına** göre düzenlenmiştir.

- Zorunlu dersler: `1.sinif/1.donem/DERSKODU_Ders-Adi/Kaynak-Arsiv/…`
- Seçmeli dersler: `Secmeli/Teknik/`, `Secmeli/Teknik-Olmayan/` ve `Secmeli/Fakulte-Teknik/` altında ders koduyla bulunur. Seçmeliler tek bir döneme zorlanmamıştır.
- Kaynak arşiv adları ayrı alt klasörlerde tutulur; yıl, öğretim üyesi ve kaynak içindeki dosya/klasör adları korunur.
- ZIP dosyaları yüklenmez. İç içe ZIP/RAR/7z paketleri de açılır; açılan iç paketler `__acilmis` son ekli klasörlerde bulunur. DOCX/PPTX/XLSX/SLX gibi paket tabanlı özgün dosya biçimleri korunur.
- macOS yardımcı dosyaları (`.DS_Store`, `__MACOSX`, `._*`) dışarıda tutulur ve kayda geçirilir.
- 10 MiB ve üzerindeki özgün dosyalar **Git LFS** ile saklanır. Tam içeriği almak için Git LFS kurulu olmalıdır: `git lfs install`, ardından `git lfs pull`.
- Aynı yoldaki farklı içerikler silinmez; çakışan ada SHA-256 özetinden bir parça eklenir. Yinelenen içerikler kaynak kayıtlarında izlenir.

### Kaynaklar ve doğrulama

[Resmi müfredat](https://ee-eng.marmara.edu.tr/lisans-programi/mufredat) · [MEOBS 2020 müfredatı ve seçmeli dersler](https://meobs.marmara.edu.tr/Mufredat/DersListesi?organizasyonId=597&organizasyonProgramId=824&programMufredatId=4019&mufredatTurId=932001&birimOrganizasyonId=0) · [Drive kaynak klasörü](https://drive.google.com/drive/folders/1odfCPk7PAv7spxp0YWePdwQpEIzrq3_v)

`arsiv-kaydi/kaynaklar.json` ders eşleştirmelerini ve Drive kimliklerini; `dosyalar.json` kaynak iç yollarını, hedef yollarını, özgün boyutları ve SHA-256 özetlerini içerir. `acilan-ic-arsivler.json` ve `aktarilmayanlar.json` iç paketleri ve sistem yardımcı dosyalarını kaydeder. İlerleme `durum.json` dosyasından izlenir.

Java arşivindeki eski **CSE2062** etiketi korunmuştur; arşiv, 2020 müfredatındaki **EE1004 Object-Oriented Programming** dersinin altında yer alır. Computer Network arşivinin **EE4078** eşleştirmesi, içerideki ders izlencesindeki kod ve öğretim üyesiyle doğrulanmıştır.
