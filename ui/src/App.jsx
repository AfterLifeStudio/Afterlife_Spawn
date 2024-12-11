import { useState } from 'react'
import SpawnMenu from './components'
import InputDialog from './components/inputdialog'
import ListLocation from './components/listlocation'
import JailMenu from './components/jailmenu'
import './App.scss'


function App () {

  
  return (
    <>
    <InputDialog />
    <ListLocation />
    <SpawnMenu />
    <JailMenu />
    </>
  )
}

export default App
