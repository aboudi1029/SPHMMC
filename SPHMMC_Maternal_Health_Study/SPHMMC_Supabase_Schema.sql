-- ============================================================
-- SPHMMC Maternal Health Study (Africa Medical College)
-- Research Title: Prevalence and Associated Factors of Antepartum
--                 Hemorrhage (APH) Among Pregnant Women at SPHMMC
-- Target Sample: 422 Participants | Study Period: Sept-Dec 2026
-- ============================================================

-- 1. Create Maternal Records Table
CREATE TABLE IF NOT EXISTS public.sphmmc_maternal_records (
  id TEXT PRIMARY KEY,
  code TEXT NOT NULL,
  collector TEXT,
  language TEXT DEFAULT 'English',
  "submittedAt" TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL,
  "isDemo" BOOLEAN DEFAULT false,
  
  -- Section A: Socio-demographic Profile
  "A1_Age" INTEGER,
  "A2_Marital" TEXT,
  "A3_Education" TEXT,
  "A4_Occupation" TEXT,
  "A5_Residence" TEXT,
  "A6_Income" NUMERIC,
  
  -- Section B: Obstetrical History
  "B1_Gravidity" INTEGER,
  "B2_Parity" INTEGER,
  "B3_ANC" INTEGER,
  "B4_PrevAPH" TEXT,
  "B5_PrevCS" TEXT,
  "B6_Abortion" TEXT,
  "B7_Stillbirth" TEXT,
  
  -- Section C: Medical Background & Comorbidities
  "C1_ChronicHTN" TEXT,
  "C2_Preeclampsia" TEXT,
  "C3_Diabetes" TEXT,
  "C4_Multiple" TEXT,
  
  -- Section D: Care Access & Presentation
  "D1_Presentation" TEXT,
  "D2_Referral" TEXT,
  
  -- Section E: Late-Pregnancy Bleeding (APH)
  "E1_APH" TEXT NOT NULL,
  "E2_Onset" TEXT,
  "E3_Amount" TEXT,
  "E4_Color" TEXT,
  "E5_Duration" TEXT,
  "E6_Recurrence" TEXT,
  "E7_Pain" TEXT,
  "E8_PainSeverity" TEXT,
  
  -- Section F: Associated Clinical Symptoms
  "F1_Tenderness" TEXT,
  "F2_Contractions" TEXT,
  "F3_FetalMove" TEXT,
  "F4_Dizziness" TEXT,
  "F5_Palpitations" TEXT,
  "F6_SOB" TEXT,
  "F7_Nausea" TEXT,
  "F8_Fever" TEXT,

  created_at TIMESTAMPTZ DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Performance & Query Indexes
CREATE INDEX IF NOT EXISTS idx_sphmmc_code ON public.sphmmc_maternal_records (code);
CREATE INDEX IF NOT EXISTS idx_sphmmc_aph ON public.sphmmc_maternal_records ("E1_APH");
CREATE INDEX IF NOT EXISTS idx_sphmmc_submitted ON public.sphmmc_maternal_records ("submittedAt");
CREATE INDEX IF NOT EXISTS idx_sphmmc_residence ON public.sphmmc_maternal_records ("A5_Residence");

-- 3. Enable Row Level Security (RLS)
ALTER TABLE public.sphmmc_maternal_records ENABLE ROW LEVEL SECURITY;

-- 4. RLS Security Policies for Anonymous Clinic Use (Idempotent: drop if exists then create)

-- Policy 1: Allow clinic tablets/participants to insert anonymous survey check-ins
DROP POLICY IF EXISTS "Allow anonymous check-in insert" ON public.sphmmc_maternal_records;
CREATE POLICY "Allow anonymous check-in insert" 
  ON public.sphmmc_maternal_records 
  FOR INSERT 
  TO anon 
  WITH CHECK (true);

-- Policy 2: Allow research dashboard to read all records for aggregation & KPIs
DROP POLICY IF EXISTS "Allow anonymous dashboard read" ON public.sphmmc_maternal_records;
CREATE POLICY "Allow anonymous dashboard read" 
  ON public.sphmmc_maternal_records 
  FOR SELECT 
  TO anon 
  USING (true);

-- Policy 3: Allow upsert / updates by ID (for syncing local offline records)
DROP POLICY IF EXISTS "Allow anonymous record upsert" ON public.sphmmc_maternal_records;
CREATE POLICY "Allow anonymous record upsert" 
  ON public.sphmmc_maternal_records 
  FOR UPDATE 
  TO anon 
  USING (true) 
  WITH CHECK (true);
