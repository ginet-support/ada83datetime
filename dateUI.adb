with Text_IO, Calendar, dates;
use Text_IO, Calendar, dates;


procedure DateUI is
   package Int_Io is new Integer_IO(Integer);
   use Int_Io;
   
   Copyright : constant String  := "Noam Kloos, GPL, 2016";
   
   Time1, Time2, Now : Time;
   
   Manual_Days, From_Days : Integer; 
   From_Year, From_Month, From_Day : Integer;
   Dummy : Duration;
   
   The_Result : Time_Result;
   The_Details : Detail_Results;   
   
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
       Put("Days: "); Put(The_Result.Days); Put(" Hours: ");Put(The_Result.Hours,2);Put(" Minutes: ");Put(The_Result.Minutes,2);New_Line;
       The_Details := DateDetail(2016,8,21,14,92);
       	  
       for I in 1 .. The_Details.depth loop
	  Put("Year: "); Put(The_Details.Item(I).Year);
	  Put(" Month: "); Put(The_Details.item(I).Month);
	  Put(" Day: "); Put(The_Details.item(I).Day);New_Line;
       end loop;
       
       The_Result := Date_To_Time(4,34);
       Put("Time offset: ");Put("Days: ");Put(The_Result.Days);Put(" Hours: ");Put(The_Result.Hours);Put(" Minutes: ");Put(The_Result.Minutes);
       
       
   end DateUI;
