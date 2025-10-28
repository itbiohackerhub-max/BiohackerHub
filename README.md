# Repository dei Contenuti - BiohackerHub

Questo repository è un database decentralizzato di "pacchetti di contenuti" per applicazioni di benessere come HealtyPro.

## Architettura a Metadati Ricchi

Il sistema si basa su tre componenti disaccoppiati:

1.  **I Pacchetti (Auto-Descrittivi)**: Ogni pacchetto è una cartella autonoma che contiene, oltre ai file di contenuto (`pasti.json`, etc.), un `manifest.json` arricchito. Il manifest descrive completamente il pacchetto con metadati come titolo, autore, versione, tag e l'immagine di copertina.

2.  **Il Catalogo (`explore.json`)**: Una semplice lista curata di `id` che indica quali pacchetti devono essere messi in evidenza nell'interfaccia "Esplora".

3.  **L'Indice dei Pacchetti (`package-index.json`)**: Una mappa `id` -> `URL`, generata automaticamente, che funge da unico punto di riferimento per localizzare qualsiasi pacchetto nel repository.

---

## Come Creare un Nuovo Pacchetto

1.  **Crea la Struttura**: Dentro `packages/`, crea una struttura di cartelle logica (es. `packages/diet-plans/nome-pacchetto/`).

2.  **Crea il `manifest.json` Arricchito**: Dentro la cartella del pacchetto, crea il `manifest.json`. L'`id` deve essere una stringa semplice e univoca.
    * **Template `manifest.json`**:

            {
              "id": "nome-univoco-del-tuo-pacchetto-v1",
              "title": "Titolo Ufficiale del Pacchetto",
              "description": "Descrizione dettagliata di cosa contiene il pacchetto.",
              "author": "Nome dell'Autore",
              "version": "1.0.0",
              "tags": ["dieta", "principiante"],
              "image": "[https://url.assoluto/per/immagine.jpg](https://url.assoluto/per/immagine.jpg)",
              "protocolUrl": "protocol.md",
              "pastiUrl": "pasti.json",
              "ingredientiUrl": "ingredienti.json",
              "eserciziUrl": null
            }

3.  **Aggiungi i File di Contenuto**: Nella stessa cartella, crea i file a cui il manifest fa riferimento.

4.  **Aggiungi l'ID al Catalogo (Opzionale)**: Se vuoi che il tuo pacchetto sia messo in evidenza, apri `explore.json` e aggiungi il suo `id` all'array.

5.  **Commit e Push**: Fai il commit dei tuoi file. Un processo automatico (GitHub Action) aggiornerà `package-index.json`.