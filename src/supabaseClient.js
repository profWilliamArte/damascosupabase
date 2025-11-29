// src/supabaseClient.js

import { createClient } from '@supabase/supabase-js';

// 1. Cargar las variables de entorno de manera segura:
const supabaseUrl = import.meta.env.VITE_REACT_APP_SUPABASE_URL;
const supabaseKey = import.meta.env.VITE_REACT_APP_SUPABASE_ANON_KEY;

// 2. Comprobación (opcional, pero útil para depurar):
if (!supabaseUrl || !supabaseKey) {
    console.error("Error: Las variables de entorno de Supabase no están configuradas correctamente.");
}

// 3. Crear y exportar el cliente:
export const supabase = createClient(supabaseUrl, supabaseKey);

