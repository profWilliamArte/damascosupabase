
import { useEffect, useState } from "react";
import { supabase } from '../supabaseClient';
import { Link } from "react-router-dom";

const FiltroMarcas = () => {
    const [datos, setDatos] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    const getDatos = async () => {
        try {
            const { data, error } = await supabase
                .from('marcas')
                // Solo necesitamos el id y el nombre para la navegación
                .select('id, nombre'); 

            if (error) {
                throw new Error(error.message || 'Error desconocido al obtener categorías.');
            }

            setDatos(data); // Almacenar los datos
            setLoading(false);  // Finalizar carga
        } catch (err) {
            console.error('Error al obtener categorías:', err);
            setError(err.message);
            setLoading(false);
        }
    };

   
    useEffect(() => {
        getDatos();
    }, []); 
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
       
           <>
           
                {datos.map((item) => (
                    <li key={item.id}>
                        <Link to={`/productos/marcas/${item.id}/${item.nombre}`} className="dropdown-item" href="#">{item.nombre}</Link>
                    </li>
                    
                ))}
          </>
       
    )
}

export default FiltroMarcas