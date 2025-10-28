#!/bin/bash

# Abilita l'uscita in caso di errore
set -e

echo "🚀 Inizio creazione struttura repository (con Protocolli MD)..."

# --- Creazione Directory ---
echo "  - Creazione directory..."
mkdir -p packages/diet-plans/strategic-recomposition
mkdir -p packages/training-programs/foundational-strength-5x5

# --- Creazione README.md ---
echo "  - Creazione README.md..."
# (Il contenuto del README è definito sopra, lo script lo inserirebbe qui)
touch README.md
echo "  (Nota: Popola il README.md con le istruzioni fornite separatamente)"

# --- Creazione del Catalogo explore.json ---
echo "  - Creazione catalogo 'explore.json'..."
cat << 'EOF' > explore.json
[
  "strategic-recomposition-v1",
  "foundational-strength-5x5-v1"
]
EOF

# --- Creazione dell'Indice package-index.json ---
echo "  - Creazione 'package-index.json' (placeholder)..."
cat << 'EOF' > package-index.json
{
  "strategic-recomposition-v1": "packages/diet-plans/strategic-recomposition/manifest.json",
  "foundational-strength-5x5-v1": "packages/training-programs/foundational-strength-5x5/manifest.json"
}
EOF

# --- Creazione Pacchetto Ricomposizione Corporea ---
echo "  - Creazione pacchetto 'strategic-recomposition'..."
cat << 'EOF' > packages/diet-plans/strategic-recomposition/manifest.json
{
  "id": "strategic-recomposition-v1",
  "title": "Protocollo Nutrizionale Strategico",
  "description": "Un piano alimentare iperproteico finalizzato alla ricomposizione corporea, con focus sul nutrient timing.",
  "author": "BiohackerHub Community",
  "version": "1.0.0",
  "tags": ["dieta", "ricomposizione-corporea", "iperproteico", "nutrient-timing"],
  "protocolUrl": "protocol.md",
  "pastiUrl": "pasti.json",
  "ingredientiUrl": "ingredienti.json",
  "eserciziUrl": null
}
EOF

cat << 'EOF' > packages/diet-plans/strategic-recomposition/protocol.md
# Protocollo Nutrizionale Strategico

Questo documento definisce i principi operativi del piano alimentare, finalizzato alla ricomposizione corporea attraverso un approccio iperproteico e l'applicazione del nutrient timing.

## 1. Obiettivi Strategici
- **Obiettivo Primario:** Ricomposizione Corporea (riduzione massa grassa, mantenimento/aumento massa muscolare).
- **Target Calorico di Base:** Circa **1600-1800 kcal** nei giorni di riposo o allenamento a bassa intensità.
- **Apporto Proteico Target:** Tra **1.6g e 2.0g** per kg di peso corporeo.

## 2. Regole Fondamentali dei Pasti
- **Struttura Giornaliera:** 3 pasti principali (colazione, pranzo, cena) e 2-3 spuntini.
- **Pasti Principali:** Target di **500-600 kcal**, bilanciati con una fonte proteica, una di carboidrati e una di grassi sani.
- **Flessibilità:** Pranzo e cena sono intercambiabili.
- **Regola dell'Olio:** Aggiungere **10g di Olio Extra Vergine di Oliva** a ogni pranzo e cena. L'olio va omesso solo se il pasto contiene già una fonte di grassi significativa (es. salmone, sgombro/sardine sott'olio).

## 3. Protocollo di Nutrient Timing (Giorni di Allenamento di Forza)
L'apporto nutrizionale si adatta per massimizzare la performance e il recupero.

### Scenario A: Allenamento Mattutino
- **Pre-Workout (20-30 min prima):** Fonte di carboidrati a rapida assimilazione (es. 1 Banana).
- **Post-Workout (entro 60-90 min):** La colazione diventa il pasto di recupero (es. Whey e Banana).

### Scenario B: Allenamento Serale (Post-Cena)
- **Cena (Pasto Pre-Workout, 2-3 ore prima):** Pasto completo e digeribile (es. Petto di Pollo+Pane).
- **Post-Workout (Immediatamente dopo):** Aggiunta di uno shake proteico da **30g di Proteine Isolate**. In questi giorni, le assunzioni nutritive totali diventano sei.

## 4. Strategia degli Spuntini
- **Regola dell'Abbinamento:** Evitare di consumare un macronutriente da solo.
  - **Carboidrati (es. Frutta):** Abbinare sempre a una piccola fonte di grassi/proteine (es. 10-15g di noci/mandorle).
  - **Proteine (es. Fiocchi di Latte):** Abbinare a una piccola fonte di grassi o carboidrati.
- **Spuntino Pre-Nanna (Opzionale ma Raccomandato):** Per ottimizzare il recupero muscolare notturno.
  - **Azione:** Consumare **150-175g di Fiocchi di Latte** o Yogurt Greco da soli.
EOF

# (Creazione dei file pasti.json e ingredienti.json per questo pacchetto)
touch packages/diet-plans/strategic-recomposition/pasti.json
touch packages/diet-plans/strategic-recomposition/ingredienti.json

# --- Creazione Pacchetto Forza 5x5 ---
echo "  - Creazione pacchetto 'foundational-strength-5x5'..."
cat << 'EOF' > packages/training-programs/foundational-strength-5x5/manifest.json
{
  "id": "foundational-strength-5x5-v1",
  "title": "Programma di Forza Fondamentale 5x5",
  "description": "Un piano di allenamento di 8 settimane basato sulla metodologia 5x5 per aumentare la forza di base con esercizi multiarticolari.",
  "author": "BiohackerHub Community",
  "version": "1.0.0",
  "tags": ["allenamento", "forza", "5x5", "bilanciere", "principiante"],
  "protocolUrl": null,
  "pastiUrl": null,
  "ingredientiUrl": null,
  "eserciziUrl": "esercizi.json"
}
EOF

cat << 'EOF' > packages/training-programs/foundational-strength-5x5/esercizi.json
{
  "esercizi": [
    { "id": "strength-squat", "name": "Squat con Bilanciere", "description": "Esercizio fondamentale per le gambe e il core.", "execution_mode": "manual_reps", "defaultSets": 5, "defaultReps": 5, "defaultRest": 120, "defaultWeight": 50 },
    { "id": "strength-bench-press", "name": "Panca Piana", "description": "Esercizio per il petto, spalle e tricipiti.", "execution_mode": "manual_reps", "defaultSets": 5, "defaultReps": 5, "defaultRest": 120, "defaultWeight": 60 }
  ]
}
EOF

echo "✅ Struttura del repository (con protocolli .md) creata con successo!"