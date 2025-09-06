# BADASS (Bgp At Doors of Autonomous Systems is Simple) 
## TR

Bu proje bize network konusunda genel bilgiler vermeyi amaçlamaktadır. Proje içerisinde GNS3 aracı kullanılarak bir network similasyon ortamı elde edilmeye çalışılıyor ve bu ortamdaki host, router, vxlan, switch araçları kullanılarak ortamın yönetilmesi isteniyor. 3 Parçadan oluşan bu proje aşağıda sizlere iletmiş olduğumuz öğretileri her bir bölümün içinde sunmaktadır.

# Part 1 (P1)
Bu bölümde öğrenilmesi beklenen teknolojiler: GNS3, BGP (Border Gateway Protocol), AS (Autonomous System), BGP, AS, Zebra, IS-IS, router, host, frr

GNS3: Network similasyon uygulamasıdır. Web arayüzüne sahiptir ve 3080 default portu üzerinden erişim sağlanabilir. GNS3 kullanıcılarına açık kaynak - ücretsiz bir ortamın yanı sıra docker, sanal makineler, WMware hatta kendi sanal ortamında geliştirme yapma fırsatı sunuyor. Bu partta docker makinelerin imagelerini build alıp GNS3'de tanımlarını yapmamız kullanmamız için yeterli oldu. Start komutuyla beraber bütün docker containerlarımız ayağa kalkıyordu, GNS3 dockerlarımızın içerisinde kendi sonsuz döngü komutlarını çalıştırdı bu sayede containerlar boş bile olsa düşüş yaşanmıyordu. Ayrıca GNS3 içerisine tanımlamalar yapıldıktan similasyon ortamı internete erişim sağlanacak şekilde ayarlanmamışsa internetle bağlantı olmuyor.

AS (Autonomous System): Bir şirket, ISP (Internet Service Provider), Üniversiteler ve devlet kurumları kendi AS numaralarına sahip olabilirler. AS'lerin tanımlayacı numaraları vardır (ASN = Autonomous System Number) ve bu numaralar global olarak IANA/RIPE gibi kuruluşlar tarafından dağıtılır. AS'ler arasında BGP kullanılarak yönlendirme yapılır. AS'ler internet bölgeleridir, sınırları vardır ve sınırdan çıktığımızda farklı bir bölgenin AS'si içerisine gireriz. her AS'nin kendi içerisinde politikaları değişebilir: hangi rotaları kabul edeceği, hangi trafiği ileteceği veya kısıtlayacağı bu politikalarla tanımlanır. AS'ler internetin şehirleri gibi düşünülebilir.

BGP (Border Gateway Protocol): ISP (Internet Service Provider) BGP aslında bir rehber - harita - yol gösterici adına ne derseniz. Bir DNS sorgusu attığımızda (örneğin www.youtube.com'a gitmek istediğimizde). Başta makine kendi içinde böyle bir Domaini tanıyıp tanımadığına bakar, tanımıyorsa modeme sorar, o da tanımıyorsa ISP'ye en son google'a giderek DNS'in ip değerini bulmaya çalışır. IP değeri elde edildikten sonraki süreçte artık IP'ye gidilecek yol BGP'ye sorulur BGP'de internetimizin şehirlerinden (AS) geçirerek IP'ye ulaşmamızı sağlar.

Zebra: 

IS-IS: 

frr: 

router: 

host: 
