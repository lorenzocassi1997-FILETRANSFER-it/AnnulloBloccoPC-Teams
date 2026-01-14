# AnnulloBloccoPC-Teams
Script leggero e portatile per mantenere il PC attivo e lo stato "Disponibile" (Verde) su Teams/Slack simulando attività invisibile. Utile se il pc vi si blocca mentre leggete documentazione!

## Caratteristiche
- **Non invasivo:** Non apre finestre pop-up (niente più Notepad).
- **Sicuro:** Usa il tasto virtuale F15 invece di CTRL, così non interferisce con la tua scrittura o il copia-incolla.
- **Portable:** Un singolo file `.bat` che non richiede installazione.

## Come usare
1. Scarica il file `Annullo_Blocco.bat`.
2. Fai doppio clic per avviarlo.
3. Lascia la finestra nera ridotta a icona.
4. Per fermarlo: chiudi semplicemente la finestra nera.

**Nota Tecnica:** Lo script simula un input hardware a basso livello tramite `user32.dll`, rendendolo indistinguibile dall'attività reale per la maggior parte dei software di monitoraggio inattività.
