with Text_IO, Calendar, dates;
use Text_IO, Calendar, dates;


procedure Datestest is
   package Int_Io is new Integer_IO(Integer);
   use Int_Io;
   
   Time1, Time2, Now : Time;
   
   Manual_Days, From_Days : Integer; 
   From_Year, From_Month, From_Day : Integer;
   Dummy : Duration;
   
   The_Result : Time_Result;
   
   begin
      
   Now := Today;   
      
   Manual_Days := Date_To_Date(2016,3,1,2015,5,2);
   Put("Manual_Span is "); Put(Manual_Days); Put(" Days");
   New_Line;
   From_Days := Days_To_Date(2016,7,10);
   Put("Today_Span is "); Put(From_Days); Put(" Days");New_Line;		
   Time1 := Days_From_Now(-10);
   Time2 := Days_From_Date(1966,7,10,-100);
       Split(Time1,From_Year,From_Month,From_Day,Dummy);
       Put(From_Year);Put('/');Put(From_Month);Put('/');Put(From_Day);New_Line;
       Split(Time2,From_Year,From_Month,From_Day,Dummy);
       Put(From_Year);Put('/');Put(From_Month);Put('/');Put(From_Day);New_Line;
       Split(Now,From_Year,From_Month,From_Day,Dummy);
       Put(From_Year);Put('/');Put(From_Month);Put('/');Put(From_Day);New_Line;
       The_Result := Day_And_Time(2016,8,17,16,24,2016,8,19,9,20);
       Put("Days: "); Put(The_Result.Days); Put(" Hours: ");Put(The_Result.Hours,2);Put(" Minutes: ");Put(The_Result.Minutes,2);
end Datestest;
