with Calendar, Text_IO; use Calendar, Text_IO;
with Dates; use Dates;


procedure Datedetail is
   
package Int_IO is new Integer_Io(Integer);
use Int_IO;

   
Year, Month, Day, Days, Interval, Total_Days : Integer;   
The_Year,The_Month,The_Day : Integer;

The_Seconds : Duration;

The_Time : Time;

begin
   Put("Year: ");Get(Year);
   Put("Month: ");Get(Month);
   Put("Day: ");Get(Day);
   Put("Days: ");Get(Total_Days);
   Put("Interval: ");Get(Interval);
   
   if Total_Days < 0 then
   Days := 1;   
   while Days >= Total_Days loop
   Days := Days - Interval;   
   The_Time := Days_From_Date(Year,Month,Day,Days);   
   Split(The_Time,The_Year,The_MOnth,The_Day,The_Seconds);
   Put(The_Year,4);Put('/');Put(The_Month,2);Put('/');Put(The_Day,2);
   New_Line;
   end loop;
   
   else
   Days := 0;      
   while Days <= Total_Days loop
   Days := Days + Interval;   
   The_Time := Days_From_Date(Year,Month,Day,Days);   
   Split(The_Time,The_Year,The_MOnth,The_Day,The_Seconds);
   Put(The_Year,4);Put('/');Put(The_Month,2);Put('/');Put(The_Day,2);
   New_Line;
   end loop;
   
   end if;
   
end Datedetail;
