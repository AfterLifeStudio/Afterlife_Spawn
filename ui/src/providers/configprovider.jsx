import { createContext, useContext, useEffect, useState } from "react";
import { nuicallback } from "../utils/nuicallback";

const ConfigCtx = createContext(null);

const ConfigProvider = ({ children }) => {
  const [config, setConfig] = useState({
    Lang: {
      START: "START",
      CREDIT: "CREDITS",
      create: "CREATE",
      character: "CHARACTER",
      description:"Choose your character info and make sure to put realistic name and dob",
      firstName: "FIRST NAME",
      lastName: "LAST NAME",
      male: 'Male',
      female: 'Female',
      dob: "Date Of Birth",
      year: "Year",
      day: "Day",
      month: "Month",
      nationality: "NATIONALITY",
      searchcountry: 'Search Country',
      done: "Done",
      esc: "ESC",
      back: "BACK",
      EXIT: "EXIT",
      exit: "EXIT",
      enter: "ENTER",
      dev: "@Developed by",
      afterlife: "AfterLife Studios",
      exitgame: "EXIT GAME",
      exitdescription: "Are you sure you want to exit the game?",
      delete: "DELETE CHARACTER",
      deletedescription: "Are you sure you want to delete the character?",
      hold: "Hold",
      loadingsession: "LOADING SESSION",
      loadingscene: "LOADING SCENE",
      loadingcharacter: "LOADING CHARACTER"
    }, 
    credits: [
      {
        title: "Director",
        description: "JGUsman",
      },
      {
        title: "Lead Developer",
        description: "JGUsman",
      },
      {
        title: "UI Developer",
        description: "Hammas (my big B)",
      },
      {
        title: "UI Designer",
        description: "ofc me again",
      },
      {
        title: "IDK what",
        description: "to put here",
      },
    ],
    maxdob: 2005,
    mindob: 1950
  });

  useEffect(() => {
    nuicallback("getConfig").then((data) => setConfig(data));
  }, []);

  return (
    <ConfigCtx.Provider value={{ config, setConfig }}>
      {children}
    </ConfigCtx.Provider>
  );
};

export default ConfigProvider;

export const useConfig = () => useContext(ConfigCtx);
