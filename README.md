# Jeg har problemer med github actions grunnet feilkode Error 3, etter å ha lett lenge finner jeg ingen løsning på dette.
  
  
# StatusCake Monitoring Infrastructure

## Monitoring Configuration Choices

Vår overvåkningsoppsett er konfigurert med følgende betraktninger:

Sjekkeintervaller og Terskelverdier
- Sjekkeintervall: 5 minutter (300 sekunder)
  - Begrunnelse: Gir god balanse mellom rask oppdaging og ressursbruk
  - Hyppig nok til å oppdage problemer raskt
  - Ikke så hyppig at det skaper unødvendig belastning

- Bekreftelsesantall: 3 bekreftelser
  - Reduserer falske alarmer ved å kreve flere mislykkede sjekker
  - Hjelper med å unngå alarmtretthet samtidig som påliteligheten opprettholdes

- Timeout-innstillinger: 20 sekunder
  - Valgt basert på typiske responstider for webapplikasjoner
  - Lang nok til å ta hensyn til tregere forbindelser
  - Kort nok til å oppdage betydelige ytelsesproblem

HTTP Sjekk-konfigurasjon
- SSL-validering: Aktivert
  - Sikrer at SSL-sertifikater er gyldige
  - Kritisk for sikkerhetsovervåking

- Statuskoder: 200, 201, 301, 302
  - Inkluderer både vellykkede svar og gyldige omdirigeringer
  - Imøtekommer vanlige webapplikasjonsmønstre
