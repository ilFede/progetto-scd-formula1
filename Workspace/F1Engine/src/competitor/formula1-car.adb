package body Formula1.Car is

   -- procedura per la creazione di una automobile
   procedure Build_Car (Car_Configuration : in Configuration_T.Vector; Car : in out Car_T) is
   begin
      -- configuro l'auto coi parametri letti
      -- suppongo che all'inizio l'auto sia senza carburante,
      -- verrà inserito quando ci si posiziona nel traguardo per la partenza
      Car.Manufacturer_Ref := Car_Configuration.Element (0).all.Element (0);
      Car.Coeff_Acceleration := Coeff_Acceleration_T'Value (Car_Configuration.Element (1).all.Element (0).all);
      Car.Coeff_Deceleration := Coeff_Deceleration_T'Value (Car_Configuration.Element (2).all.Element (0).all);
      Car.Max_Speed := Real_T'Value (Car_Configuration.Element (3).all.Element (0).all);
      Car.Coeff_Roadholding := Coeff_Roadholding_T'Value (Car_Configuration.Element (4).all.Element (0).all);
      Car.Coeff_Tire_Wear := Coeff_Tire_Wear_T'Value (Car_Configuration.Element (5).all.Element (0).all);
      Car.Consumption := Float'Value (Car_Configuration.Element (6).all.Element (0).all);
      Car.Max_Fuel_Level := Float'Value (Car_Configuration.Element (7).all.Element (0).all);
      Car.Reliability := Coeff_Reliability_T'Value (Car_Configuration.Element (8).all.Element (0).all);
      Car.Fuel_Level := 0.0;
   end Build_Car;
   --+--------

end Formula1.Car;
