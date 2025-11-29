import  { useState } from 'react'
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Header from './components/Header'
import Footer from './components/Footer'
import Home from './pages/Home'
import Productos from './pages/Productos'
import GuiaSupaBase from './pages/GuiaSupaBase'
import Detalle from './pages/Detalle'



const App = () => {

  const [darkMode, setDarkMode] = useState('dark')

  const toggleTheme = () => {
    setDarkMode(!darkMode)
    document.body.setAttribute('data-bs-theme', !darkMode ? 'dark' : 'light')
  }
  return (
    <BrowserRouter>
      <div className="app">
         <Header darkMode={darkMode} toggleTheme={toggleTheme} />
         <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/productos/:tipo/:id/:titulo" element={<Productos />} />
          <Route path="/detalle/:id/:nombre" element={<Detalle />} />
          <Route path="/guia" element={<GuiaSupaBase />} />

          <Route path="*" element={<Home />} />

         </Routes>

        <Footer/>
      </div>
    </BrowserRouter>
  )
}

export default App