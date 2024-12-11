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
  const [lastloc, setLastloc] = useState(false);
  const [counter, setCounter] = useState(0);
  const [position, setPosition] = useState(0);
  const [maxlenght, setMaxlength] = useState(0);

  const handlecatagory = (catagory) => {
    setCounter(0);
    setPosition(0);
    setLastloc(false);
    setCatagory(catagory);

    nuicallback('click')

    let max = 0;
    if (catagory == "map") {
      max = debug.map.length;
    } else if (catagory == "property") {
      max = debug.property.length;
    } else if (catagory == "apartment") {
      max = debug.apartment.length;
    } else {
      max = debug.saved.length;
    }
    setMaxlength(max);
  };

  const handlepreview = (counter) => {
    setCounter(counter);
    setLastloc(false);
    var id = 0;
    if (catagory == "map") {
      id = debugdata.map[counter].id;
    } else if (catagory == "property") {
      id = debugdata.property[counter].id;
    } else if (catagory == "apartment") {
      id = debugdata.apartment[counter].id;
    } else {
      id = debugdata.saved[counter].id;
    }
    nuicallback("preview", { id: id, catagory: catagory });
  };

  const handleforward = () => {
    let max = 0;
    if (catagory == "map") {
      max = debug.map.length;
    } else if (catagory == "property") {
      max = debug.property.length;
    } else if (catagory == "apartment") {
      max = debug.apartment.length;
    } else {
      max = debug.saved.length;
    }
    setMaxlength(max)
    if (position + 5 < max) {
      nuicallback('click')
      setPosition(position + 5);
    }
  };

  const handlebackward = () => {
    if (position > 0) {
      nuicallback('click')
      setPosition(position - 5);
    }
  };

  const handlenuievent = (data) => {
    setCounter(0);
    setPosition(0);
    setCatagory(data.catagory);
    setDebugdata(data);

    let max = 0;
    if (catagory == "map") {
      max = debug.map.length;
    } else if (catagory == "property") {
      max = debug.property.length;
    } else if (catagory == "apartment") {
      max = debug.apartment.length;
    } else {
      max = debug.saved.length;
    }
    setMaxlength(max)
  };

  useNuiEvent("visible", handlenuievent);

  const handlecopy = (data) => {
    setClipboard(data);
  };

  const handleplay = () => {
    setDebugdata([]);
    if (lastloc) {
      nuicallback("play", "lastlocation");
    } else {
      nuicallback("play", catagory);
    }
  };

  const lastlocation = () => {
    setLastloc(true);
    nuicallback("preview", { id: 0, catagory: "lastlocation" });
  };

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
                  : debugdata.saved[counter].label}
              </div>
              <div className="line"></div>
              <div className="header-catagory">
                {lastloc ? "Map" : catagory}
              </div>
            </div>

            <div className="footer">
              <div className="location-container">
              {position > 0 &&
                <div onClick={handlebackward} onMouseEnter={() => nuicallback("hover")} className="backward">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="1.5vw"
                    viewBox="0 0 512 512"
                  >
                    <path d="M459.5 440.6c9.5 7.9 22.8 9.7 34.1 4.4s18.4-16.6 18.4-29l0-320c0-12.4-7.2-23.7-18.4-29s-24.5-3.6-34.1 4.4L288 214.3l0 41.7 0 41.7L459.5 440.6zM256 352l0-96 0-128 0-32c0-12.4-7.2-23.7-18.4-29s-24.5-3.6-34.1 4.4l-192 160C4.2 237.5 0 246.5 0 256s4.2 18.5 11.5 24.6l192 160c9.5 7.9 22.8 9.7 34.1 4.4s18.4-16.6 18.4-29l0-64z" />
                  </svg>
                </div>
                }
                {debugdata.map && catagory == "map" && (
                  <>
                    {debugdata.map.map(
                      (data, index) =>
                        index <= position + 5 &&
                        index >= position && (
                          <div
                            onMouseEnter={() => nuicallback("hover")}
                            style={{
                              backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(${data.img})`,
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
                        )
                    )}
                  </>
                )}

                {debugdata.property && catagory == "property" && (
                  <>
                    {debugdata.property.map(
                      (data, index) =>
                        index <= position + 5 &&
                        index >= position && (
                          <div
                            onMouseEnter={() => nuicallback("hover")}
                            style={{
                              backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(../images/house.png)`,
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
                        )
                    )}
                  </>
                )}

                {debugdata.apartment && catagory == "apartment" && (
                  <>
                    {debugdata.apartment.map(
                      (data, index) =>
                        index <= position + 5 &&
                      index >= position && (
                          <div
                            onMouseEnter={() => nuicallback("hover")}
                            style={{
                              backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(${data.img})`,
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
                        )
                    )}
                  </>
                )}

                {debugdata.saved && catagory == "saved" && (
                  <>
                    {debugdata.saved.map(
                      (data, index) =>
                        index <= position + 5 &&
                        index >= position && (
                          <div
                            style={{
                              backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(${data.img}), url(../images/saved.png)`,
                              transform:
                                index == counter ? "scale(1.1)" : "scale(1.0)",
                            }}
                            onClick={() => handlepreview(index)}
                            onMouseEnter={() => nuicallback("hover")}
                            className="location"
                          >
                            <div className="location-title">
                              <div>{data.label}</div>
                            </div>
                          </div>
                        )
                    )}
                  </>
                )}
                {position + 5 < maxlenght &&
                <div onClick={handleforward} onMouseEnter={() => nuicallback("hover")} className="forward">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    width="1.5vw"
                    viewBox="0 0 512 512"
                  >
                    <path d="M52.5 440.6c-9.5 7.9-22.8 9.7-34.1 4.4S0 428.4 0 416L0 96C0 83.6 7.2 72.3 18.4 67s24.5-3.6 34.1 4.4L224 214.3l0 41.7 0 41.7L52.5 440.6zM256 352l0-96 0-128 0-32c0-12.4 7.2-23.7 18.4-29s24.5-3.6 34.1 4.4l192 160c7.3 6.1 11.5 15.1 11.5 24.6s-4.2 18.5-11.5 24.6l-192 160c-9.5 7.9-22.8 9.7-34.1 4.4s-18.4-16.6-18.4-29l0-64z" />
                  </svg>
                </div>
                }
              </div>
              <div style={{ width: "70vw" }} className="line"></div>
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
                {debugdata.catagory == "map" && (
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
                )}
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
