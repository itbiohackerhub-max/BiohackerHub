<div align="center">
  <h1>BiohackerHub</h1>
  <p>
    <strong>Condividi, Scopri, Evolvi.</strong>
  </p>
  <p>
    Un archivio open-source di protocolli di benessere, progettato per essere la fonte di conoscenza per applicazioni di biohacking e self-improvement.
  </p>
</div>

---

## Il Progetto

**BiohackerHub** è una libreria collaborativa per chiunque sia interessato al miglioramento personale attraverso i dati. Crediamo che la conoscenza sul benessere debba essere aperta, accessibile e strutturata.

### A Cosa Serve?

Questo repository raccoglie "pacchetti di contenuti" — protocolli completi di dieta e allenamento — in un formato standardizzato (JSON). Lo scopo è duplice:
1.  **Per gli Utenti**: Offrire una fonte affidabile di piani pronti all'uso da scoprire e importare in applicazioni compatibili (come **The Human OS**).
2.  **Per gli Sviluppatori**: Fornire un database di contenuti decentralizzato e facile da integrare per alimentare la sezione "Esplora" delle proprie app di fitness e benessere.

### Cos'è un "Pacchetto di Contenuti"?

È una semplice cartella contenente file di testo strutturati (`.json`) che definiscono un intero protocollo: gli ingredienti, i pasti, gli esercizi e le regole che li legano. Chiunque può contribuire creando un nuovo pacchetto.

## Architettura Tecnica Decentrata

Il sistema è progettato per la massima flessibilità e si basa su tre componenti chiave:

1.  **I Pacchetti**: Cartelle autonome contenenti i file di contenuto (`pasti.json`, `esercizi.json`, ecc.) e un `manifest.json` che descrive il pacchetto con un `id` univoco.

2.  **Il Catalogo (`explore.json`)**: Un singolo file che elenca i pacchetti disponibili per la scoperta. Contiene solo i metadati necessari per l'interfaccia utente (titolo, descrizione, immagine).

3.  **L'Indice dei Pacchetti (`package-index.json`)**: Un file **generato automaticamente** che mappa ogni `id` di pacchetto al suo URL completo. Funge da unica fonte di verità per localizzare i contenuti.

### Flusso Dati

1.  Un'applicazione client scarica `explore.json` per renderizzare la sua galleria "Esplora".
2.  L'utente sceglie un pacchetto dalla galleria.
3.  L'app scarica `package-index.json` da questo repository.
4.  Usando l'`id` del pacchetto scelto, l'app trova l'URL del `manifest.json` corrispondente nell'indice.
5.  L'app scarica il `manifest.json` e, da lì, tutti i file di contenuto a cui fa riferimento, importando il protocollo.

---

## Come Contribuire con un Nuovo Pacchetto

Unisciti alla community e condividi la tua conoscenza. Il processo è semplice e trasparente.

#### **Passo 1: Crea la Struttura del Pacchetto**
In `packages/`, crea una cartella per il tuo protocollo (es. `packages/protocols/nome-protocollo/`).

#### **Passo 2: Crea il `manifest.json`**
All'interno della tua cartella, crea il file `manifest.json`. **L' `id` deve essere unico in tutto il repository.**

* **Template `manifest.json`**:
    ```json
    {
      "id": "nome-univoco-del-protocollo",
      "pastiUrl": "pasti.json",
      "ingredientiUrl": "ingredienti.json",
      "eserciziUrl": "esercizi.json"
    }
    ```

#### **Passo 3: Aggiungi i File di Contenuto**
Nella stessa cartella, crea i file a cui il manifest fa riferimento, seguendo lo schema richiesto.

#### **Passo 4: Aggiungi al Catalogo `explore.json`**
Apri `explore.json` alla radice del repository e aggiungi un nuovo oggetto per il tuo pacchetto, usando lo stesso `id`.

* **Template `explore.json`**:
    ```json
    [
      {
        "id": "nome-univoco-del-protocollo",
        "title": "Titolo Accattivante per l'UI",
        "description": "Descrizione del protocollo.",
        "image": "[https://url.assoluto/per/immagine.jpg](https://url.assoluto/per/immagine.jpg)"
      }
    ]
    ```

#### **Passo 5: Commit e Push**
Esegui il commit dei tuoi file. Una GitHub Action si occuperà di convalidare il tuo contributo e aggiornare automaticamente `package-index.json`.
