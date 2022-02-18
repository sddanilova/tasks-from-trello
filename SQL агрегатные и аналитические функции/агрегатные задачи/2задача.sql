/*выбрать LONG_W, где самое маленькое LAT_N, но больше 38.7780 и вывести ответ с округдением до 4 знаком после запятой*/

Select Round(long_w, 4)
from station
where lat_n=(select min(lat_n)
              from station
              where lat_n>38.7780);