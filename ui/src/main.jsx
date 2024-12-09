import React, { StrictMode } from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.jsx'
import { store } from './store/store.js'
import { Provider } from 'react-redux'
import { BrowserRouter } from 'react-router-dom'
import ConfigProvider from './providers/configprovider.jsx'

ReactDOM.createRoot(document.getElementById('root')).render(
  <Provider store={store}>
    <BrowserRouter>
      <StrictMode>
      <ConfigProvider>
        <App />
        </ConfigProvider>
      </StrictMode>
    </BrowserRouter>
  </Provider>
)
