import { configureStore } from '@reduxjs/toolkit'
import playerSlice  from './player/player'

export const store = configureStore({
  reducer: {player: playerSlice},
})