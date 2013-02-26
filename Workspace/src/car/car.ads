with Common;

package Car is
   use Common;

   -- definizione del tipo car
   type Car_T is
-- parametri che caratterizzano una vettura
      record
      -- marca del'auto
	 Manufacturer       : String_Ref_T;
	 -- parametro per l'accelerazione
	 Coeff_Acceleration : Coeff_Acceleration_T;
	 -- parametro per la decellerazione
	 Coeff_Deceleration : Coeff_Deceleration_T;
	 -- velocit� massima
	 Max_Speed          : Speed_T;
	 -- coefficente di tenuta di strada
	 Coeff_Roadholding  : Coeff_Roadholding_T;
	 -- consumo di carburante
	 Consumption        : Car_Consumption_T;
	 -- carburante contenuto
	 Fuel_Level         : Float;
      end record;

   -- tipo per l'accesso a una variabile di tipo Car_T
   type Car_Ref_T is access Car_T;

   -- funzione per la creazione di una automobile
   function Build_Car (Car_Filename : String) return Car_Ref_T;

end Car;