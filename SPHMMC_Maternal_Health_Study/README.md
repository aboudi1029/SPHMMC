# SPHMMC Maternal Health Study System

**Study Title:** *Prevalence and Associated Factors of Antepartum Hemorrhage (APH) Among Pregnant Women at St. Paul's Hospital Millennium Medical College (SPHMMC)*  
**Institution:** Africa Medical College · Department of Nursing  
**Study Site:** St. Paul's Hospital Millennium Medical College (SPHMMC), Addis Ababa, Ethiopia  
**Target Sample Size:** $n = 422$ Participants  
**Study Period:** September – December 2026  
**Investigators:** Eman Mubarek (DRCN/014/23), Eman Eskinder (DRCN/013/23), Kalkidan Gezehagn (DRCN/054/23)  
**Academic Advisor:** Bizuayehu Desta, BSc, MPH  

---

## Package Contents

1. **`index.html` / `SPHMMC_Maternal_Health_Check-In___Africa_Medical_College.html`**  
   The complete, standalone, offline-first clinical application. Works in any browser without needing a Node.js server or backend.
2. **`SPHMMC_Supabase_Schema.sql`**  
   The complete, idempotent PostgreSQL schema with Row Level Security (RLS) policies for Supabase.
3. **`README.md`**  
   This documentation and operational guide.

---

## Quick Start & Running the App

### Option A: Local Use (Tablets & Computers)
* Double-click `index.html` or `SPHMMC_Maternal_Health_Check-In___Africa_Medical_College.html` to open it in Chrome, Edge, Safari, or Firefox.
* The app works **100% offline** using the browser's built-in **IndexedDB** database (`SPHMMC_APH_StudyDB`) with automatic `localStorage` synchronization.

### Option B: Cloud Hosting (For Sharing Across Multiple Phones & Tablets)
* Because the app is structured with `index.html`, you can deploy it in 1 minute:
  * **Vercel / Netlify / Cloudflare Pages:** Drag and drop this folder onto the dashboard to get a live HTTPS URL (e.g., `https://sphmmc-maternal.vercel.app`).
  * **GitHub Pages:** Push this folder to a GitHub repository and enable GitHub Pages under *Settings > Pages*.

---

## Investigator & Admin Portal

* **Passcode:** `AMC2026`
* **Access Methods:**
  1. Append `#admin` to the URL in the browser address bar.
  2. Keyboard shortcut: `Ctrl + Shift + A` (or `Cmd + Shift + A` on Mac).
  3. Secret triple-tap/click on the study footer mark: *"Africa Medical College · Department of Nursing · SPHMMC Study 2026"*.

### Admin Features
* **Real-Time KPIs:** Enrolled count vs 422 target, APH prevalence rate with 95% Wilson Score Confidence Interval, Mean Maternal Age ± SD, Advanced Maternal Age (≥35 yrs), Mean ANC Visits, Referral %, Urban vs Rural ratio.
* **Epidemiological Visualizations (Chart.js):** APH prevalence breakdown, risk factors ranking, clinical symptoms frequency, and ANC presentation trimester.
* **Raw Data Management:** Real-time search by code or collector, APH and residence filtering, full per-participant modal viewer, individual record deletion.
* **Formal Medical Analysis Report:** Auto-generates publication-ready **Table 1** (Socio-demographic & Obstetric profile) and **Table 2** (Clinical Presentation & APH Symptoms), with instant browser printing (`window.print()`), HTML report download, and executive summary copying.
* **Data Portability:** Export to CSV (formatted for EpiData v3.1 / SPSS v27), JSON backup export/import, and a 30-case sample cohort seeder for demonstration.

---

## Supabase Cloud Database Integration

* **Database Engine:** PostgreSQL via Supabase
* **Target Table:** `sphmmc_maternal_records`
* **Project URL:** `https://nldfrimhlmnnpyisegi.supabase.co`

### How Multi-Device Cloud Sync Works:
1. Open the Admin Portal (`AMC2026`) $\rightarrow$ navigate to the **"Database & Protocol"** tab.
2. In the **"Supabase Cloud Database & Multi-Collector Sync"** card:
   * Verify your **Supabase Project URL** (`https://nldfrimhlmnnpyisegi.supabase.co`).
   * Enter your **Supabase Publishable Key** (`sb_publishable_...`).
   * Table name: `sphmmc_maternal_records`.
   * Click **"Test Connection"** $\rightarrow$ verifies connectivity with a green badge.
   * Click **"Save Cloud Configuration"**.
