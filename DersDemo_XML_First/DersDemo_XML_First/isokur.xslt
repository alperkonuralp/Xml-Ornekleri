<?xml version="1.0" encoding="iso-8859-9" ?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:decimal-format name="eurofrmt" decimal-separator="." grouping-separator=","/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>TCMB Kurlar Sayfası</title>
            </head>
            <style>
                body { FONT-SIZE: medium; COLOR: #003663; FONT-FAMILY: tahoma COLOR: #000080; }
                td.para { background-color: #99cccc; color: #000000; font-weight:bold; font-size: 10px; text-align: left;letter-spacing: 0.2em }
                td.deger { background-color: #ffffcc;color: #000000; font-size: 11px; text-align: right;letter-spacing: 0.1em }
                th { background-color: #995555;color: #FFFFFF; font-size: 11px; text-align: center;letter-spacing: 0.1em }

            </style>
            <body background="http://www.tcmb.gov.tr/pictures/back6.gif">
                <B>
                    <xsl:value-of select="Tarih_Date/@Tarih" />
                    GÜNÜ SAAT 15:30'DA BELİRLENEN GÖSTERGE NİTELİĞİNDEKİ
                    <BR />
                    TÜRKİYE CUMHURİYET MERKEZ BANKASI KURLARI
                </B>
                <BR/>

                <I>
                    Indicative Exchange Rates Announced at 15:30 on  <xsl:value-of select="Tarih_Date/@Date" /> by the Central Bank of Turkey
                </I>

                <table border="0">
                    <th>
                        Döviz Kodu<br/><i>Currency Code</i>
                    </th>
                    <th>
                        Birim<br/><i>Unit</i>
                    </th>
                    <th>
                        Döviz Adı<br/><i>Currency Name</i>
                    </th>
                    <th>
                        Döviz Alış<br/><i>Forex Buying</i>
                    </th>
                    <th>
                        Döviz Satış<br/><i>Forex Selling</i>
                    </th>
                    <th>
                        Efektif Alış<br/><i>Banknote Buying</i>
                    </th>
                    <th>
                        Efektif Satış<br/><i>Banknote Selling</i>
                    </th>
                    <xsl:for-each select="Tarih_Date/Currency">

                        <xsl:if test="@Kod!='XDR'">
                            <xsl:if test="ForexBuying&gt;'0'">

                                <tr>
                                    <td class="para">
                                        <xsl:value-of select="@Kod" />
                                    </td>
                                    <td class="para">
                                        <xsl:value-of select="Unit" />
                                    </td>

                                    <td class="para">
                                        <xsl:value-of select="Isim" />-
                                        <i>
                                            <xsl:value-of select="CurrencyName" />
                                        </i>
                                    </td>

                                    <td class="deger">
                                        <xsl:if test="ForexBuying&gt;'0'">
                                            <xsl:value-of select="ForexBuying" />
                                        </xsl:if>
                                    </td>
                                    <td class="deger">

                                        <xsl:if test="ForexSelling&gt;'0'">
                                            <xsl:value-of select="ForexSelling" />
                                        </xsl:if>
                                    </td>
                                    <td class="deger">
                                        <xsl:if test="BanknoteBuying&gt;'0'">
                                            <xsl:value-of select="BanknoteBuying" />
                                        </xsl:if>
                                    </td>
                                    <td class="deger">

                                        <xsl:if test="BanknoteSelling&gt;'0'">
                                            <xsl:value-of select="BanknoteSelling" />
                                        </xsl:if>
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                </table>

                <table>
                    <th colspan="4">
                        Çapraz Kurlar<br/><i>Cross Rates</i>
                    </th>
                    <xsl:for-each select="Tarih_Date/Currency">

                        <xsl:if test="CrossRateUSD&gt;'0'">
                            <xsl:if test="@Kod!='USD'">
                                <tr>
                                    <td class="para">
                                        <xsl:value-of select="@Kod" />/USD
                                    </td>
                                    <td class="para">1 AMERIKAN DOLARI</td>

                                    <td class="deger">
                                        <xsl:value-of select="CrossRateUSD" />
                                    </td>
                                    <td class="deger">
                                        <xsl:value-of select="Isim" />
                                    </td>
                                </tr>
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>
                    <xsl:for-each select="Tarih_Date/Currency">
                        <xsl:if test="@Kod!='XDR'">
                            <xsl:if test="CrossRateOther&gt;'0'">
                                <tr>
                                    <td class="para">
                                        USD/<xsl:value-of select="@Kod" />
                                    </td>

                                    <td class="para">
                                        1 <xsl:value-of select="Isim" />
                                    </td>
                                    <td class="deger">
                                        <xsl:value-of select="CrossRateOther" />
                                    </td>
                                    <td class="deger">AMERIKAN DOLARI</td>
                                </tr>
                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>
                </table>
                <table>
                    <tr>
                        <th colspan="4">Euro Dönüşüm Kurları;</th>
                    </tr>

                    <xsl:for-each select="Tarih_Date/Currency">
                        <xsl:if test="CrossRateEuro&gt;='0'">
                            <tr>
                                <td class="para">
                                    <xsl:value-of select="@Kod" />/EUR
                                </td>
                                <td class="para">1 EURO</td>
                                <td class="deger">
                                    <xsl:value-of select="CrossRateEuro" />
                                </td>
                                <td class="deger">
                                    <xsl:value-of select="Isim" />
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>

                </table>
                <table>
                    <th colspan="4">Bilgi İçin;</th>
                    <xsl:for-each select="Tarih_Date/Currency">
                        <xsl:if test="@Kod='XDR'">
                            <tr>
                                <td class="para">TRL/SDR</td>
                                <td class="para">
                                    1<xsl:value-of select="Isim" />(SDR)
                                </td>
                                <td class="deger">
                                    <xsl:value-of select="ForexBuying" />
                                </td>

                                <td class="deger">TÜRK LİRASI</td>
                            </tr>
                            <tr>
                                <td class="para">USD/SDR</td>
                                <td class="para">
                                    1<xsl:value-of select="Isim" />(SDR)
                                </td>
                                <td class="deger">
                                    <xsl:value-of select="CrossRateOther" />
                                </td>
                                <td class="deger">AMERIKAN DOLARI</td>
                            </tr>

                        </xsl:if>

                    </xsl:for-each>
                </table>

                <font Size="1">
                    Not: Deneme Aşamasındadır. Lütfen önerilerinizi
                    <a href="mailto:webmaster@tcmb.gov.tr">Webmaster</a>
                    'a gönderiniz
                </font>
            </body>
        </html>

    </xsl:template>
</xsl:transform>