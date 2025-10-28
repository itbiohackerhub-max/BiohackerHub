# Repository dei Contenuti per BiohackerHub

Questo repository serve come database centrale per i "pacchetti di contenuti" utilizzati dall'applicazione BiohackerHub.

## Architettura Decentrata

Il sistema si basa su tre componenti principali per garantire massima flessibilità e manutenibilità:

1.  **I Pacchetti**: Ogni pacchetto è una cartella autonoma che contiene i file di contenuto (`pasti.json`, `ingredienti.json`, etc.) e un file `manifest.json`. Il manifest descrive il pacchetto e gli assegna un `id` univoco, ma **non contiene alcuna informazione sulla sua posizione**.

2.  **Il Catalogo (`explore.json`)**: Un singolo file alla radice del repository che definisce quali pacchetti mostrare nell'interfaccia "Esplora" dell'app. Contiene solo metadati per la visualizzazione (titolo, descrizione, immagine) e l'`id` del pacchetto a cui si riferisce. **Non contiene percorsi o URL**.

3.  **L'Indice dei Pacchetti (`package-index.json`)**: Questo file, anch'esso alla radice, è **generato automaticamente** da un processo esterno (es. una GitHub Action). È l'unica fonte di verità che mappa l'`id` di un pacchetto al suo URL pubblico completo. L'applicazione userà questo file per risolvere la posizione di un pacchetto quando un utente decide di importarlo.

### Flusso Dati

1.  L'app scarica `explore.json` per renderizzare la galleria di card.
2.  L'utente clicca "Aggiungi" su una card.
3.  L'app ottiene l'`id` dalla card.
4.  L'app scarica `package-index.json`.
5.  L'app cerca l'`id` nell'indice e trova l'URL completo del `manifest.json`.
6.  L'app scarica il `manifest.json` e procede con l'importazione dei contenuti.

---

## Come Creare un Nuovo Pacchetto

1.  **Crea la Struttura**: Dentro `packages/`, crea una struttura di cartelle logica (es. `packages/diet-plans/nome-del-tuo-pacchetto/`).

2.  **Crea il `manifest.json`**: Dentro la cartella del pacchetto, crea il `manifest.json`. **È fondamentale che l' `id` sia univoco in tutto il repository.**
    * **Template `manifest.json`**:

            {
              "id": "nome-univoco-del-tuo-pacchetto",
              "pastiUrl": "pasti.json",
              "ingredientiUrl": "ingredienti.json",
              "eserciziUrl": null
            }

3.  **Aggiungi i File di Contenuto**: Nella stessa cartella, crea i file `pasti.json`, `ingredienti.json` etc., come referenziati nel manifest.

4.  **Aggiungi il Pacchetto al Catalogo**: Apri `explore.json` e aggiungi un nuovo oggetto per il tuo pacchetto, usando l' `id` che hai definito nel manifest.
    * **Template `explore.json`**:

            [
              {
                "id": "nome-univoco-del-tuo-pacchetto",
                "title": "Titolo Accattivante per l'UI",
                "description": "Descrizione del pacchetto.",
                "image": "[https://url.assoluto/per/immagine.jpg](https://url.assoluto/per/immagine.jpg)"
              }
            ]

5.  **Commit e Push**: Fai il commit dei tuoi file. La GitHub Action (o un altro processo di build) si occuperà di scansionare il repository, trovare il tuo nuovo `manifest.json` e aggiornare automaticamente il file `package-index.json`.