3. **Automatic Push:** When enabled, every check-in completed on a clinic tablet is saved locally and instantly sent to Supabase if connected to the internet.
4. **Cloud Sync:** Investigators can click the **"Cloud Sync"** button in the Admin header anytime to merge records collected across all tablets into one unified database.

---

## Clinical Data Dictionary (Variables Collected)

| Variable Code | Clinical Variable Name | Type / Values |
| :--- | :--- | :--- |
| **`code`** | Anonymous Participant Study Code | Text (e.g., `SPH-2026-001-42`) |
| **`collector`** | Data Collector / Midwife Name | Text (Optional) |
| **`language`** | Survey Language | `English` / `Amharic` |
| **`A1_Age`** | Maternal Age (completed years) | Numeric (14–55) |
| **`A2_Marital`** | Marital Status | Married, Single, Divorced, Widowed, Separated |
| **`A3_Education`** | Highest Educational Level | Illiterate, Literate, Primary, Secondary, College/Univ |
| **`A4_Occupation`**| Maternal Occupation | Housewife, Farmer, Merchant, Gov, Private, Student, Other |
| **`A5_Residence`** | Residence Area | Urban / Rural |
| **`A6_Income`** | Monthly Household Income | Numeric (ETB) |
| **`B1_Gravidity`**| Total Pregnancies (incl. current)| Numeric ($\ge 1$) |
| **`B2_Parity`** | Previous Births ($>28$ weeks) | Numeric ($\ge 0$) |
| **`B3_ANC`** | ANC Visits in Current Pregnancy | Numeric ($\ge 0$) |
| **`B4_PrevAPH`** | Previous History of APH | Yes / No |
| **`B5_PrevCS`** | Previous Cesarean Delivery | Yes / No |
| **`B6_Abortion`**| History of Abortion ($<28$ wks) | Yes / No |
| **`B7_Stillbirth`**| History of Stillbirth ($>28$ wks)| Yes / No |
| **`C1_ChronicHTN`**| Chronic Hypertension | Yes / No |
| **`C2_Preeclampsia`**| Preeclampsia / Gestational HTN | Yes / No |
| **`C3_Diabetes`**| Diabetes Mellitus | Yes / No |
| **`C4_Multiple`** | Multiple Gestation (Twins+) | Yes / No |
| **`D1_Presentation`**| Gestational Trimester at 1st ANC | 1st, 2nd, or 3rd Trimester |
| **`D2_Referral`** | Referral Status to SPHMMC | Yes / No |
| **`E1_APH`** | Antepartum Hemorrhage Status | **Yes / No** *(Primary Outcome)* |
| **`E2_Onset`** | Bleeding Onset | Sudden / Gradual *(if APH Yes)* |
| **`E3_Amount`** | Bleeding Volume | Spotting, Moderate, Heavy *(if APH Yes)* |
| **`E4_Color`** | Bleeding Color | Bright Red, Dark Red, Brownish *(if APH Yes)* |
| **`E5_Duration`** | Duration of Bleeding | Numeric + Units (Hours/Days/Weeks) |
| **`E6_Recurrence`**| Recurrent Bleeding Episodes | Yes / No *(if APH Yes)* |
| **`E7_Pain`** | Associated Abdominal / Back Pain| Yes / No *(if APH Yes)* |
| **`E8_PainSeverity`**| Pain Intensity | Mild / Severe *(if Pain Yes)* |
| **`F1_Tenderness`**| Uterine Tenderness to Palpation| Yes / No *(Abruptio feature)* |
| **`F2_Contractions`**| Uterine Hypertonicity / Rigid | Yes / No *(Abruptio feature)* |
| **`F3_FetalMove`** | Fetal Movement Status | Normal, Decreased, Increased, Absent |
| **`F4_Dizziness`** | Dizziness / Syncope | Yes / No *(Hypovolemia sign)* |
| **`F5_Palpitations`**| Tachycardia / Palpitations | Yes / No *(Hypovolemia sign)* |
| **`F6_SOB`** | Dyspnea / Shortness of Breath | Yes / No |
| **`F7_Nausea`** | Nausea / Vomiting | Yes / No |
| **`F8_Fever`** | Maternal Pyrexia / Fever | Yes / No *(Infection feature)* |

---
*Developed for Africa Medical College Department of Nursing & SPHMMC Maternal Health Research.*
