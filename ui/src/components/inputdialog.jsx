import React from "react";
import savedicon from "../assets/saved.png";
import { useState } from "react";
import { nuicallback } from "../utils/nuicallback";
import { useNuiEvent } from "../utils/useNuiEvent";

function InputDialog() {
  const [visible, setVisible] = useState(true);
  const [previewstate, setPreviewState] = useState(false);
  const [name, setName] = useState("");
  const [image, setImage] = useState("");

  const handlesave = () => {
    if (name == "" || image == "") {
      nuicallback("errorsound");
    } else {
      nuicallback("save", { name, image });
      setVisible(false)
    }
  };

  const handlepromise = (state) => {
    if (state){
    setPreviewState(state)
  }
    setVisible(true)
  }

  const handlepreviewinput = () => {
    console.log('aa')
    setVisible(false)
    nuicallback('previewcreator').then(handlepromise);
  }

  const handlevisible = (state) => {
    setVisible(state)
  }

  useNuiEvent('CreateSpawn', handlevisible)


  const handleupdate = (data) => {
    setName(data.name)
    setImage(data.img)
  }

  useNuiEvent('UpdateSpawn', handleupdate)

  

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
            <input
              onChange={() => setName(event.target.value)}
              placeholder="Name"
              type="text"
            />


   
            <input
              onChange={() => setImage(event.target.value)}
              placeholder="Image URL"
              type="text"
            />

    
            <div
              style={{
                backgroundImage: `radial-gradient(circle, rgba(0,0,0,0) 0%, rgba(0,0,0,0.8) 100%), url(${image})`,
              }}
              className="imageinput"
            >
          <svg xmlns="http://www.w3.org/2000/svg" width="2.5vw" height="2.5vw" fill="#ffffffab" viewBox="0 0 512 512"><path d="M0 96C0 60.7 28.7 32 64 32l384 0c35.3 0 64 28.7 64 64l0 320c0 35.3-28.7 64-64 64L64 480c-35.3 0-64-28.7-64-64L0 96zM323.8 202.5c-4.5-6.6-11.9-10.5-19.8-10.5s-15.4 3.9-19.8 10.5l-87 127.6L170.7 297c-4.6-5.7-11.5-9-18.7-9s-14.2 3.3-18.7 9l-64 80c-5.8 7.2-6.9 17.1-2.9 25.4s12.4 13.6 21.6 13.6l96 0 32 0 208 0c8.9 0 17.1-4.9 21.2-12.8s3.6-17.4-1.4-24.7l-120-176zM112 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/></svg>
            </div>
        
        

            <div
              className="previewinput"
              onClick={handlepreviewinput}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                height="3vw"
                viewBox="0 -960 960 960"
                width="3vw"
                fill="#ffffffab"
              >
                <path d="M480-267.09q71.22 0 118.32-48.09 47.09-48.1 47.09-117.32 0-68.22-47.09-116.82-47.1-48.59-118.32-48.59t-118.32 48.59q-47.09 48.6-47.09 116.82 0 69.22 47.09 117.32 47.1 48.09 118.32 48.09Zm-.2-73.21q-40.63 0-66.31-25.69-25.69-25.68-25.69-65.31 0-38.62 25.69-66.01 25.68-27.39 66.31-27.39 40.62 0 66.51 27.39 25.89 27.39 25.89 66.01 0 39.63-25.89 65.31-25.89 25.69-66.51 25.69ZM175.87-145.87q-31.72 0-54.86-23.14t-23.14-54.86v-416.76q0-31.72 23.14-54.86t54.86-23.14H288.7l73.46-95.5h235.8l73.34 95.5h112.83q32.72 0 55.36 23.14t22.64 54.86v416.76q0 31.72-22.64 54.86t-55.36 23.14H175.87Z" />
              </svg>
              {previewstate ? 'enter' : 'esc'}
            </div>
          </div>

          <div onClick={handlesave} className="dialog-button">
            <img src={savedicon} alt="" />
          </div>
        </div>
      )}
    </>
  );
}

export default InputDialog;
