import React from "react";
import { useState } from "react";
import { useNuiEvent } from "../utils/useNuiEvent";
import { nuicallback } from "../utils/nuicallback";
import { setClipboard } from "../utils/seClipboard";
import { debug } from "./debugdata";
import locationicon from "../assets/location.png";
import mapicon from "../assets/map.png";
import propertyicon from "../assets/property.png";
import savedicon from "../assets/saved.png";
import playericon from "../assets/play.png";
function SpawnMenu() {
  const [debugdata, setDebugdata] = useState(debug);
  const [catagory, setCatagory] = useState("map");
  const [lastloc, setLastloc] = useState(false)
  const [counter, setCounter] = useState(0);

  const handlecatagory = (catagory) => {
    setCounter(0);
    setLastloc(false)
    setCatagory(catagory);
  };

  const handlepreview = (counter) => {
    setCounter(counter);
    setLastloc(false)
    var id = 0;
    if (catagory == "map") {
      id = debugdata.map[counter].id;
    } else if (catagory == "property") {
      id = debugdata.property[counter].id;
    } else if (catagory == "apartment"){
      id = debugdata.apartment[counter].id;
    }else {
      id = debugdata.saved[counter].id;
    }
    nuicallback("preview", { id: id, catagory: catagory });
  };

  const handlenuievent = (data) => {
    setCatagory(data.catagory)
    setDebugdata(data);
  };

  useNuiEvent("visible", handlenuievent);

  const handlecopy = (data) => {
    setClipboard(data);
  };

  const handleplay = () => {
    setDebugdata([]);
    if (lastloc){
      nuicallback("play", 'lastlocation');
    }else{
      nuicallback("play", catagory);
    }

  };

  const lastlocation = () => {
    setLastloc(true)
    nuicallback("preview", { id: 0, catagory: 'lastlocation' });
  }

  useNuiEvent("copy", handlecopy);


  return (
    <>
      {debugdata.visible && (
        <div className="spawnmenu-wrapper">
          <div className="spawnmenu-container">
            <div className="heading">
              <img src={locationicon} alt="" />
              <div className="header-label">
                {lastloc == true
                  ? "Last Location"
                  : catagory == "map"
                  ? debugdata.map[counter].label
                  : catagory == "property"
                  ? debugdata.property[counter].label
                  : catagory == "apartment"
                  ? debugdata.apartment[counter].label
                  : debugdata.map[counter].label}
              </div>
              <div className="line"></div>
              <div className="header-catagory">{lastloc ? 'Map' : catagory}</div>
            </div>

            <div className="footer">
              <div className="location-container">
                {debugdata.map && catagory == "map" && (
                  <>
                    {debugdata.map.map((data, index) => (
                      <div
                        onMouseEnter={() => nuicallback("hover")}
                        style={{
                          backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(../images/${data.id}.png)`,
                          transform:
                            index == counter ? "scale(1.1)" : "scale(1.0)",
                        }}
                        onClick={() => handlepreview(index)}
                        className="location"
                      >
                        <div className="location-title">
                          <div>{data.label}</div>
                        </div>
                      </div>
                    ))}
                  </>
                )}

                {debugdata.property && catagory == "property" && (
                  <>
                    {debugdata.property.map((data, index) => (
                      <div
                        onMouseEnter={() => nuicallback("hover")}
                        style={{
                          backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(../images/${data.id}.png)`,
                          transform:
                            index == counter ? "scale(1.1)" : "scale(1.0)",
                        }}
                        className="location"
                        onClick={() => handlepreview(index)}
                      >
                        <div className="location-title">
                          <div>{data.label}</div>
                        </div>
                      </div>
                    ))}
                  </>
                )}

                {debugdata.apartment && catagory == "apartment" && (
                  <>
                    {debugdata.apartment.map((data, index) => (
                      <div
                        onMouseEnter={() => nuicallback("hover")}
                        style={{
                          backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(../images/${data.id}.png)`,
                          transform:
                            index == counter ? "scale(1.1)" : "scale(1.0)",
                        }}
                        className="location"
                        onClick={() => handlepreview(index)}
                      >
                        <div className="location-title">
                          <div>{data.label}</div>
                        </div>
                      </div>
                    ))}
                  </>
                )}

                {debugdata.saved && catagory == "saved" && (
                  <>
                    {debugdata.saved.map((data, index) => (
                      <div
                        style={{
                          backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(../images/${data.id}.png), url(../images/saved.png)`,
                          transform:
                            index == counter ? "scale(1.1)" : "scale(1.0)",
                        }}
                        onClick={() => handlepreview(index)}
                        className="location"
                      >
                        <div className="location-title">
                          <div>{data.label}</div>
                        </div>
                      </div>
                    ))}
                  </>
                )}
              </div>
              <div style={{width: '70vw'}} className="line"></div>
              <div className="buttons-container">
                {debugdata.map && (
                  <div
                    onMouseEnter={() => nuicallback("hover")}
                    onClick={() => handlecatagory("map")}
                    style={
                      catagory == "map" ? { backgroundColor: "#FFFFFF" } : {}
                    }
                    className="button"
                  >
                    <img
                      style={catagory == "map" ? { filter: "invert(1)" } : {}}
                      src={mapicon}
                      alt=""
                    />
                  </div>
                )}
                {debugdata.property && (
                  <div
                    onMouseEnter={() => nuicallback("hover")}
                    onClick={() => handlecatagory("property")}
                    style={
                      catagory == "property"
                        ? { backgroundColor: "#FFFFFF" }
                        : {}
                    }
                    className="button"
                  >
                    <img
                      src={propertyicon}
                      style={
                        catagory == "property" ? { filter: "invert(1)" } : {}
                      }
                      alt=""
                    />
                  </div>
                )}

                {debugdata.apartment && (
                  <div
                    onMouseEnter={() => nuicallback("hover")}
                    onClick={() => handlecatagory("apartment")}
                    style={
                      catagory == "apartment"
                        ? { backgroundColor: "#FFFFFF" }
                        : {}
                    }
                    className="button"
                  >
                    <img
                      src={propertyicon}
                      style={
                        catagory == "apartment" ? { filter: "invert(1)" } : {}
                      }
                      alt=""
                    />
                  </div>
                )}

                {debugdata.saved && (
                  <div
                    onMouseEnter={() => nuicallback("hover")}
                    onClick={() => handlecatagory("saved")}
                    style={
                      catagory == "saved" ? { backgroundColor: "#FFFFFF" } : {}
                    }
                    className="button"
                  >
                    <img
                      src={savedicon}
                      style={catagory == "saved" ? { filter: "invert(1)" } : {}}
                      alt=""
                    />
                  </div>
                )}
                <div
                  onMouseEnter={() => nuicallback("hover")}
                  style={
                    lastloc
                      ? {
                          backgroundColor: "#FFFFFF",
                          color: "rgba(0,0,0,0.9)",
                          width: "fit-content",
                        }
                      : { width: "fit-content" }
                  }
                  onClick={() => lastlocation("lastlocation")}
                  className="button"
                >
                  Last Location
                </div>
                <div
                  onMouseEnter={() => nuicallback("hover")}
                  onClick={handleplay}
                  style={{ width: "fit-content" }}
                  className="button"
                >
                  <img src={playericon} alt="" />
                </div>
              </div>
            </div>
          </div>
        </div>
      )}
    </>
  );
}

export default SpawnMenu;
