<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <html>
            <head>               
                <title>
                    <xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title" />
                </title>
                
                <script src="https://code.jquery.com/jquery-3.2.1.js" crossorigin="anonymous"></script>
                <link rel="stylesheet" type="text/css" href="./mystyleCod.css" />

                <script src="gestoreCod.js"></script>  
            </head>
            <body>  
                <div class="title"><h1>IL DIARIO DI EMANUELE ARTOM</h1></div>
                <div id="intro">  
                    <div id="fileDesc">
                        <xsl:apply-templates select="//tei:fileDesc"/>
                    </div> 
                    
                    <button type="button" class="encoding">La fonte</button>
                    <h2 class="encodingDesc">Il file e la fonte</h2>
                    <div id="encodingDesc" class="encodingDesc">
                        <ul>
                            <xsl:apply-templates select="//tei:encodingDesc"/>
                        </ul>
                    </div>

                    <button type="button" class="profile">Aspetti non-bibliografici</button>
                    <div id="profileDesc">
                        <h2>Aspetti non-bibliografici</h2>
                        <xsl:apply-templates select="//tei:profileDesc"/>
                    </div>
                </div>    

                <div id="content">
                    <div class="pbutton" id="pbutton">
                        <button type="button" class="p" onclick="jump_to('#img70')">70</button>
                        <button type="button" class="p" onclick="jump_to('#img71')">71</button>
                        <button type="button" class="p" onclick="jump_to('#img72')">72</button>
                        <button type="button" class="p" onclick="jump_to('#img73')">73</button>
                        <button type="button" class="p" onclick="jump_to('#img74')">74</button>
                    </div>

                    <table class="legenda">
                        <tr>
                            <th>Legenda</th>
                        </tr>
                        <tr>
                            <td><strike>parola</strike></td>
                            <td>parola o espressione cancellate dall'autore</td>
                        </tr>
                        <tr>
                            <td><mark class="unclear">parola</mark></td>
                            <td>parola o espressione che risultano poco chiare sulla fonte primaria</td>
                        </tr>
                        <tr>
                            <td><mark class="scribble">parola</mark></td>
                            <td>lettera, parola o espressione scarabocchiate</td>
                        </tr>
                        <tr>
                            <td><mark class="ink">parola</mark></td>
                            <td>lettera, parola o espressione coperte da una macchia d'inchiostro</td>
                        </tr>
                        <tr>
                            <td><mark class="foreign">parola</mark></td>
                            <td>parola o espressione appartenenti a una lingua diversa rispetto a quella del testo</td>
                        </tr>
                        <tr>
                            <td><mark class="distinct">parola</mark></td>
                            <td>parola o espressione arcaiche</td>
                        </tr>
                        <tr>
                            <td>(parola)</td>
                            <td>parola errata rispetto all'italiano standard</td>
                        </tr>
                        <tr>
                            <td>_</td>
                            <td>indica il punto in cui la parola presente nella fonte è stata divisa nell'andare a capo</td>
                        </tr>
                        <tr>
                            <td>(...)</td>
                            <td>indica la mancanza della trascrizione di una parola</td>
                        </tr>
                    </table>
                    
                    <xsl:apply-templates select="//tei:text"/>
                </div>       
            </body>
            <footer>
                  <p> Questa applicazione è stata creata da Riccardo Chiari e Adele Stilo nell'anno accademico 2022/2023</p>  
            </footer>
        </html>
    </xsl:template>

    <!--fileDesc-->

    <xsl:template match="tei:titleStmt">
        <h2><b><xsl:value-of select="."/></b></h2>
    </xsl:template>

    <xsl:template match="tei:editionStmt">
        <h3>Responsabilità:</h3>
        <div class="responsibility">
        <p>Codificatori: <xsl:apply-templates select="//tei:name[@xml:id='RC' or @xml:id='AS']"/></p>    
        <p>Coordinatore: <xsl:apply-templates select="//tei:name[@xml:id='AMDG']"/></p>    
        </div>
    </xsl:template>
        <xsl:template match="//tei:name[@xml:id='RC' or @xml:id='AS']">
            <xsl:value-of select="."/><xsl:text> </xsl:text>
        </xsl:template>

    <xsl:template match="tei:publicationStmt">
        <h3>Pubblicazione:</h3>
        <div class="pubblication">
            <p>Luogo: <xsl:value-of select="tei:publisher"/></p>
            <p>Anno: <xsl:value-of select="tei:date"/></p>
            <p><xsl:value-of select="tei:availability"/></p>
        </div>
    </xsl:template>

    <xsl:template match="tei:sourceDesc">
        <h3>La fonte:</h3>
        <div class="source">
            <p><xsl:apply-templates select="//tei:msIdentifier"/></p>
            <p><xsl:apply-templates select="//tei:msContents"/></p>
            <p><xsl:apply-templates select="//tei:physDesc"/></p>
            <p>Storia editoriale:<xsl:apply-templates select="//tei:history"/></p>
        </div>
    </xsl:template>
        <xsl:template match="tei:msIdentifier">
            <p>Luogo: <xsl:value-of select="tei:country"/>, <xsl:value-of select="tei:settlement"/>, <xsl:value-of select="tei:repository"/> </p>
        </xsl:template>
    
        <xsl:template match="tei:msContents">
            <p>Autore: <xsl:value-of select="tei:msItem/tei:author"/></p>
            <p>Titolo: <xsl:value-of select="tei:msItem/tei:title"/></p>
        </xsl:template>

        <xsl:template match="tei:physDesc">
            <p>Descrizione del supporto: il diario consiste di <xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:extent"/></p>
        </xsl:template>

    <!--encodingDesc-->
    
    <xsl:template match="tei:projectDesc">
        <p>Scopo: <xsl:value-of select="."/></p>    
    </xsl:template>

    <xsl:template match="tei:editorialDecl//tei:p">               
                <li><xsl:value-of select="."/></li>
    </xsl:template>

    <xsl:template match="tei:charDecl"> 
        
    </xsl:template>

    <xsl:template match="tei:refsDecl"> 
        <li><xsl:value-of select="."/></li>
    </xsl:template>

    <!--profileDesc-->

    <xsl:template match="tei:particDesc"> 
        <h3>Persone presenti nel testo:</h3>
        <div class="people">
            <u><xsl:apply-templates select="//tei:person/tei:persName"/></u>
            <p>Nato il: <xsl:apply-templates select="//tei:birth"/></p>
            <p>Deceduto il:<xsl:apply-templates select="//tei:death"/></p>
        </div>
    </xsl:template>

    <xsl:template match="tei:langUsage">
       <h3>Varietà linguistiche presenti nel testo:</h3> 
       <div class="language">
        <ul>      
            <xsl:apply-templates select="tei:language"/>
        </ul>
       </div>
    </xsl:template>
        <xsl:template match="tei:language">
            <li><xsl:value-of select="."/></li>
        </xsl:template>

    <xsl:template match="tei:textDesc">
       
    </xsl:template>

    <xsl:template match="tei:settingDesc">
       
    </xsl:template>

    <!--Pagine-->

    <xsl:template match="//tei:certainty">
        <p></p>
    </xsl:template>

    <xsl:template match="tei:dateline">
        <p id="dateline"><xsl:value-of select="."/></p>
    </xsl:template>

    <xsl:template match="//tei:pb[@n='70']">
        <h2 class="pagine">Pagina 70</h2>
        <div class="img" id="img70">
            <img src="p70.jpg"/>        
            <button type="button" class="backup" onclick="jump_to('#pbutton')">Torna su</button>
        </div>
    </xsl:template>

    <xsl:template match="//tei:pb[@n='71']">
        <h2 class="pagine">Pagina 71</h2>
        <div class="img" id="img71">
            <img src="p71.jpg"/>
            <button type="button" class="backup" onclick="jump_to('#pbutton')">Torna su</button>
        </div>
    </xsl:template>

    <xsl:template match="//tei:pb[@n='72']">
        <h2 class="pagine">Pagina 72</h2>
        <div class="img" id="img72">
            <img src="p72.jpg"/>
            <button type="button" class="backup" onclick="jump_to('#pbutton')">Torna su</button>
        </div>
    </xsl:template>

    <xsl:template match="//tei:pb[@n='73']">
        <h2 class="pagine">Pagina 73</h2>
        <div class="img" id="img73">
            <img src="p73.jpg"/>
            <button type="button" class="backup" onclick="jump_to('#pbutton')">Torna su</button>
        </div>
    </xsl:template>

    <xsl:template match="//tei:pb[@n='74']">
        <h2 class="pagine">Pagina 74</h2>
        <div class="img" id="img74">
            <img src="p74.jpg"/>
            <button type="button" class="backup" onclick="jump_to('#pbutton')">Torna su</button>
        </div>
    </xsl:template>

    <xsl:template match="tei:del">
        <strike><xsl:value-of select="."/></strike>
    </xsl:template>

    <xsl:template match="(tei:pc[@type='syllabication'] | tei:g[@type='syllabication'])">
        <text><span class="syll">_</span></text>        
    </xsl:template>
    
    <xsl:template match="tei:unclear[tei:choice/(tei:sic | tei:corr)]">
        <mark class="unclear">
        (<xsl:value-of select="tei:choice/tei:sic"/>)<xsl:text> </xsl:text>        
        <xsl:value-of select="tei:choice/tei:corr"/>
        </mark>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <mark class="unclear">
        <xsl:value-of select="."/>
        </mark>
    </xsl:template>

    <xsl:template match="tei:sic">
        (<xsl:value-of select="."/>)
    </xsl:template>

    <xsl:template match="tei:c[@rend='scribble']">
        <mark class="scribble"><xsl:value-of select="."/></mark>
    </xsl:template>

    <xsl:template match="tei:c[@rend='ink blot']">
        <mark class="ink"><xsl:value-of select="."/></mark>
    </xsl:template>
    
    <xsl:template match="tei:foreign">
        <mark class="foreign"><xsl:value-of select="."/></mark>
    </xsl:template>

    <xsl:template match="tei:distinct">
        <mark class="distinct"><xsl:value-of select="."/></mark>
    </xsl:template>

    <xsl:template match="tei:gap">
        <text>(...)</text>
    </xsl:template>
     

</xsl:stylesheet>