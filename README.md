# 🗺️ Téléportation Rapide – ESX + ox_lib

Ce script ajoute un menu de **voyage rapide** accessible via un marqueur sur la carte. Les joueurs peuvent se téléporter vers plusieurs lieux (Cayo Perico, Hôpital, Commissariat, etc.) moyennant un paiement configurable.

---

## ⚙️ Fonctionnalités

- 📍 Téléportation vers 4 lieux personnalisables
- 💰 Coût de téléportation configurable via un `TriggerServerEvent`
- ⏳ Animation de chargement via `ox_lib.progressCircle`
- 💬 Dialogue de confirmation (`lib.alertDialog`)
- ✅ Notification de succès
- 🎯 Activation via un marqueur + touche (`E` par défaut)

---

## 🛠️ Installation

1. Place le script dans ton dossier `resources/`
2. Ajoute à ton `server.cfg` :
   ```bash
   ensure ynk_quickTrip

---

## 🔌 Dépendances

Ressource	Description
ox_lib	UI (menu, alert, notifications)
es_extended	Pour le paiement côté serveur

-- 

## 🧠 Fonctionnement

Le joueur s'approche du point de téléportation

Il appuie sur E (ou autre touche configurée)

Un menu ox_lib s'ouvre avec différentes destinations

Chaque destination déclenche :

Un dialogue de confirmation

Un retrait d’argent 

Une téléportation

Une notification de succès

---

## 🔐 Licence
Ce script est fourni à titre communautaire. Toute revente sans autorisation explicite est interdite.
