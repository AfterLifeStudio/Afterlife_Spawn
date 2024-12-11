import React from "react";
import savedicon from "../assets/saved.png";
import { useState } from "react";
import { useEffect } from "react";
import { nuicallback } from "../utils/nuicallback";
import { useNuiEvent } from "../utils/useNuiEvent";
import { debug } from "./debugdata";

function ListLocation() {
  const [visible, setVisible] = useState(false);
  const [locations, Setlocations] = useState(debug);
  const [ondelete, Setondelete] = useState(false);


  const handlevisible = (data) => {
    Setlocations(data.locations)
    setVisible(data.visible)
  };

  useNuiEvent("Spawnlist", handlevisible);

  useEffect(() => {
    const handlekey = (e) => {
      if (visible && e.code == "Escape") {
        setVisible(false);
        nuicallback("ExitSpawnlist");
      }
    };

    window.addEventListener("keydown", handlekey);
    return () => window.removeEventListener("keydown", handlekey);
  });

  return (
    <>
      {visible && (
        <div className="dialog-container">
          <div className="dialog-header">
            <div className="dialog-title">SAVED</div>
            <div className="dialog-description">
              create location for you to choose in spawn selector
            </div>
          </div>

          <div className="input-container">
            {locations.map((data) => (
              <div className="list-item"  onMouseEnter={() => nuicallback("hover")} onClick={() => {
                if (!ondelete){
                nuicallback('editlocation',data.id);
                 setVisible(false)}
                }}
              style={{
                backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(${data.img})`,
              }}
              > 
              <div>{data.label}</div>


              <svg onMouseLeave={() => Setondelete(false)} onMouseEnter={() => Setondelete(true)} onClick={() => nuicallback('deletelocation', data.id)} xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>
              </div>
            ))}
          </div>

          <div onClick={() => {nuicallback('createlocation');setVisible(false)}}  onMouseEnter={() => nuicallback("hover")} className="list-button">
          <svg xmlns="http://www.w3.org/2000/svg" height="1.5vw" fill="#ffffffab" viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
          </div>
        </div>
      )}
    </>
  );
}

export default ListLocation;
