
import { useParams, useNavigate } from 'react-router-dom'
import { useEffect, useState } from "react";
import { supabase } from '../supabaseClient';
import { Link } from "react-router-dom";
const supabaseUrl = 'https://ctkmstznoyaxsszowzch.supabase.co/storage/v1/object/public/productos/';
const PLACEHOLDER_IMG = 'https://placehold.co/400x300/CCCCCC/333333?text=Sin+Imagen';
const Productos = () => {
    const [datos, setDatos] = useState([]);
    const [subcategorias, setSubcategorias] = useState([]); // Renombrado a plural para claridad
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const { tipo, id, titulo } = useParams();
    const navigate = useNavigate();

    const getDatos = async () => {
        setLoading(true); // Reiniciar el estado de carga
        setError(null);    // Limpiar errores

        // 1. Determinar el nombre de la columna a filtrar
        // Si tipo es 'marcas', el filtro es por 'idmarca'. Si es cualquier otra cosa (asumimos 'categorias'), es por 'idcategoria'.
        let columnaFiltro = 'idcategoria';
        if (tipo === 'marcas') {
            columnaFiltro = 'idmarca';
        }
         if (tipo === 'subcategorias') {
            columnaFiltro = 'idsubcategoria';
        }

        // 2. Construir la consulta de Supabase
        try {
            // Inicializar la consulta base
            let query = supabase
                .from('productos')
                .select(`
                    id, 
                    nombre, 
                    precio, 
                    preciofull, 
                    imagen,
                    idcategoria (nombre),
                    idsubcategoria (nombre),
                    idmarca (nombre)
                `);

            // 3. Aplicar el filtro dinámico si existe un ID
            if (id != 0) {
                // Aquí aplicamos el método .eq() a la columna determinada dinámicamente
                query = query.eq(columnaFiltro, id);
            }

            // 4. Ejecutar la consulta
            const { data, error } = await query;

            if (error) {
                throw new Error(error.message || `Error al obtener productos por ${columnaFiltro}.`);
            }

            setDatos(data);
            setLoading(false);
        } catch (err) {
            console.error('Error al obtener productos:', err);
            setError(err.message);
            setLoading(false);
        }
    };

    const getSubcategorias = async () => {
        // Solo tiene sentido cargar subcategorías si estamos en el filtro de 'categorias'
        if (tipo !== 'categorias' || !id || id === '0') {
            setSubcategorias([]);
            return;
        }

        try {
            let query = supabase
                .from('subcategorias')
                .select('id, nombre');

            // Filtra solo las subcategorías que pertenecen a la categoría principal
            query = query.eq('idcategoria', id);

            const { data, error } = await query;

            if (error) {
                throw new Error(error.message || 'Error al obtener subcategorías.');
            }

            setSubcategorias(data);
        } catch (err) {
            console.error('Error al obtener subcategorías:', err);
            // No establecemos error global, solo para el componente
        }
    };
    useEffect(() => {
        // Ejecuta ambas consultas.
        // Usamos una función anónima async para manejar el estado de carga total.
        const fetchData = async () => {
            await Promise.all([getDatos(), getSubcategorias()]);
            setLoading(false);
        };
        fetchData();
    }, [id, tipo]);

    // Función para manejar la URL de la imagen y proporcionar un fallback
    const getImageUrl = (path) => {
        // 1. Si ya es una URL completa (http/https), úsala tal cual
        if (path && path.startsWith('http')) {
            return path;
        }

        // 2. Si hay un nombre/ruta de archivo, concatenar con la URL base del bucket
        if (path) {
            return `${supabaseUrl}${path}`;
        }

        // 3. Fallback si no hay imagen en la BD
        return PLACEHOLDER_IMG;
    };

    if (loading) {
        return (
            <div className="text-center p-3">
                <p>Cargando categorías...</p>
            </div>
        );
    }
    if (error) {
        return (
            <div className="p-3 text-danger">
                <p>Error: {error}</p>
            </div>
        );
    }


    return (
        <div className='container'>
            <h4 className='text-center py-4'>Productos ({datos.length})<br /> <span className='small'>({tipo} : {titulo})</span></h4>
            <div className="d-flex justify-content-end mb-3">
                <button onClick={() => navigate(-1)} className="btn btn-secondary">
                    ← Volver
                </button>
            </div>
            {/* Botones de Subcategoría (Solo si es tipo 'categorias' y hay subcategorías) */}
            {tipo === 'categorias' && subcategorias.length > 0 && (
                <div className='text-center py-4'>
                    {subcategorias.map((item) => (
                        <Link to={`/productos/subcategorias/${item.id}/${titulo}`}
                            key={item.id}
                            className='btn btn-outline-info btn-sm me-2 mb-2'
                        >
                            {item.nombre}
                           
                        </Link>
                    ))}
                </div>
            )}
            {datos.length === 0 && (
                <div className="p-5 text-center text-warning">
                    <p className="fs-5">No se encontraron productos para esta selección.</p>
                </div>
            )}

            <div className='row'>

                {datos.map((item) => (
                    <div key={item.id} className='col-md-3 mb-4'>
                        <div className='card h-100'>
                            <div className='card-header p-0'>
                                <img
                                    src={getImageUrl(item.imagen)}
                                    alt={item.nombre}
                                    className="img-fluid"
                                    onError={(e) => {
                                        // Evitar loop si también falla el placeholder
                                        if (e.target.src !== PLACEHOLDER_IMG) {
                                        e.target.onerror = null;
                                        e.target.src = PLACEHOLDER_IMG;
                                        }
                                    }}
                                />
                            </div>
                            <div className='card-body text-center d-flex flex-column justify-content-between'>
                                <div>
                                    <p className='fw-bold mb-1'>{item.nombre}</p>
                                    <span className='small text-info'>
                                        {/* Usamos Optional Chaining (?. ) para evitar errores si el campo es NULL */}
                                        Categoría: {item.idcategoria?.nombre}<br />
                                        Subcategoría: {item.idsubcategoria?.nombre}
                                    </span>
                                    <p className='small text-primary mt-1 mb-2'>
                                        Marca: {item.idmarca?.nombre}
                                    </p>
                                   
                                </div>
                                <div className="mt-2">
                                    <p className='fs-5 fw-bold text-success'>${item.precio}</p>
                                </div>
                            </div>
                            <div className='card-footer bg-light border-0 text-center'>
                                <Link to={`/detalle/${item.id}/${item.nombre}`} className='btn btn-sm btn-outline-primary w-75'>
                                    Ver Detalle
                                </Link>
                            </div>

                        </div>
                    </div>

                ))}
            </div>


        </div>
    )
}

export default Productos