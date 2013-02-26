package body Car is

   -- procedura per la creazione di una automobile
   function Build_Car (Car_Filename : String) return Car_Ref_T is
   -- puntatore alla configurazione letta da file
      Configuration_Ref        : Configuration_Ref_T;
      -- marca del'auto
      Car_Manufacter_Ref       : String_Ref_T;
      -- parametro per l'accelerazione
      Car_Coeff_Acceleration   : Coeff_Acceleration_T;
      -- parametro per la decellerazione
      Car_Coeff_Deceleration   : Coeff_Deceleration_T;
      -- velocità massima
      Car_Max_Speed            : Speed_T;
      -- coefficente di tenuta di strada
      Car_Coeff_Roadholding    : Coeff_Roadholding_T;
      -- consumo di carburante
      Car_Consumption          : Car_Consumption_T;
      -- puntatore alla vettura costruita
      Car_Ref                  : Car_Ref_T;
   begin
      Configuration_Ref := Read_Config_File (Cars_Set_Path & Car_Filename); -- marca del'auto
      Car_Manufacter_Ref := Configuration_Ref.all.Element (0).all.Element (0);
      Car_Coeff_Acceleration := Coeff_Acceleration_T'Value (Configuration_Ref.all.Element (1).all.Element (0).all);
      Car_Coeff_Deceleration := Coeff_Deceleration_T'Value (Configuration_Ref.all.Element (2).all.Element (0).all);
      Car_Max_Speed := Speed_T'Value (Configuration_Ref.all.Element (3).all.Element (0).all);
      Car_Coeff_Roadholding := Coeff_Roadholding_T'Value (Configuration_Ref.all.Element (4).all.Element (0).all);
      Car_Consumption := Float'Value (Configuration_Ref.all.Element (5).all.Element (0).all);
      -- suppongo che all'inizio l'auto sia senza carburante,
      -- verrà inserito quando ci si posiziona nel traguardo per la partenza
      Car_Ref := new Car_T '(Manufacturer       => Car_Manufacter_Ref,
			     Coeff_Acceleration => Car_Coeff_Acceleration,
			     Coeff_Deceleration => Car_Coeff_Deceleration,
			     Max_Speed          => Car_Max_Speed,
			     Coeff_Roadholding  => Car_Coeff_Roadholding,
			     Consumption        => Car_Consumption,
			     Fuel_Level         => 0.0);
      return Car_Ref;
   end Build_Car;
   --+--------

end Car;
