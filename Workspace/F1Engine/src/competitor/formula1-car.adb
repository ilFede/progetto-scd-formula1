package body Formula1.Car is

   -- procedura per la creazione di una automobile
   procedure Build_Car (Car_Configuration : in Configuration_T.Vector; Car : in out Car_T) is
      -- marca del'auto
      Car_Manufacter_Ref       : String_Ref_T;
      -- parametro per l'accelerazione
      Car_Coeff_Acceleration   : Coeff_Acceleration_T;
      -- parametro per la decellerazione
      Car_Coeff_Deceleration   : Coeff_Deceleration_T;
      -- velocità massima
      Car_Max_Speed            : Real_T;
      -- coefficente di tenuta di strada
      Car_Coeff_Roadholding    : Coeff_Roadholding_T;
      -- consumo di carburante
      Car_Consumption          : Car_Consumption_T;
   begin

      Car_Manufacter_Ref := Car_Configuration.Element (0).all.Element (0);
      Car_Coeff_Acceleration := Coeff_Acceleration_T'Value (Car_Configuration.Element (1).all.Element (0).all);
      Car_Coeff_Deceleration := Coeff_Deceleration_T'Value (Car_Configuration.Element (2).all.Element (0).all);
      Car_Max_Speed := Real_T'Value (Car_Configuration.Element (3).all.Element (0).all);
      Car_Coeff_Roadholding := Coeff_Roadholding_T'Value (Car_Configuration.Element (4).all.Element (0).all);
      Car_Consumption := Float'Value (Car_Configuration.Element (5).all.Element (0).all);
      -- configuro l'auto coi parametri letti
      -- suppongo che all'inizio l'auto sia senza carburante,
      -- verrà inserito quando ci si posiziona nel traguardo per la partenza
      Car.Manufacturer_Ref := Car_Manufacter_Ref;
      Car.Coeff_Acceleration := Car_Coeff_Acceleration;
      Car.Coeff_Deceleration := Car_Coeff_Deceleration;
      Car.Max_Speed := Car_Max_Speed;
      Car.Coeff_Roadholding  := Car_Coeff_Roadholding;
      Car.Consumption := Car_Consumption;
      Car.Fuel_Level := 0.0;
   end Build_Car;
   --+--------

end Formula1.Car;
