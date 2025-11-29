import { useParams, useNavigate } from 'react-router-dom';
import { useEffect, useState } from "react";
import { supabase } from '../supabaseClient';
const supabaseUrl = 'https://ctkmstznoyaxsszowzch.supabase.co/storage/v1/object/public/productos/';
const PLACEHOLDER_IMG = 'https://placehold.co/400x300/CCCCCC/333333?text=Sin+Imagen';
const Detalle = () => {
    const { id, nombre } = useParams();
    const [producto, setProducto] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);
    const navigate = useNavigate();

    const getDetalleProducto = async () => {
        setLoading(true);
        setError(null);

        if (!id) {
            setError("ID de producto no especificado.");
            setLoading(false);
            return;
        }

        try {
            // Consulta para obtener el producto por ID, incluyendo todos los detalles de las tablas relacionadas
            const { data, error } = await supabase
                .from('productos')
                .select(`
                    id, 
                    nombre, 
                    precio, 
                    preciofull, 
                    imagen,
                    stock,
                    idcategoria (nombre),
                    idsubcategoria (nombre),
                    idmarca (nombre)
                   
                `)
                .eq('id', id)
                .single(); // Usamos .single() para obtener un único objeto en lugar de un array

            if (error) {
                throw new Error(error.message || 'Error al obtener el detalle del producto.');
            }
            if (!data) {
                setError("Producto no encontrado.");
            }

            setProducto(data);
            setLoading(false);
        } catch (err) {
            console.error("Error en getDetalleProducto:", err);
            setError(err.message);
            setLoading(false);
        }
    };

    useEffect(() => {
        getDetalleProducto();
    }, [id]);

    const getImageUrl = (imageFileName) => {
        if (!imageFileName) {
            return 'https://placehold.co/600x400/CCCCCC/333333?text=Sin+Imagen';
        }
        return `${supabaseUrl}${imageFileName}`;
    }

    // ------------------------------------
    // Renderizado de Estados
    // ------------------------------------
    if (loading) {
        return (
            <div className="container text-center py-5">
                <div className="spinner-border text-primary" role="status">
                    <span className="visually-hidden">Cargando...</span>
                </div>
                <p className="mt-2">Cargando detalle del producto...</p>
            </div>
        );
    }
    
    if (error) {
        return (
            <div className="container p-5 text-danger text-center">
                <h4 className="mb-3">Error al cargar el producto</h4>
                <p>{error}</p>
            </div>
        );
    }

    if (!producto) {
        return (
            <div className="container p-5 text-warning text-center">
                <h4 className="mb-3">Producto no encontrado</h4>
                <p>El producto con ID {id} no existe o fue eliminado.</p>
            </div>
        );
    }

    return (
        <div className="container py-5">
           <h4 className="text-center mb-5">Detalle del Producto</h4> 
           
           <div className="row g-5 shadow p-4 rounded-lg bg-dark border mt-4">
                
                {/* Columna de Imagen */}
                <div className="col-md-5">
                    <img 
                        src={getImageUrl(producto.imagen)} 
                        alt={producto.nombre} 
                        className="img-fluid rounded-lg shadow-sm"
                        onError={(e) => {
                            e.target.onerror = null; 
                            e.target.src = 'https://placehold.co/600x400/CCCCCC/333333?text=Sin+Imagen'; // Fallback por error de carga
                        }}
                    />
                </div>

                {/* Columna de Información */}
                <div className="col-md-7">
                    <h1 className="fw-bold mb-3">{producto.nombre}</h1>
                    
                    {/* Precios */}
                    <div className="mb-4">
                        <span className="text-secondary text-decoration-line-through me-3 fs-5">
                            Precio Sugerido: ${producto.preciofull}
                        </span>
                        <span className="text-success fw-bolder fs-3">
                            Oferta: ${producto.precio}
                        </span>
                       
                        
                    </div>



                    {/* Metadatos (Categorías, Marcas, Stock) */}
                    <div className="mt-4">
                        <p className="mb-2">
                            <strong>Categoría:</strong> <span className="badge bg-info text-dark me-2">{producto.idcategoria?.nombre}</span>
                        </p>
                        <p className="mb-2">
                            <strong>Subcategoría:</strong> <span className="badge bg-secondary me-2">{producto.idsubcategoria?.nombre || "N/A"}</span>
                        </p>
                        <p className="mb-2">
                            <strong>Marca:</strong> <span className="badge bg-primary">{producto.idmarca?.nombre}</span>
                        </p>
                        <p className="mb-4">
                            <strong>Disponibilidad:</strong> 
                            <span className={`fw-bold ms-2 ${producto.stock > 0 ? 'text-success' : 'text-danger'}`}>
                                {producto.stock > 0 ? `En Stock (${producto.stock} unidades)` : 'Agotado'}
                            </span>
                        </p>
                    </div>

                    {/* Botón de Acción */}
                    <button className="btn btn-lg btn-success w-100 mt-3" disabled={producto.stock === 0}>
                        {producto.stock > 0 ? 'Agregar al Carrito' : 'Notificar Agotado'}
                    </button>

                    
                        <button onClick={() => navigate(-1)} className="btn btn-lg btn-info w-100 mt-3">
                            ← Volver
                        </button>
                    
                </div>
           </div>
        </div>
    )
}

export default Detalle