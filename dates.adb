with Calendar; use Calendar;

Package body Dates is
   function Today return time is
   begin
      return Clock;
   end Today;
   
function Date_To_Date(From_Year, From_Month, From_Day, To_Year, To_Month, To_Day : in Integer) return integer is

From_Time, To_Time : Time;

Diff_Time, Days : Integer;

Diff_Calc : Duration := 0.0;

begin

From_Time := Time_Of(From_Year,From_Month,From_Day);
To_Time := Time_Of(To_Year,To_Month,To_Day);

Diff_Calc := To_Time - From_Time;

Diff_time := Integer(Diff_Calc);
Days := Diff_time / 86_400;

return Days;

end Date_To_Date;

function Days_To_Date(To_Year,To_Month,To_Day : in integer) return integer is

The_Time, To_Time : Time;

Diff_Time, Days : Integer;

Year, Month, Day : Integer;

Sec_Today, Diff_Sec, Diff_Calc : Duration := 0.0;

begin

The_Time := Clock;

Split(The_Time,Year,Month,Day,Sec_Today);

To_Time := Time_Of(To_Year,To_Month,To_Day);

Diff_Calc := To_Time - The_Time;


if To_Time < The_Time then
   Diff_Calc := Diff_Calc - Sec_Today;
else
   Diff_Calc := Diff_Calc + Sec_Today;
end if;
  

Diff_time := Integer(Diff_Calc);
Days := Diff_time / 86_400;

return Days;

end Days_To_Date;
  
function Days_From_Now(Days : in integer) return Time is

My_Time, The_Time : Time;

The_Year, The_Month, The_Day : Integer;

My_Days : integer;

Sec_Today, Diff_Sec, Diff_Calc : Duration := 0.0;

begin

The_Time := Clock;

My_Days := Days;

My_Days := (86_400 * My_Days);

My_Time := Clock + Duration(My_Days);

Split(My_Time,The_Year,The_Month,The_Day,Sec_Today);

return My_Time;

end Days_From_Now;

function Days_From_Date(Year,Month,Day,Days : in integer) return Time is
   
My_Time : Time;

My_Year, My_Month, My_Day : Integer;

My_Days : integer;

Sec_Today, Diff_Sec, Diff_Calc : Duration := 0.0;

begin
   
My_Time := Time_OF(Year,Month,Day);

My_Days := Days;

My_Days := (86_400 * My_Days);

My_Time := My_Time + Duration(My_Days);

Split(My_Time,My_Year,My_Month,My_Day,Sec_Today);

return My_Time;

end Days_From_Date;

function Day_And_Time(From_Year,From_Month,From_Day,From_Hour,From_Minute,To_Year,To_Month,To_Day,To_Hour,To_Minute : in Integer) return Time_Result is
   
The_Result : Time_Result;   
My_Time, The_Time : Time;

Diff_Time, Days, Hours, Minutes : Integer := 0;

Diff_Calc, T1, T2 : Duration := 0.0;

begin

T1 := Duration((From_Hour * 3600) + (From_Minute * 60));
T2 := Duration((To_Hour * 3600) + (To_Minute * 60)); 

My_Time := Time_Of(From_Year,From_Month,From_Day,T1);
The_Time := Time_Of(To_Year,To_Month,To_Day,T2);

Diff_Calc := The_Time - My_Time;

Diff_time := Integer(Diff_Calc);
Days := Diff_time / 86_400;
Hours := Diff_Time / 3600 mod 24;
Minutes := Diff_Time mod 3600 / 60; 

The_Result.Days := Days;
The_Result.Hours := Hours;
The_Result.Minutes := Minutes;

return The_Result;

end Day_And_Time;

function Datedetail(Year,Month,Day,Interval,Total_Days : in integer) return Detail_Results Is
   
The_Year,The_Month,The_Day : Integer;

Days : Integer;

The_Seconds : Duration;

The_Time : Time;

Index : Integer := 0;
Out_Rec : Detail_Results;
Local_Rec : Detail_Result;


begin
   
   if Total_Days < 0 then
   Days := 1;   
   while Days >= Total_Days loop
   Index := Index + 1;
   Days := Days - Interval;   
   The_Time := Days_From_Date(Year,Month,Day,Days);   
   Split(The_Time,The_Year,The_MOnth,The_Day,The_Seconds);

   Local_Rec.Year := The_Year; Local_Rec.Month := The_Month; Local_Rec.Day := The_Day;
   Out_Rec.item(Index) := Local_Rec;
   Out_Rec.Depth := Index;
   end loop;
   
   else
   Days := 0;      
   while Days <= Total_Days loop
   Index := Index +1;
   Days := Days + Interval;   
   
   The_Time := Days_From_Date(Year,Month,Day,Days);   
   Split(The_Time,The_Year,The_MOnth,The_Day,The_Seconds);

   Local_Rec.Year := The_Year; Local_Rec.Month := The_Month; Local_Rec.Day := The_Day;
   Out_Rec.item(Index) := Local_Rec;
   
   end loop;
   
   end if;
   
   Out_Rec.Depth := Index;
   return Out_Rec;
   
end Datedetail;

function Date_To_Time(To_Hour,To_Minute: in Integer) return Time_Result is
   
The_Time : Time;
   
Days, Hours, Minutes, Seconds, Seconds_Offset : integer;   

The_Result : Time_Result;

The_Seconds : Duration; 

The_Year,The_Month,The_Day : Integer;

begin

   The_Time := Clock;
   
   Split(The_Time,The_Year,The_Month,The_Day,The_Seconds);
   
   Seconds_Offset := (To_Hour * 3600) + (To_Minute * 60);
   
   Seconds := Seconds_Offset + Integer(The_Seconds);
   
     
   Days := Seconds / 86_400;
   Hours := Seconds / 3600 mod 24;
   Minutes := Seconds mod 3600 / 60; 
  
   --  calculate day, hours, minutes from seconds
      
   The_Result.Days := Days;
   The_Result.Hours := Hours;
   The_Result.Minutes := Minutes;
   
   return The_Result;
   
end Date_To_Time;

   
function Minutes_From_Date(Hours,Minutes: in Integer) return Time_Result is
The_Result : Time_Result;   -- unfinished function

-- get target date with seconds_today offset
-- make use of Date_To_Time
-- calculate time from given offset and return target time
-- this can't work without date overflow
-- what output is wanted? a date and time after entered all parameters
-- days > currentday is a problem

Seconds, The_Days, The_Hours, The_Minutes : Integer;

begin
   
   Seconds := (Hours * 3600) + (Minutes * 60);
       
   The_Days := Seconds / 86_400;
   The_Hours := Seconds / 3600 mod 24;
   The_Minutes := Seconds mod 3600 / 60; 
  
   --  calculate day, hours, minutes from seconds
      
   The_Result.Days := The_Days;
   The_Result.Hours := The_Hours;
   The_Result.Minutes := The_Minutes;
   
   return The_Result;

end Minutes_From_Date;
   



end Dates;
