use context starter2024
# Kontrakt circle(Number, String, String)  Image

#Definere sirkler som skal bli brukt i oppgaven
blue = circle(30, "outline", "blue")
yellow = circle(30, "outline", "yellow")
black = circle(30, "outline", "black")
green = circle(30, "outline", "green")
red = circle(30, "outline", "red")

# lage en bakgrunn for figuren
background = empty-scene(400, 200)

#definere ringenes plassering
rings_over = beside(blue, beside(black, red)) #LEGGE SAMMEN DE ØVRE RINGENE

rings_under = beside(yellow, green) # LEGGE SAMMEN DE NEDRE RINGENE

fun ol_flagget_farge():
  doc: "lager Farget OL flagg"
  scene1 = put-image(rings_over, 150, 170, background)
  farget_flagg = put-image(rings_under, 150, 125, scene1)
  farget_flagg
end
ol_flagget_farge()
check:
ol_flagget_farge() is ol_flagget_farge()
end

#Lage en ny bakgrunn for monokromt OL-flagg
background2 = empty-scene(400, 200)

# definere svarte ringers plassering
black_over = beside(black, beside(black, black))
black_under = beside(black, black)

fun monokromt_ol_flagg(): #Funksjon for det svarte OL - Flagget
  doc: "Lager et monokromt Ol-flagg"
  scene2 = put-image(black_over, 150, 170, background2)
  monokromt_flagg = put-image(black_under, 150, 125,  scene2)
  monokromt_flagg
end
  monokromt_ol_flagg()
check:
  monokromt_ol_flagg() is monokromt_ol_flagg()
end
  
# Lage algoritmen/funksjonen som lar brukeren velge mellom farget og svart OL-flagg # Kontrakt == velg_farge :: («Farget», «Svart»)  
#returner farge / feilmelding 
fun velg_farge(farge, flagg): 
  doc: "Lar brukeren velge mellom farget og svart OL-Flagg." 
  if farge == "Farget": 
    ol_flagget_farge() 
  else if farge == "Svart":
  monokromt_ol_flagg() 
  else: 
  raise("Feilmelding!") 
  end
end
