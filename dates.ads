with Calendar; use Calendar;
package Dates is
   
      Copyright : constant String  := "Noam Kloos, GPL, 2016";
   
      type Time_Result is
      record
	 Days : Integer;
	 Hours : Integer range 0..23;
         Minutes : Integer range 0..59;
      end record; 
      
      type Detail_Result is
	 record
	    Year : Integer;
	    Month : Integer;
	    Day : Integer;
	 end record;
      
      type Detail_List is Array(1..25) of Detail_Result;
      
      type Detail_Results is
	 record
	    Item : Detail_List;    
	    Depth : Integer;   
	 end record;
      
   function Today return Time;
   function Date_To_Date(From_Year, From_Month, From_Day, To_Year, To_Month, To_Day : in Integer) return Integer;
   function Days_To_Date(To_Year,To_Month,To_Day : in integer) return Integer;
   function Days_From_Now(Days : in Integer) return Time;
   function Days_From_Date(Year,Month,Day,Days : in Integer) return Time;
   function Day_And_Time(From_Year,From_Month,From_Day,From_Hour,From_Minute,To_Year,To_Month,To_Day,To_Hour,To_Minute: in Integer) return Time_Result;
   function DateDetail(Year,Month,Day,Interval,Total_Days : in integer) return Detail_Results;
   function Date_To_Time(To_Hour,To_Minute: in Integer) return Time_Result;
   function Minutes_From_Date(Hours,Minutes: in Integer) return Time_Result;
   
end Dates;
  
   
