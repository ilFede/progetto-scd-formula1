
package Formula1.Car is

   -- definizione del tipo car
   type Car_T is
-- parametri che caratterizzano una vettura
      record
      -- marca del'auto
	 Manufacturer_Ref       : String_Ref_T;
	 -- parametro per l'accelerazione
	 Coeff_Acceleration : Coeff_Acceleration_T;
	 -- parametro per la decellerazione
	 Coeff_Deceleration : Coeff_Deceleration_T;
	 -- velocità massima
	 Max_Speed          : Real_T;
	 -- coefficente di tenuta di strada
	 Coeff_Roadholding  : Coeff_Roadholding_T;
         --coefficente usura gomme
         Coeff_Tire_Wear : Coeff_Tire_Wear_T;
	 -- consumo di carburante
	 Consumption        : Car_Consumption_T;
	 -- carburante contenuto
	 Fuel_Level         : Float;
         -- livello massimo di carburante
         Max_Fuel_Level : Float;
         -- condizioni delle gomme
         Tires_Condition : Tires_Condition_T;
      end record;

   -- tipo per l'accesso a una variabile di tipo Car_T
   -- type Car_Ref_T is access Car_T;

   -- funzione per la creazione di una automobile
   procedure Build_Car (Car_Configuration : in Configuration_T.Vector; Car : in out Car_T);

end Formula1.Car;
