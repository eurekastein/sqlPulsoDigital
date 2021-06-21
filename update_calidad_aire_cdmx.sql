-- Actualiza todos los valores mayores iguales a una fecha X
INSERT INTO datos_pulso.calidad_aire_cdmx("index",date,pm_25, pm_10 , o3,no2,so2,co,id)
select "index", date, pm_25, pm_10, o3, no2, so2, co, id 
FROM ( 
select
id as "index", 
idx as id,
fecha::timestamp as date,
avg(pm25) as pm_25, 
avg(pm10) as pm_10,  
avg (ozono) as o3,
avg(dnitrogeno) as no2,
avg (dazufre) as so2,
avg (mcarbono) as co  
from datos_pulso.aqi
where idx = 404 -- Merced, México, Mexico
or idx = 406 --	UAM Iztapalapa, México, Mexico
or idx = 407 -- 	Pedregal, México, Mexico
or idx = 409 --	Tlahuac, México, Mexico
or idx = 410 --	FES Acatlán, México, Mexico
or idx = 411 --	Hospital General de México, México, Mexico
or idx = 3312 -- Camarones, México, Mexico
or idx = 3313 --	Nezahualcóyotl, México, Mexico
or idx = 3315 -- UAM Xochimilco, México, Mexico
or idx = 5731 --	San Mateo Atenco, Toluca, Mexico
or idx = 5866 --	Cuautitlán, México, Mexico
or idx = 5867 --	San Agustín, México, Mexico
or idx = 8527 -- Centro de Ciencias de la Atmosfera, México, Mexico
or idx = 8528 -- Tlalnepantla, México, Mexico
or idx = 8529 --	Estación de Monitoreo Cuernavaca Centro, Morelos, Mexico
or idx = 8866 -- Miguel Hidalgo, México, Mexico
or idx = 8867 --	Ajusco Medio, México, Mexico
or idx = 9156 --	Benito Juárez, México, Mexico
or idx = 9175 --	Estación de Bomberos de Cd. Sahagún, Tepeapulco, Hidalgo, Mexico
or idx = 9185 --	Biblioteca, Tizayuca, Hidalgo, Mexico
or idx = 10157	-- Santa FE, México, Mexico
or idx = 10158	-- Gustavo A. Madero, México, Mexico
or idx = 11772	-- FES Aragón, México, Mexico
or idx = 11773	-- Santiago Acahualtepec, México, Mexico
group by idx, fecha::timestamp, id) as a
where date >= '2021-05-13 00:00:00'  

-- Actualiza todos los valores mayores del día actual
INSERT INTO datos_pulso.calidad_aire_cdmx("index",date,pm_25, pm_10 , o3,no2,so2,co,id)
select "index", date, pm_25, pm_10, o3, no2, so2, co, id 
FROM ( 
select
id as "index", 
idx as id,
fecha::timestamp as date,
avg(pm25) as pm_25, 
avg(pm10) as pm_10,  
avg (ozono) as o3,
avg(dnitrogeno) as no2,
avg (dazufre) as so2,
avg (mcarbono) as co  
from datos_pulso.aqi
where idx = 404 -- Merced, México, Mexico
or idx = 406 --	UAM Iztapalapa, México, Mexico
or idx = 407 -- 	Pedregal, México, Mexico
or idx = 409 --	Tlahuac, México, Mexico
or idx = 410 --	FES Acatlán, México, Mexico
or idx = 411 --	Hospital General de México, México, Mexico
or idx = 3312 -- Camarones, México, Mexico
or idx = 3313 --	Nezahualcóyotl, México, Mexico
or idx = 3315 -- UAM Xochimilco, México, Mexico
or idx = 5731 --	San Mateo Atenco, Toluca, Mexico
or idx = 5866 --	Cuautitlán, México, Mexico
or idx = 5867 --	San Agustín, México, Mexico
or idx = 8527 -- Centro de Ciencias de la Atmosfera, México, Mexico
or idx = 8528 -- Tlalnepantla, México, Mexico
or idx = 8529 --	Estación de Monitoreo Cuernavaca Centro, Morelos, Mexico
or idx = 8866 -- Miguel Hidalgo, México, Mexico
or idx = 8867 --	Ajusco Medio, México, Mexico
or idx = 9156 --	Benito Juárez, México, Mexico
or idx = 9175 --	Estación de Bomberos de Cd. Sahagún, Tepeapulco, Hidalgo, Mexico
or idx = 9185 --	Biblioteca, Tizayuca, Hidalgo, Mexico
or idx = 10157	-- Santa FE, México, Mexico
or idx = 10158	-- Gustavo A. Madero, México, Mexico
or idx = 11772	-- FES Aragón, México, Mexico
or idx = 11773	-- Santiago Acahualtepec, México, Mexico
group by idx, fecha::timestamp, id) as a
where date >= CURRENT_DATE  
