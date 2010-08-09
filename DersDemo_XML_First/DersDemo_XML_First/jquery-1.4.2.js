<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Semte göre Borçlu Listesi</title>

    <script src="jquery-1.4.2.min.js" type="text/javascript"></script>

    <script src="jquery.xmldom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            window.xmlData = $.xmlDOM('<?xml version="1.0" encoding="utf-8" ?><Musteriler><Musteri MusteriID="1234" Semt="Alsancak"><MusteriAdi>ABC Kimya</MusteriAdi><VergiNo>11223344556</VergiNo><Adres>1547 Sk. No:5</Adres><Telefon>232 3657841</Telefon><ToplamBorc>1250</ToplamBorc></Musteri><Musteri MusteriID="1245" Semt="Konak"><MusteriAdi>Reva Yapı</MusteriAdi><VergiNo>22334455667</VergiNo><Adres>2321 Sk. No:123</Adres><Telefon>232 3657857</Telefon><ToplamBorc>250</ToplamBorc></Musteri><Musteri MusteriID="1296" Semt="Bostanlı"><MusteriAdi>Karınca Restorant</MusteriAdi><VergiNo>55447788121</VergiNo><Adres>4564 Cad. 232Sk. No:1</Adres><Telefon>232 4555741</Telefon><ToplamBorc>2475</ToplamBorc></Musteri><Musteri MusteriID="3214" Semt="Bostanlı"><MusteriAdi>Samsunlular Lokali</MusteriAdi><VergiNo>32131213121</VergiNo><Adres>4564 Cad. 245 Sk. No:17</Adres><Telefon>232 4555769</Telefon><ToplamBorc>1750</ToplamBorc></Musteri><Musteri MusteriID="4267" Semt="Konak"><MusteriAdi>Sinanlı Boya</MusteriAdi><VergiNo>12312222321</VergiNo><Adres>2341 Sk. No:12</Adres><Telefon>232 3648757</Telefon><ToplamBorc>368</ToplamBorc></Musteri><Musteri MusteriID="3987" Semt="Alsancak"><MusteriAdi>Kalender Cafe</MusteriAdi><VergiNo>32113122321</VergiNo><Adres>1598 Sk. No21</Adres><Telefon>232 3665545</Telefon><ToplamBorc>1385</ToplamBorc></Musteri></Musteriler>');

            $('Musteriler > Musteri', window.xmlData).each(function(i, item) {
                var semt = $(item).attr('Semt');
                if ($('#ddlSemt option[value=' + semt + ']').length == 0) {
                    $('<option value=' + semt + '>' + semt + '</option>')
                        .appendTo('#ddlSemt');
                }
            });

            $('#ddlSemt').change(function() {
                var semt = $('#ddlSemt').val();
                $('#tListe tr:not(:first):not(:last)').remove();

                $('Musteriler > Musteri[Semt=' + semt + ']', window.xmlData).each(function(i, item) {
                    var item = $(item);
                    $("<tr />")
                        .append($('<td/>').html(item.attr('MusteriID')))
                        .append($('<td/>').html($('MusteriAdi', item).text()))
                        .append($('<td/>').html($('VergiNo', item).text()))
                        .append($('<td/>').html(item.attr('Semt')))
                        .append($('<td/>').html($('Adres', item).text()))
                        .append($('<td/>').html($('Telefon', item).text()))
                        .append($('<td/>').html($('ToplamBorc', item).text()))
                        .appendTo('#tListe');
                });

            });
        });

    </script>

</head>
<body>
    Semt :
    <select id="ddlSemt">
    </select>
    <table id="tListe">
        <thead>
            <tr>
                <th>
                    Müşteri ID
                </th>
                <th>
                    Müşteri Adı
                </th>
                <th>
                    Vergi No
                </th>
                <th>
                    Semt
                </th>
                <th>
                    Adres
                </th>
                <th>
                    Telefon
                </th>
                <th>
                    Toplam Borç
                </th>
            </tr>
        </thead>
        <tbody>
        </tbody>
        <tfoot>
            <tr>
                <td colspan="6" align="right">
                    Toplam :
                </td>
                <td align="right">
                </td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
