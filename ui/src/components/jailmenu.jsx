import React from "react";
import { useState } from "react";
import { useNuiEvent } from "../utils/useNuiEvent";

function JailMenu() {
  const [visible, setVisible] = useState(false);

  const handlevisible = (data) => {
    setVisible(data);
  };

  useNuiEvent("Jail", handlevisible);

  return (
    <>
      {visible && (
        <div className="jail-container">
          <div className="jail-title">CONFINED</div>
          <div className="jail-description">
            PRESS <span className="enter">ENTER</span> TO START
          </div>
        </div>
      )}
    </>
  );
}

export default JailMenu;
