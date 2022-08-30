import Functions
import pandas as pd
import numpy as np
from sqlalchemy import create_engine
# Conexion a la base de datos en RDS
conexion = create_engine('postgresql://postgres:postgres@database-grupo5.cgmzd7suyc4v.us-east-1.rds.amazonaws.com:5432/postgres')
años=list(np.arange(1980,2021))
años=list(map(str,años))

"""
    Gas Natural, Dev: Gonzalo Posse
    Lectura de csv
"""

reserva_gas = Functions.lectura_csv('D:\data\Proyectos\Grupal\Grupal-DTS02\proyecto_grupal_consumo_energ-a_co2\datasets\Reserva de gas natural Trillion billones metros cubicos.csv')
produccion_gas = Functions.lectura_csv('D:\data\Proyectos\Grupal\Grupal-DTS02\proyecto_grupal_consumo_energ-a_co2\datasets\Produccion Gas Natural Exajoules.csv')
consumo_gas = Functions.lectura_csv('D:\data\Proyectos\Grupal\Grupal-DTS02\proyecto_grupal_consumo_energ-a_co2\datasets\Consumo Gas Natural Exajoules.csv')

"""
    Proceso de transformacion
"""
reserva_gas.drop(["2020.1", "2009-19", "2020.2"], axis=1, inplace=True)
produccion_gas.drop(["2021.1", "2011-21", "2021.2",'2021'], axis=1, inplace=True)
consumo_gas.drop(["2021.1", "2011-21", "2021.2",'2021'], axis=1, inplace=True)

reserva_gas_df = Functions.formato(reserva_gas)
produccion_gas_df = Functions.formato(reserva_gas)
consumo_gas_df = Functions.formato(consumo_gas)

reserva_gas_df = pd.melt(reserva_gas_df, id_vars='Pais',  value_vars=años, var_name="Año", value_name="Reserva de gas")
produccion_gas_df = pd.melt(produccion_gas_df, id_vars='Pais',  value_vars=años, var_name="Año", value_name="Produccion de gas")
consumo_gas_df = pd.melt(consumo_gas_df, id_vars='Pais',  value_vars=años, var_name="Año", value_name="Consumo de gas")

gas1 = pd.merge(reserva_gas_df, produccion_gas_df)
gas_final = pd.merge(gas1, consumo_gas_df)

paises= Functions.lectura_csv('D:\data\Proyectos\Grupal\Grupal-DTS02\proyecto_grupal_consumo_energ-a_co2\datasets\Codigo_pais.csv')
paises.insert(0, 'Id_pais', range(1, 1+ len(paises)))
gas_final = Functions.llenar_Id_Pais(paises,gas_final)
gas_final = Functions.paises_map(gas_final)
anios = Functions.lectura_csv('D:\data\Proyectos\Grupal\Grupal-DTS02\proyecto_grupal_consumo_energ-a_co2\datasets\years.csv')
anios.insert(0, 'Id_Años', range(1, 1+ len(anios)))

gas_final.insert(1,column='Id_Pais',value=0)
gas_final.insert(3,column='Id_anio',value=0)
gas_final = gas_final.astype({'Año':'int64'})

gas_final = Functions.cambiar_nobre_x_id_años(anios,gas_final)
gas_final.drop(["Pais", "Año"], axis=1, inplace=True)


gas_final = gas_final.rename({'Produccion de gas':'Produccion_gas','Consumo de gas':'Consumo_gas','Reserva de gas':'Reserva_Gas'},axis=1)
gas_final = gas_final.astype({'Produccion_gas':float,'Reserva_Gas':float,'Consumo_gas':float})
gas_final.insert(0, 'ID_Gas_Natural', range(1, 1+ len(gas_final)))