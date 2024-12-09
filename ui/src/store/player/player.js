import { createSlice } from '@reduxjs/toolkit'

const initialState = []

export const playerSlice = createSlice({
  name: 'player',
  initialState,
  reducers: {
    addplayer: (state,action) => [...state, ...action.payload],
    addSingleplayer: (state,action) => [...state, ...action.payload]
  },
})

export const {addplayer, addSingleplayer} = playerSlice.actions

export default playerSlice.reducer