use context starter2024

#første funksjon (oppgave 1-a)

# kontrakt for funksjonen
# nok_to_eur :: (tall i NOK) -> (tall i EUR)
fun nok_til_eur(nok):
  doc: "konverterer norske kroner til euro."
  kurs_euro = 11.84 #valutakurs 06.09.2024
  eur = nok / kurs_euro #deler nok i kursen til euro
  eur # printer ut verdien i euro
  
where:
  nok_til_eur(1184) is 100
  nok_til_eur(118.4) is 10
  nok_til_eur(0) is 0
end

#andre funksjon til dollar (oppgave 1-b)
# kontrakt for funksjonen
# nok_to_usd :: (tall i NOK) -> (tall i USD)

fun nok_til_usd(nok):
  doc: "konverterer norske kroner til amerikansk dollar."
  kurs_usd = 10.7 # valutakursen pr 08.09.2024
  usd = nok / kurs_usd # deler nok i dollarkursen
  usd
where:
  nok_til_usd(1070) is 100
  nok_til_usd(107) is 10
  nok_til_usd(0) is 0
end


#siste oppgave. En funksjon som lar deg velge usd eller euro (eur) ved å bruke if og else uttrykk
#kontrakt for funksjonen
# konverter_valuta :: (tall i NOK, String "EUR eller USD") -> returner valuta eller feilmelding

fun konverter_valuta(nok, valuta):
  doc: "lar deg velge om du vil konvertere til dollar eller euro."
  if valuta == "EUR": #viser om du vil konvertere i euro
    nok_til_eur(nok)
  else if valuta == "USD": # hvis ikke euro får du valg om USD
    nok_til_usd(nok)
  else: 
    raise("ikke gyldyig valuta!")
  end
where:
  konverter_valuta(1184, "EUR") is 100
  konverter_valuta(1070, "USD") is 100
  konverter_valuta(0, "USD") is 0
  konverter_valuta(0, "EUR") is 0
end
