import React from "react";

const GuiaSupaBase = () => {
  return (
    <div className="container my-4">
      <header className="mb-4">
        <h1 className="h3">📚 Manual del Curso: Backend E-commerce con Supabase y React</h1>
        <p className="text-muted">
          Guía paso a paso para migrar la base de datos Damasco a Supabase y usarla desde React.
        </p>

        <nav className="mt-3">
          <strong>Secciones rápidas:</strong>
          <ul>
            <li><a href="#parte1">Parte 1: Exportar CSV desde phpMyAdmin</a></li>
            <li><a href="#parte2">Parte 2: Configurar proyecto en Supabase</a></li>
            <li><a href="#parte3">Parte 3: Ajustes finales de la base de datos</a></li>
            <li><a href="#parte4">Parte 4: Credenciales y React + ejemplo de lectura</a></li>
            <li><a href="#imagenes">Parte 5: Subida y uso de imágenes (Storage)</a></li>
          </ul>
        </nav>
      </header>

      {/* PARTE 1 */}
      <section id="parte1" className="mb-4">
        <h2 className="h4">Parte 1: Pre-migración – Exportación de Datos a CSV (phpMyAdmin)</h2>
        <p>
          El objetivo es extraer los datos de todas las tablas en formato CSV para asegurar una importación limpia en Supabase.
        </p>

        <h3 className="h5">1.1 Tablas a exportar</h3>
        <p>Debes obtener un archivo CSV para cada una de las siguientes tablas:</p>
        <ul>
          <li>carritos</li>
          <li>categorias</li>
          <li>dolar</li>
          <li>estatus</li>
          <li>items_carrito</li>
          <li>items_pedido</li>
          <li>marcas</li>
          <li>pedidos</li>
          <li>productos</li>
          <li>subcategorias</li>
          <li>usuarios</li>
        </ul>

        <h3 className="h5">1.2 Proceso de exportación en phpMyAdmin</h3>
        <ol>
          <li>Abre phpMyAdmin y selecciona la base de datos <strong>damasco</strong>.</li>
          <li>En el panel izquierdo, haz clic en una tabla (por ejemplo, <strong>categorias</strong>).</li>
          <li>Ve a la pestaña <strong>Exportar</strong>.</li>
          <li>
            En <strong>Método de exportación</strong>, selecciona <strong>Personalizado (Custom)</strong>.
          </li>
          <li>
            En <strong>Formato</strong>, elige <strong>CSV</strong> y marca la opción
            <strong> “Incluir nombres de columna en la primera fila”</strong>.
          </li>
          <li>Haz clic en <strong>Continuar (Go)</strong> y descarga el archivo (ej: categorias.csv).</li>
          <li>Repite el proceso para todas las tablas de la lista.</li>
        </ol>
      </section>

      {/* PARTE 2 */}
      <section id="parte2" className="mb-4">
        <h2 className="h4">Parte 2: Configuración del Backend en Supabase</h2>
        <p>
          El objetivo es crear el proyecto en Supabase y cargar los datos de los CSV que exportaste.
        </p>

        <h3 className="h5">2.1 Crear cuenta y proyecto en Supabase</h3>
        <ol>
          <li>Regístrate o entra en <a href="https://supabase.com" target="_blank" rel="noreferrer">Supabase</a>.</li>
          <li>
            En la organización del curso, crea un nuevo proyecto:
            <ul>
              <li><strong>Name:</strong> DamascoStore (o damasco).</li>
              <li><strong>Database Password:</strong> XXXXXXXXX.</li>
              <li><strong>Region:</strong> selecciona la más cercana geográficamente.</li>
            </ul>
          </li>
          <li>Haz clic en <strong>Create new project</strong> y espera a que termine la creación.</li>
        </ol>

        <h3 className="h5">2.2 Importar las tablas desde CSV</h3>
        <ol>
          <li>En el menú lateral, entra en <strong>Table Editor</strong>.</li>
          <li>Haz clic en <strong>+ New table</strong> y selecciona <strong>Import data from CSV</strong>.</li>
          <li>
            Escribe el nombre de la tabla (ej: <strong>productos</strong>) y sube el CSV correspondiente
            (ej: productos.csv).
          </li>
          <li>Revisa la previsualización y haz clic en <strong>Import</strong>.</li>
          <li>Repite el proceso para las 11 tablas.</li>
        </ol>
      </section>

      {/* PARTE 3 */}
      <section id="parte3" className="mb-4">
        <h2 className="h4">Parte 3: Ajustes finales de la base de datos</h2>
        <p>
          Después de importar, hay que configurar llaves primarias, tipos de datos y llaves foráneas.
        </p>

        <h3 className="h5">3.1 Definición de llaves primarias (PK)</h3>
        <ol>
          <li>En <strong>Table Editor</strong>, entra en cada tabla.</li>
          <li>
            En la columna <strong>id</strong>, asegúrate de configurar:
            <ul>
              <li><strong>Primary Key (PK):</strong> Sí</li>
              <li><strong>Identity (auto increment):</strong> Sí</li>
              <li><strong>Not Null:</strong> Sí</li>
            </ul>
          </li>
        </ol>

        <h3 className="h5">3.2 Corrección de tipos de datos (moneda)</h3>
        <p>En tablas con montos, usa tipos decimales:</p>
        <ul>
          <li>En <strong>pedidos</strong>, cambia <strong>total</strong> a <strong>numeric</strong>.</li>
          <li>
            En <strong>pedidos</strong>, cambia <strong>tasa_dolar_usada</strong> a <strong>numeric</strong>.
          </li>
          <li>
            Revisa otras columnas de monto en <strong>productos</strong> o <strong>items_pedido</strong>.
          </li>
        </ul>

        <h3 className="h5">3.3 Definir llaves foráneas (FK)</h3>
        <p>Ejemplos de relaciones que debes crear:</p>
        <ul>
          <li>subcategorias.idcategoria → categorias.id</li>
          <li>productos.idcategoria → categorias.id</li>
          <li>productos.idsubcategoria → subcategorias.id</li>
          <li>productos.idmarca → marcas.id</li>
          <li>pedidos.usuario_id → usuarios.id</li>
          <li>items_pedido.pedido_id → pedidos.id</li>
          <li>items_pedido.producto_id → productos.id</li>
          <li>items_carrito.carrito_id → carritos.id</li>
          <li>items_carrito.producto_id → productos.id</li>
        </ul>
      </section>

      {/* PARTE 4 */}
      <section id="parte4" className="mb-4">
        <h2 className="h4">Parte 4: Credenciales y conexión desde React</h2>
        <p>
          Ahora obtendrás las claves para conectar tu aplicación React con Supabase.
        </p>

        <h3 className="h5">4.1 Obtener credenciales desde el Dashboard</h3>
        <ol>
          <li>En el menú lateral, ve a <strong>Project Settings → API</strong>.</li>
          <li>Copia:</li>
        </ol>
        <ul>
          <li><strong>Project URL</strong> → VITE_REACT_APP_SUPABASE_URL</li>
          <li><strong>Anon Public Key</strong> → VITE_REACT_APP_SUPABASE_ANON_KEY</li>
        </ul>

        <h3 className="h5">4.2 Configurar archivo .env.local en React (Vite)</h3>
        <pre className="bg-black p-2">
{`# .env.local
VITE_REACT_APP_SUPABASE_URL="https://xxxxxx.supabase.co"
VITE_REACT_APP_SUPABASE_ANON_KEY="xxsxxxxxxxx"`}
        </pre>

        <h3 className="h5">4.3 Crear cliente de Supabase en React</h3>
        <pre className="bg-black p-2">
{`// src/supabaseClient.js
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_REACT_APP_SUPABASE_URL;
const supabaseKey = import.meta.env.VITE_REACT_APP_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.error("Error: Variables de entorno de Supabase no configuradas.");
}

export const supabase = createClient(supabaseUrl, supabaseKey);`}
        </pre>

        <h3 className="h5">4.4 Ejemplo de lectura de categorías (React)</h3>
        <pre className="bg-black p-2">
{`import { useEffect, useState } from "react";
import { supabase } from "../supabaseClient";

const FiltroCategorias = () => {
  const [datos, setDatos] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  const getDatos = async () => {
    try {
      const { data, error } = await supabase
        .from("categorias")
        .select("id, nombre");

      if (error) throw new Error(error.message || "Error al obtener categorías.");

      setDatos(data);
      setLoading(false);
    } catch (err) {
      console.error("Error al obtener categorías:", err);
      setError(err.message);
      setLoading(false);
    }
  };

  useEffect(() => {
    getDatos();
  }, []);

  if (loading) return <p>Cargando categorías...</p>;
  if (error) return <p className="text-danger">Error: {error}</p>;

  return (
    <ul className="list-group list-group-flush">
      {datos.map((item) => (
        <li key={item.id} className="list-group-item list-group-item-action">
          {item.nombre}
        </li>
      ))}
    </ul>
  );
};

export default FiltroCategorias;`}
        </pre>
      </section>

      {/* PARTE 5: IMÁGENES Y STORAGE */}
      <section id="imagenes" className="mb-4">
        <h2 className="h4">Parte 5: Subida de Imágenes con Supabase Storage</h2>

        <h3 className="h5">5.1 Crear bucket público para imágenes</h3>
        <ol>
          <li>En el menú lateral de Supabase, entra en <strong>Storage</strong>.</li>
          <li>Haz clic en <strong>New bucket</strong>.</li>
          <li>
            <strong>Name:</strong> imagenes_productos (o product_images).
          </li>
          <li>
            Marca <strong>Public bucket</strong> para que las imágenes sean accesibles desde la tienda.
          </li>
          <li>Guarda el bucket.</li>
        </ol>

    

      

    
      </section>
    </div>
  );
};

export default GuiaSupaBase;

