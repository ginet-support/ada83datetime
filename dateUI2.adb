with Text_IO, Calendar, dates;
use Text_IO, Calendar, dates;


procedure DateUI2 is
   package Int_Io is new Integer_IO(Integer);
   use Int_Io;
   
   Copyright : constant String  := "Noam Kloos, GPL, 2016";
   
   Time1, Time2, Now : Time;
   
   Manual_Days, Days : Integer; 
   From_Year, From_Month, From_Day : Integer;
   Dummy : Duration;
   
   D2D_Year1, D2D_Month1, D2D_Day1 : Integer;
   D2D_Year2, D2D_Month2, D2D_Day2 : Integer;

   Hours1, Hours2, Minutes1, Minutes2 : Integer;
   Interval, Period : Integer;
   
   The_Result : Time_Result;
   The_Details : Detail_Results;   
   
   Choice : Integer range 0 .. 8;
   
   begin
      
      loop
	 
      Now := Today;   
      

      Put_Line("1 - Pick a day from now");
      Put_Line("2 - Pick a start date and an end date");
      Put_Line("3 - Pick a date and amount of days");
      Put_Line("4 - Pick a date to start from and select days to go or dates past");
      Put_Line("5 - Pick a start day and time and an end date and time");
      Put_Line("6 - Pick a start date and interval counting up or down for a given period");
      Put_LIne("7 - Offset in hours and minutes from now");
      Put_Line("8 - Timespan of hours and minutes");
      Put_Line("0 - Quit");
      Put("Choiche: ");Get(Choice);
      
      case Choice is 
	 when 0 => Split(Now,From_Year,From_Month,From_Day,Dummy);
	           Put("Today is: ");Put(From_Year);Put('/');Put(From_Month);Put('/');Put(From_Day);New_Line;
	           exit;
	 when 1 => Put("Year: ");Get(From_Year);Put(" Month: ");Get(From_Month);Put(" Day: ");Get(From_Day);
		       Days := Days_To_Date(From_Year,From_Month,From_Day);
		       Put(Days); Put(" Days. ");New_Line;
	 when 2 => Put("Year 1: ");Get(D2D_Year1);Put("Month 1: ");Get(D2D_Month1);Put("Day 1:");Get(D2D_Day1);New_Line; 
	           Put("Year 2: ");Get(D2D_Year2);Put("Month 2: ");Get(D2D_Month2);Put("Day 2:");Get(D2D_Day2);New_Line;
	           Manual_Days := Date_To_Date(D2D_Year1,D2D_Month1,D2D_day1,D2D_Year2,D2D_Month2,D2D_Day2);
                   Put("Time Span is "); Put(Manual_Days); Put(" Days");New_Line;New_Line;
	 when 3 => Put("Days from now: ");Get(Days);
	           Time1 := Days_From_Now(Days);
		   Split(Time1,From_Year,From_Month,From_Day,Dummy);
		   Put("Year: ");Put(From_Year);Put(" Month: ");Put(From_Month);Put(" Day: ");Put(From_Day);New_Line;
	 when 4 => Put("From Year: ");Get(From_Year);Put(" From Month: ");Get(From_Month);Put(" From Day: ");Get(From_Day);
	           Put(" Daycount: ");Get(Days);New_Line;New_Line;
	 	   Time2 := Days_From_Date(From_Year,From_Month,From_Day,Days);
                   Split(Time2,From_Year,From_Month,From_Day,Dummy);
                   Put("Year: ");Put(From_Year);Put(" Month: ");Put(From_Month);Put(" Day: ");Put(From_Day);New_Line;
	 when 5 => Put("Year 1: ");Get(D2D_Year1);Put("Month 1: ");Get(D2D_Month1);Put("Day 1:");Get(D2D_Day1);New_Line;New_Line;  
	           Put("Hour: ");Get(Hours1);Put("Minutes: ");Get(Minutes1);
	           Put("Year 2: ");Get(D2D_Year2);Put("Month 2: ");Get(D2D_Month2);Put("Day 2:");Get(D2D_Day2);New_Line;
  	           Put("Hour: ");Get(Hours2);Put("Minutes: ");Get(Minutes2);
		   
                   The_Result := Day_And_Time(D2D_Year1,D2D_Month1,D2D_Day1,Hours1,Minutes1,D2D_Year2,D2D_Month2,D2D_Day2,Hours2,Minutes2);
                   Put("Days: "); Put(The_Result.Days); Put(" Hours: ");Put(The_Result.Hours,2);Put(" Minutes: ");Put(The_Result.Minutes,2);New_Line;
                   New_LIne;
		   
         when 6 => Put("Year: ");Get(From_Year);Put("Month : ");Get(From_Month);Put("Day: ");Get(From_Day);
	           Put("Date interval (days): ");Get(Interval);Put("Period (days): ");Get(Period);New_Line;
       
                   The_Details := DateDetail(From_Year,From_Month,From_Day,Interval,Period);
       	  
                  for I in 1 .. The_Details.depth loop
	             Put("Year: "); Put(The_Details.Item(I).Year);
	             Put(" Month: "); Put(The_Details.item(I).Month);
	             Put(" Day: "); Put(The_Details.item(I).Day);New_Line;
                  end loop;		   
	 when 7 => Put("Offset in Hours: ");Get(Hours1);Put(" Offset in minutes: ");Get(Minutes1);
	           New_Line; The_Result := Date_To_Time(Hours1,Minutes1);
		   Put("Days: ");Put(The_Result.Days);Put(" Hours: ");Put(The_Result.Hours);Put(" Minutes: ");Put(The_Result.Minutes);New_Line;
	 when 8 => Put("Amount of Hours: ");Get(Hours1);Put(" Amount of minutes: ");Get(Minutes1);
	           New_Line; The_Result := Minutes_From_Date(Hours1,Minutes1);
		   Put("Days: ");Put(The_Result.Days);Put(" Hours: ");Put(The_Result.Hours);Put(" Minutes: ");Put(The_Result.Minutes);New_Line;
		   
	 when others => null;
	    
      end case;
      
 end loop;

exception
when Time_Error => Put_Line("Invalid date specified.");
when Constraint_Error => Put_Line("Date out of range.");
when others => Put_Line("unexpected error.");

       
   end DateUI2;
